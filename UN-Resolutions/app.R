# Load in necessary libraries

library(shiny)
library(shinythemes)
library(tidyverse)
library(readxl)
library(janitor)
library(readr)

# Load in the RDS file to add plots in

df <-read_rds("graphs.rds")

# This is the main code that adds the navigation bar and each tab (as well as sub-tabs)

ui <- fluidPage(theme = shinytheme("flatly"),
    navbarPage("United Nations Resolutions",
               tabPanel("UN Activity",         
                        tabsetPanel(
                            tabPanel("Activity by Year",
                                     h5("The plot depicts the number of UN resolutions passed every year since its inception in 1945."),
                                     br(),
                                     plotOutput("year")
                            )
                        )
               ),
               tabPanel("Voting Distributions",
                        tabsetPanel(
                            tabPanel("Yes Votes",
                                     h5("The plot depicts the number of UN resolutions that have x number of 'Yes' votes"),
                                     br(),
                                     plotOutput("yes")
                            ),
                            tabPanel("No Votes",
                                     h5("The plot depicts the number of UN resolutions that have x number of 'No' votes"),
                                     br(), 
                                     plotOutput("no")
                            ),
                            tabPanel("Abstentions",
                                     h5("The plot depicts the number of of UN resolutions that had x abstentions"),
                                     br(),
                                     plotOutput("abstain")
                            )
                        )
               ),
               tabPanel("US Voting Patterns",         
                        tabsetPanel(
                            tabPanel("Overall Votes",
                                     h5("The plot depicts the number of UN resolutions passed every year since 1986"),
                                     br(),
                                     plotOutput("usavotes")
                            ),
                            tabPanel("Palestinian Conflict",
                                     h5("The plot depicts the number of UN resolutions passed every year since 1986"),
                                     br(),
                                     plotOutput("usavotesme")
                            ),
                            tabPanel("Nuclear Weapons and Nuclear Material",
                                     h5("The plot depicts the number of UN resolutions passed every year since 1986"),
                                     br(),
                                     plotOutput("usavotesnu")
                            ),
                            tabPanel("Arms Control and Disarmament",
                                     h5("The plot depicts the number of UN resolutions passed every year since 1986"),
                                     br(),
                                     plotOutput("usavotesdi")
                            ),
                            tabPanel("Colonialism",
                                     h5("The plot depicts the number of UN resolutions passed every year since 1986"),
                                     br(),
                                     plotOutput("usavotesco")
                            ),
                            tabPanel("Human Rights",
                                     h5("The plot depicts the number of UN resolutions passed every year since 1986"),
                                     br(),
                                     plotOutput("usavoteshr")
                            ),
                            tabPanel("Economic Development",
                                     h5("The plot depicts the number of UN resolutions passed every year since 1986"),
                                     br(),
                                     plotOutput("usavotesec")
                            )
                            )
                        ),
               tabPanel("About",
                        mainPanel(
                            h2("Summary"),
                            h5("These visualizations depict trends among UN resolutions since its inception"),
                            h2("Background"),
                            h5("Information about UN resolutions comes from data uploaded to Harvard by Erik Voeten, Bailey Anton, and Michael Bailey."),
                            h2("Creator"),
                            h5("I am a senior at Harvard College studying Government. Feel free to reach out to me at afu@college.harvard.edu with any questions.")
                        )
               )
    )
)

# This gives the server information needed to render the graphs

server <- function(input,output) {
    
    output$yes <- renderPlot(
        df$yes
    )
    
    output$no <- renderPlot(
        df$no
    )
    
    output$abstain <- renderPlot(
        df$abstain
    )
    
    output$year <- renderPlot(
        df$year
    )
    
    output$usavotes <- renderPlot(
        df$usavotes
    )
    
    output$usavotesme <- renderPlot(
        df$usavotesme
    )
    
    output$usavotesnu <- renderPlot(
        df$usavotesnu
    )
    
    output$usavotesdi <- renderPlot(
        df$usavotesdi
    )
    
    output$usavotesco <- renderPlot(
        df$usavotesco
    )
    
    output$usavoteshr <- renderPlot(
        df$usavoteshr
    )
    
    output$usavotesec <- renderPlot(
        df$usavotesec
    )
    
}

# This runs the application

shinyApp(ui, server)