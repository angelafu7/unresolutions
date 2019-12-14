library(shiny)
library(tidyverse)
library(readxl)
library(janitor)
library(readr)

df <-read_rds("graphs.rds")

ui <- fluidPage(
    navbarPage("United Nations Resolutions",
               tabPanel("Voting Distributions",
                        tabsetPanel(
                            tabPanel("Yes Votes",
                                     h5("The plot depicts the number of 'Yes' votes for each UN resolution"),
                                     br(),
                                     plotOutput("yes")
                            ),
                            tabPanel("No Votes",
                                     h5("The plot depicts the number of 'No' votes for each UN resolution"),
                                     br(), 
                                     plotOutput("no")
                            ),
                            tabPanel("Abstentions",
                                     h5("The plot depicts the number of Abstentions for each UN resolution"),
                                     br(),
                                     plotOutput("abstain")
                            )
                        )
               ),
               tabPanel("UN Activity",         
                        tabsetPanel(
                            tabPanel("Activity by Year",
                                     h5("The plot depicts the number of UN resolutions passed every year since 1986"),
                                     br(),
                                     plotOutput("year")
                            ),
                            tabPanel("Activity by Session",
                                     h5("The plot depicts the number of UN resolutions passed every UN session since 1986"),
                                     br(),
                                     plotOutput("session")
                            )
                        )
                        
               ),
               tabPanel("About",
                        mainPanel(
                            h2("Summary"),
                            h5("These visualizations depict trends among UN resolutions from the past 33 years"),
                            h2("Background"),
                            h5("Data about UN resolutions comes from Harvard dataverse"),
                            h2("Creator"),
                            h5("I am a senior at Harvard College studying Government. Feel free to reach out to me at afu@college.harvard.edu with any questions.")
                        )
               )
    )
)

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
    
    output$session <- renderPlot(
        df$session
    )
}

#Run the application

shinyApp(ui, server)