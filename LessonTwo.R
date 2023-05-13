library(shiny)

# UI for the application
ui <- fluidPage(
  titlePanel("Demostration of textInput widget in shiny"),
  sidebarLayout(
    sidebarPanel(("Enter the personal information"),
                 textInput("name","Enter your name",),
                 textInput("age","Enter your age","")
    ),
    mainPanel(("Personal Information"),
              textOutput("myname"),
              textOutput("myage")
              
    
  ))
  
)

#The logic for the application
server <- function(input, output){
  output$myname <- renderText(input$name)
  output$myage <- renderText(input$age)
  
  
  
}

# Run the application 
shinyApp(ui = ui, server = server)