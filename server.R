
library(UsingR)

shinyServer(
  function(input, output) {
    output$rewHist <- renderPlot({
      numRewHist(input$threshold, paste("Number of rewards for user having played ", input$threshold, " minutes"))
    })
    output$typePlot <- renderPlot({
      rewardPlot(input$type, paste("Number of reward for type: ", input$type))
    })
    
  }
)