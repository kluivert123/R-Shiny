#How to use rendertable, tableoutpput
library(shiny)

ui <- fluidPage(
  titlePanel(title = h4("Iris Dataset", align = "center")),
  sidebarLayout(
    sidebarPanel(
      selectInput("var","1. Select the variable from the iris dataset", c("Sepal.Length"=1,
                                                                          "Sepal.Width" = 2, 
                                                                          "Petal.Length"=3,
                                                                          "Petal.Width"=4)),br(),
      sliderInput("bins","2. Select the number of BINs for histogram", min = 5, max = 25,
                  value = 15, animate = T),br(),
      radioButtons("color","3. Select the colour of histogram", c("Green","Red","Yellow"),
                   selected = "Green")
    ),
    mainPanel(
      tabsetPanel(type = "tab",
                  tabPanel("Summary", verbatimTextOutput("summ")),
                  tabPanel("Structure", verbatimTextOutput("str")),
                  tabPanel("Data", tableOutput("data")),
                  tabPanel("Plot", plotOutput("out"))
                  )
  
    )
  )
  
)

server <- function(input, output, session) {
  #print summary
  output$summ <- renderPrint({
    summary(iris)
  })
  #print the structure
  output$str <- renderPrint({
  str(iris)  
  })
  #selecting by columns
  output$data <- renderTable({
    colm <- as.numeric(input$var)
    iris[colm]
  })
  
  #histogram
  output$out <- renderPlot({
    colm <- as.numeric(input$var)
    hist(iris[,colm], breaks = seq(0, max(iris[,colm]), l = input$bins + 1), col = input$color, main = "Histogram of Iris dataset",
         xlab=names(iris[colm]))
  })
  
  
}

shinyApp(ui, server)