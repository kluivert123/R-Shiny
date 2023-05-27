#Using a sliderInput widget in shiny
library(shiny)

ui <- fluidPage(
  titlePanel("Demonstration of sliderInput widget in shiny"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("slide","Select the value from Slider", min = 0, max = 5,value=2,animate = T, step = 0.2)
    ),
    mainPanel(
      textOutput("out")
      
    )
  )
  
)

server <- function(input, output, session) {
  output$out <- renderText(paste("You selected the value: ", input$slide))
  
}

shinyApp(ui, server)
