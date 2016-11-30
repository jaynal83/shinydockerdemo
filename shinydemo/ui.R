library(shiny)

shinyUI(
fluidPage(
  sidebarPanel(
    uiOutput("v1")
  ),
  fluidRow(
    plotOutput("plot1")
  )
)
)
