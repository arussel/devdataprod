shinyUI(fluidPage(
  titlePanel("How many students have earned rewards ?"),
  p("Player are given rewards to motivate them going further into the game. 
    But giving to many rewards to quickly might lead to player not being interested anymore. 
    This histogram analyses the data from iOs application which gives up to 4 rewards to a player.
    It shows how many players have won how many rewards, depending on how long they played."),
  p("You can move the slider to select only players who have played that many minutes The histogram
    will be updated to show only players who played more than the selected number of minutes"),
  plotOutput('rewHist'),
  sliderInput('threshold', 'Filter by number of minutes played',value = 0, min = 0, max = maxTimePlayed)
))