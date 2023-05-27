library(shiny)

ui <- fluidPage(
  titlePanel(title = h4("Download base plot in Shiny-an example", align = "center")),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "var1", label = "Select the X variable", choices = c("Sepal.Length"=1,"Sepal.Width"=2,"Petal.Length"=3,"Petal.Width"=4)),
      selectInput(inputId = "var2", label = "Select the Y variable", choices = c("Sepal.Length"=1,"Sepal.Width"=2,"Petal.Length"=3,"Petal.Width"=4)),
      radioButtons(inputId = "var", label = "Select the file type", choices = c("png","pdf"), selected = "png")
    ),
    mainPanel(
      plotOutput("out")
    )
  )
)

server <- function(input, output, session) {
  output$out <- renderPlot({
    x <- iris[,as.numeric(input$var1)]
    y <- iris[,as.numeric(input$var2)]
    
    plot(x,y)
  })
  
}

shinyApp(ui, server)
