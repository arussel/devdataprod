
library(UsingR)

shinyServer(
  function(input, output) {
    output$rewHist <- renderPlot({
      numRewHist(input$threshold)
    })
    
  }
)