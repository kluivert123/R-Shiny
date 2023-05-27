#First plot in shiny
library(shiny)

ui <- fluidPage(
  titlePanel(title = h4("Demonstration of renderPlot()- histogram", align = "center")),
  sidebarLayout(
    sidebarPanel(
      selectInput("var","1. Select the quantitave Variable",c("Sepal.Length" = 1, "Sepal.Width" = 2,
                      "Petal.Length"= 3, "Petal.Width" =4             )),
      sliderInput("slide", "2. Select the number of histogram BINs by using the slider below", 
                  min = 5, max = 24, value = 11),
      radioButtons("buttons","3. Select the color of histogram",c("Green","Red","Yellow"), 
                   selected = "Green")
    ),
    mainPanel(
      plotOutput("out")
    )
  )
  
)

server <- function(input, output, session) {
  output$out <-renderPlot({
    colm <- as.numeric(input$var)
    hist(iris[,colm], breaks = seq(0, max(iris[,colm]), l = input$slide + 1), col = input$buttons, main = "Histogram of Iris dataset",
         xlab=names(iris[colm]))
  })
  
}

shinyApp(ui, server)