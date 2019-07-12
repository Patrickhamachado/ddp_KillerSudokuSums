
library(shiny)
library(markdown)
library(shinythemes)

navbarPage(
    title = 'Sums of killer Sudoku',
    # theme = shinytheme("paper"),
    tabPanel('App',
             h3('Sums of killer Sudoku'),
             numericInput("sums",
                          "Sum needed:",
                          min = 3, max = 45,
                          value = 3,
                          step = 1),
             numericInput("digits",
                          "Number of positions:",
                          min = 2, max = 9,
                          value = 2,
                          step = 1),

             checkboxGroupInput("excluded",
                                "Numbers to exclude:",
                                1:9, selected = NULL,
                                inline = TRUE),

             checkboxGroupInput('included',
                                'Mandatory numbers:',
                                choices = 1:9,
                                inline = TRUE),

             h3('Posible combinations:'),
             tableOutput("posible.sums"),
             HTML("<a href='http://www.sudokumania.com.ar/juegos/killer'>Play Killer Sudoku!</a>")

             ),
    tabPanel('Help',  includeMarkdown("help.Rmd"))
)

