#How to use selectInput in shiny
library(shiny)

ui <- fluidPage(
  titlePanel("Demonstration of the selectInput UI widget in shiny"),
  sidebarLayout(
    sidebarPanel(
      selectInput("statenames","please select the state",c("Arizona","New York","Florida","Texas","California"))
    ),
    mainPanel(
      textOutput("out")
    )
  )
)

server <- function(input, output, session) {
  output$out <- renderText( input$statenames)
  
}

shinyApp(ui, server)