library(shiny)
library(DT)

ui <- fluidPage(
    titlePanel("English Vocabulary for SAT, GRE, TOEFL, GMAT, CAT, IELTS, and More"),
    sidebarLayout(
    sidebarPanel(
        tabsetPanel(
        tabPanel("Description",
            p("This app helps users efficiently filter and study essential vocabulary for standardized tests like SAT, GRE, TOEFL, GMAT, CAT, IELTS, and others."),
            p("Created by: ", a("Nguyen Hoang Bao", href = "https://hbaon.github.io/", target = "_blank"), "(hbaon7@gmail.com)"),
            p("Copyright © 2025. All rights reserved."),
            p("Version 1.0.0")
        )
        )
    ),
    mainPanel(
        tabsetPanel(
        tabPanel("SAT",
            uiOutput("commentsSAT"),
            DTOutput("dbSAT"),
        ),
        tabPanel("GRE",
            uiOutput("commentsGRE"),
            DTOutput("dbGRE"),
        ),
        tabPanel("GMAT",
            uiOutput("commentsGMAT"),
            DTOutput("dbGMAT"),
        ),
        tabPanel("CAT",
            uiOutput("commentsCAT"),
            DTOutput("dbCAT"),
        ),
        tabPanel("TOEFL",
            uiOutput("commentsTOEFL"),
            DTOutput("dbTOEFL"),
        ),
        tabPanel("IELTS",
            uiOutput("commentsIELTS"),
            DTOutput("dbIELTS"),
        ),
        )
    )
    )

)

server <- function(input, output) {
    output$commentsSAT <- renderUI({
        tags$div(
            tags$h3("SAT"),
            tags$p("The SAT is a standardized test for college admissions in the U.S., measuring reading, writing, and math skills, scored on a 400-1600 scale."),
            tags$p("It consists of reading (analyzing passages), writing and language (editing texts), and math (algebra, geometry, and more)."),
            tags$p("SAT scores are crucial for college applications, and studying can improve your chances of admission."),
            tags$p(HTML('Explore the SAT vocabulary list from <b><a href="https://img.sparknotes.com/content/testprep/pdf/sat.vocab.pdf" target="_blank">sparknotes</a></b> below.')),
            tags$p(HTML('The list contains 1000 words, totaling 1046 meanings due to multiple definitions for some words.'))
        )
    })
    output$dbSAT <- renderDT({
        data <- read.csv("sat.csv")
        datatable(data, filter = list(position = 'top', clear = FALSE), options = list(pageLength = 200, searchCols = list(replicate(ncol(data), NULL)))
        )
    })
    
    output$commentsGRE <- renderUI({
        tags$div(
            tags$h3("GRE"),
            tags$p("The GRE is a standardized test for graduate school admissions in the U.S., measuring verbal reasoning, quantitative reasoning, and analytical writing skills, scored on a 260-340 scale."),
            tags$p("It consists of verbal reasoning (analyzing and evaluating written material), quantitative reasoning (solving problems involving arithmetic, algebra, geometry, and data analysis), and analytical writing (articulating complex ideas clearly and effectively)."),
            tags$p("GRE scores are crucial for graduate school applications, and studying can improve your chances of admission."),
            tags$p(HTML('Explore the GRE vocabulary list from <b><a href="https://www.ets.org/s/gre/pdf/gre_list_of_words.pdf" target="_blank">ets</a></b> below.')),
        )
    })
    output$dbGRE <- renderDT({
        data <- read.csv("sat.csv")
        datatable(data, filter = list(position = 'top', clear = FALSE), options = list(pageLength = 200, searchCols = list(replicate(ncol(data), NULL)))
        )
    })

    output$commentsGMAT <- renderUI({
        tags$div(
            tags$h3("GMAT"),
            tags$p("The GMAT is a standardized test that is required for admission to many business schools in the United States and other countries. It tests students' knowledge of verbal reasoning, quantitative reasoning, integrated reasoning, and analytical writing."),
            tags$p("The GMAT is scored on a scale of 200-800 for the verbal and quantitative sections, 0-6 for the analytical writing section, and 1-8 for the integrated reasoning section. The verbal reasoning section tests students' ability to analyze and evaluate written material. The quantitative reasoning section tests students' ability to solve problems involving arithmetic, algebra, geometry, and data analysis. The integrated reasoning section tests students' ability to analyze and synthesize information from multiple sources. The analytical writing section tests students' ability to articulate complex ideas clearly and effectively."),
            tags$p("Studying for the GMAT can help students improve their test scores and increase their chances of getting into the business school of their choice. Many business schools require students to submit GMAT scores as part of their application.")
        )
    })
    output$dbGMAT <- renderDT({
        data <- read.csv("sat.csv")
        datatable(data, filter = list(position = 'top', clear = FALSE), options = list(pageLength = 200, searchCols = list(replicate(ncol(data), NULL)))
        )
    })

    output$commentsCAT <- renderUI({
        tags$div(
            tags$h3("CAT"),
            tags$p("The CAT is a standardized test that is required for admission to many business schools in India. It tests students' knowledge of verbal ability, quantitative ability, data interpretation, and logical reasoning."),
            tags$p("The CAT is scored on a scale of 0-300, with 0-100 points for each of the three sections: verbal ability and reading comprehension, data interpretation and logical reasoning, and quantitative ability."),
            tags$p("The CAT is an important part of the business school admissions process in India, and many business schools require students to submit CAT scores as part of their application. Studying for the CAT can help students improve their test scores and increase their chances of getting into the business school of their choice.")
        )
    })
    output$dbCAT <- renderDT({
        data <- read.csv("sat.csv")
        datatable(data, filter = list(position = 'top', clear = FALSE), options = list(pageLength = 200, searchCols = list(replicate(ncol(data), NULL)))
        )
    })

    output$commentsTOEFL <- renderUI({
        tags$div(
            tags$h3("TOEFL"),
            tags$p("The TOEFL is a standardized test that is required for admission to many English-speaking universities and colleges. It tests students' ability to understand and use English at the university level."),
            tags$p("The TOEFL is scored on a scale of 0-120, with 0-30 points for each of the four sections: reading, listening, speaking, and writing. The reading section tests students' ability to understand and analyze written passages. The listening section tests students' ability to understand spoken English. The speaking section tests students' ability to speak English fluently and coherently. The writing section tests students' ability to write essays in English."),
            tags$p("Studying for the TOEFL can help students improve their test scores and increase their chances of getting into the university of their choice. Many universities require students to submit TOEFL scores as part of their application.")
        )
    })
    output$dbTOEFL <- renderDT({
        data <- read.csv("sat.csv")
        datatable(data, filter = list(position = 'top', clear = FALSE), options = list(pageLength = 200, searchCols = list(replicate(ncol(data), NULL)))
        )
    })

    output$commentsIELTS <- renderUI({
        tags$div(
            tags$h3("IELTS"),
            tags$p("The IELTS is a standardized test that is required for admission to many English-speaking universities and colleges. It tests students' ability to understand and use English at the university level."),
            tags$p("The IELTS is scored on a scale of 0-9, with 0-9 points for each of the four sections: reading, listening, speaking, and writing. The reading section tests students' ability to understand and analyze written passages. The listening section tests students' ability to understand spoken English. The speaking section tests students' ability to speak English fluently and coherently. The writing section tests students' ability to write essays in English."),
            tags$p("Studying for the IELTS can help students improve their test scores and increase their chances of getting into the university of their choice. Many universities require students to submit IELTS scores as part of their application.")
        )
    })
    output$dbIELTS <- renderDT({
        data <- read.csv("sat.csv")
        datatable(data, filter = list(position = 'top', clear = FALSE), options = list(pageLength = 200, searchCols = list(replicate(ncol(data), NULL)))
        )
    })
}

shinyApp(ui = ui, server = server)
