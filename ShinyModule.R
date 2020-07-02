library('move')
library('shiny')
library('maps')

shinyModuleUserInterface <- function(id, label,num=2) {
  ns <- NS(id)
  
  tagList(
    titlePanel("Simple map of the positions of your animals"),
    sliderInput(inputId = ns("num"), 
                label = "Choose a margin size", 
                value = num, min = 1, max = 30),
    plotOutput(ns("map"))
  )
}

shinyModuleConfiguration <- function(id, input) {
  ns <- NS(id)
  configuration <- list()

  configuration
}

shinyModule <- function(input, output, session, data,num=2) {
  dataObj <- reactive({ data })
  current <- reactiveVal(data)
  
  lonObj <- reactive({
    coordinates(dataObj())[,1]
  })
  latObj <- reactive({
    coordinates(dataObj())[,2]
  })
  
  output$map <- renderPlot({
    map("world",xlim=c(min(lonObj())-input$num,max(lonObj())+input$num),ylim=c(min(latObj())-input$num,max(latObj())+input$num))
    points(lonObj(),latObj(),col=factor(trackId(current())),pch=20)  
  })
  
  return(reactive({ current() }))
}