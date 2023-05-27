#Reactive function
library(shiny)

ui <- fluidPage(
  titlePanel(title = h4("Demonstration of the renderPlot()-A Histogram with iris dataset", align = "center")),
  sidebarLayout(
    sidebarPanel(
      selectInput("var","1. Select the quantitative Variable",c("Sepal.Length"=1,"Sepal.Width"=2,
                                                       "Petal.Length"=3,"Petal.Width"=4)),br(),
      sliderInput("bins","2. Select the number of histogram BINs by using the slider below",
                   min = 5, max = 25, value = 15, animate = T), br(),
      radioButtons("color","3. Select the color of histogram", c("Green","Red","Yellow"),
                   selected = "Green" )
    
    
    ),
    mainPanel(
      textOutput("colnam"),
      textOutput("color"),
      textOutput("binn"),
      plotOutput("out")
    )
  )
  
)

server <- function(input, output, session) {
  
  #reactive function
  colm <- reactive({
    as.numeric(input$var)
  })
  #Plotting the histogram
  output$out <- renderPlot({
    #colm <- as.numeric(input$var)
    hist(iris[,colm()],breaks = seq(0, max(iris[,colm()]), l = input$bins + 1), col = input$color, main = "Histogram of Iris dataset",
         xlab=names(iris[colm()]))
  })
  # the column names
  output$colnam <- renderText({
    #colm = as.numeric(input$var)
    paste("Data set variable name is ", names(iris[colm()]))
  })
   
  # color of histogram
  output$color <- renderText(paste("Color of histogram is ", input$color))
  
  # number of bins
  output$binn <- renderText(paste("Number of histogram BINS is  ", input$bins))
}

shinyApp(ui, server)