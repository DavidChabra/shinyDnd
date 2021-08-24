library(shiny)

shinyUI(fluidPage(
    titlePanel("See how likely every sum of the dice is!"),
    sidebarLayout(
        sidebarPanel(
            numericInput("faces", "How many faces does your die have?", 20, 2, 100),
            numericInput("howMany", "How many dice are you rolling?", 1, 1, 10),
            submitButton("Submit")
        ),
        mainPanel(
            h3("Here is your approximate histogram"),
            plotOutput("plot")
        )
    )
))
