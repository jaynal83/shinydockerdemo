library(shiny)
library(ggplot2)
options(warn = -1)
ui<- fluidPage(
  sidebarPanel(
    uiOutput("v1")
  ),
  fluidRow(
    plotOutput("plot1")
  )
)

server <- function(input, output){
  
  dataInput <- reactive({
    dat <- read.csv("./data/dummyData.csv",as.is = T)
    dat
  })
  
  output$v1 <- renderUI({
    vnames <- names(dataInput())[grep("B",names(dataInput()))]
    selectInput("v1","Pick a variable to plot",vnames)
  })
  
  output$plot1 <- renderPlot({
    ggplot(data=dataInput(), aes_string(x=input$v1))+geom_density()+theme_bw()+
      xlab(input$v1)+ylab("Density")+ggtitle("Density plot")
  })
}

shinyApp(ui,server, options=list(shiny.host="0.0.0.0"))
