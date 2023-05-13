library(shiny)

ui <- fluidPage(
  titlePanel("Demonstration of shiny widgets"),
  sidebarLayout(
    sidebarPanel(("Enter personal details"),
                 textInput("name","Enter your name",""),
                 textInput("age","Enter your age",""),
                 radioButtons("gender", "select gender",list("Male","Female"),"")
                 
                 ),
                 
    mainPanel(("Personal Information"),
              textOutput("myname"),
              textOutput("myage"),
              textOutput("mygender")
  ))
)

server <- function(input, output, session) {
  output$myname <- renderText(input$name)
  output$myage <- renderText(input$age)
  output$mygender <- renderText(input$gender)
  
  
}

shinyApp(ui, server)