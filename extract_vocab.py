import fitz  # PyMuPDF
import requests
import re
import os
import pandas as pd

# Download PDF
pdf_url = "https://img.sparknotes.com/content/testprep/pdf/sat.vocab.pdf"
pdf_path = "sat.vocab.pdf"


def remove_until_lowercase(s):
    # Use regex to find the first lowercase letter and return the substring starting from it
    match = re.search(r'[a-z]', s)
    if match:
        return s[match.start():]
    return s  # If no lowercase letter is found, return the original string

# Extract words from PDF
def extract_vocab_entries(pdf_path):
    doc = fitz.open(pdf_path)
    vocab_dict = []

    # Regex to match words with their meanings and examples
    word_pattern = re.compile(r"(\w+)\s*(\d*\.)?\s*\((\w+)\)\s*([^()]+)\(([^)]+)\)")
    word_csv = {
        'word': [],
        'meaning': [],
        'example': []
    }
    for id_page, page in enumerate(doc):
        # if id_page == 3:
        #     break
        text = page.get_text("text")
        text = re.sub(r"\s+", " ", text).replace("SAT Vocabulary", "").replace("The 1000 Most Common SAT Words A ", "")
        # print(text)
        # example_sentences = re.findall(r'\(([^)]+ [^)]+)\)', text)
        # print(example_sentences)
        formatted_text = re.sub(r'\(([^)]+ [^)]+)\)', r'[\1]', text)
        # print(formatted_text)
        # print("===")
        words = formatted_text.split('] ')
        # print(words)
        for i, word in enumerate(words):
            # print(f"{i}: {word}")
            try:
                first_part, example_sentences = word.split(' [')[:2]
                example_sentences = example_sentences.strip()
                # print(example_sentences)
                # print(first_part)
                # removing the character in first_part until meet the first lowercase character or digit
                first_part = re.sub(r'^[^\w\d]+', '', first_part)
                # find the index of first '('
                index = first_part.index('(')
                word = first_part[:index].strip()
                # print("word:", word)
                meaning = first_part[index:].strip()
                # print("meaning:", meaning)
                # print("example_sentences:", example_sentences)
                # vocab_dict[word] = meaning
                
                # handle the case multiple meanings
                # the first character of word is a digit
                if word[0].isdigit():
                    # word is a previous word in vocab_dict
                    word = vocab_dict[-1][0]
                    vocab_dict.append((word, meaning, example_sentences))
                    # print(f"Add Meaning: -- {word} &&& {meaning} -- {example_sentences}")
                else:
                    word = remove_until_lowercase(word)
                    # the first meaning of the word but it can contains number of meaning or no number
                    # acute 1. (adj.) sharp, severe [Arnold could not walk because the pain in his foot was so acute.
                    # or adamant (adj.) impervious, immovable, unyielding [Though public pressure was intense, the President remained adamant about his proposal.
                    # so check whether 1. is in the meaning
                    # print(f"first meaning -- {word} *** {meaning}")
                    if re.search(r'\d\.', word):
                        # remove '\d\.' from word
                        word = re.sub(r'\d\.', '', word).strip()
                        # print(f"Additional: -- {word} &&& {meaning} -- {example_sentences}")
                        # word is a previous word in vocab_dict
                        # word = vocab_dict[-1][0]
                        vocab_dict.append((word, meaning, example_sentences))
                    else:
                        # print(f"Normal: -- {word} &&& {meaning} -- {example_sentences}")
                        # pass
                        vocab_dict.append((word, meaning, example_sentences))
                
                # remove all leading and trailing whitespace of vocab_dict[-1][0] until meet the first lowercase character
                # vocab_dict[-1][0] = remove_until_lowercase(vocab_dict[-1][0])
                word_csv['word'].append(vocab_dict[-1][0])
                word_csv['meaning'].append(vocab_dict[-1][1])
                word_csv['example'].append(vocab_dict[-1][2])
                print(i, vocab_dict[-1])
                print("==="*10)
            except Exception as e:
                # print(f"Error: {word} -- {e}")
                pass
    # output to 'sat.csv'
    df = pd.DataFrame(word_csv)
    df.to_csv('sat.csv', index=False)
    return vocab_dict

# Get vocabulary entries
vocab_entries = extract_vocab_entries(pdf_path)

# # Print first 10 words with meanings and examples
# for word, definitions in list(vocab_entries.items())[:10]:
#     if len(definitions) == 1:
#         print(f"{word} {definitions[0]}")
#     else:
#         print(f"{word} " + " ".join(definitions))