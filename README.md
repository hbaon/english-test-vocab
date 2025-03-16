# English Vocabulary App for SAT, GRE, TOEFL, GMAT, CAT, IELTS, and More

## Overview

This Shiny app allows users to explore and filter vocabulary lists commonly found in standardized tests like SAT, GRE, TOEFL, GMAT, CAT, and IELTS. The vocabulary data includes words, meanings, and example sentences, extracted from a PDF file containing 1000 common SAT words. The app enables users to search and filter words by their meanings and example sentences for more efficient studying.

## Features

- **Filter vocabulary**: Users can filter words by column (e.g., word, meaning, example sentence) or search for specific words and their meanings.
- **Interactive interface**: The app leverages Shiny and the DT library to provide an interactive, user-friendly interface for studying vocabulary.
- **Multiple meanings**: The app handles words that have multiple meanings and displays them appropriately.

## Project Steps

### 1. Download Vocabulary PDF
The first step of the project is to download the SAT vocabulary list PDF file from SparkNotes:

- [Download SAT Vocabulary PDF](https://img.sparknotes.com/content/testprep/pdf/sat.vocab.pdf)

This PDF contains 1000 common SAT words, along with their meanings and example sentences.

### 2. Extract Vocabulary Information (Python)
A Python script was written to read the PDF file and extract the vocabulary data. The extraction process includes:

- **Word extraction**: Identifying and extracting the words from the PDF.
- **Meaning extraction**: Extracting the meanings of the words, including handling cases where a word has multiple meanings.
- **Example sentence extraction**: Extracting example sentences associated with each word.

This Python script processes the data and outputs it in a structured format, which is then used in the Shiny app.

### 3. Build Shiny App (R)
An R script using the Shiny and DT libraries was developed to create an interactive web app. Key features of the Shiny app include:

- **UI Components**: The app displays the vocabulary data in an interactive table, allowing users to filter and search through words, meanings, and example sentences.
- **DT Library**: The DT library is used to create a responsive and sortable table for better user interaction.
- **Shiny Deployment**: The app was deployed on Shiny.io for easy access via the web.

## Usage

To use the app:

1. Visit the app hosted on [Shiny.io](https://hbaon.shinyapps.io/test-vocab/).
2. Navigate through the tabs (e.g., SAT, GRE, TOEFL, etc.) to explore the vocabulary lists for each exam.
3. Use the search functionality to filter words based on their meanings or example sentences.
4. Check the meanings and example sentences for each word to understand its usage in context.

## Installation (for local use)

If you want to run the app locally, follow these steps:

### Prerequisites

- **R**: Install the latest version of R from [CRAN](https://cran.r-project.org).
- **RStudio** (optional but recommended): Install from [RStudio](https://www.rstudio.com/).
- **Python**: Install Python (preferably Python 3) from [Python.org](https://www.python.org/).
- **Shiny**: Install the Shiny package in R by running the following command:

  ```r
  install.packages("shiny")
  ```

- **DT**: Install the DT package in R for creating interactive tables:

  ```r
  install.packages("DT")
  ```

### Step 1: Extract Vocabulary Data
1. Download the SAT vocabulary PDF from the [link provided above](https://img.sparknotes.com/content/testprep/pdf/sat.vocab.pdf).
2. Run the provided Python script (`extract_vocab.py`) to extract words, meanings, and example sentences from the PDF.

### Step 2: Run the Shiny App
1. Clone or download the repository with the Shiny app files.
2. Open the Shiny app R script (`app.R`) in RStudio.
3. Run the script to launch the app locally.

### Step 3: Deploy to Shiny.io
1. If you want to deploy the app to Shiny.io, follow the steps in the [Shiny.io deployment guide](https://shiny.rstudio.com/deploy/).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Vocabulary list is sourced from [SparkNotes](https://img.sparknotes.com/content/testprep/pdf/sat.vocab.pdf).
- Special thanks to the Shiny and DT libraries for making this app interactive and user-friendly.
- Created by [Nguyen Hoang Bao](https://hbaon.github.io/).