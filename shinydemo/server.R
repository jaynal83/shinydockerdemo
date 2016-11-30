 library(shiny)
library(ggplot2)
shinyServer(function(input, output){

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
)
