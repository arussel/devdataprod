
rewards <- read.csv("rewards.csv", header = FALSE, sep = ";")

l <- function(s){
  length(unlist(strsplit(s, split=",")))
}

maxTimePlayed <- ceiling(max(rewards$V3) / 60 / 60)

num_rewards <- lapply(as.vector(rewards$V2), l)

rewards$num_rewards <- num_rewards

numRewardsArr <- function(threshold) {
  filteredRewards <- rewards[rewards$V3 > threshold,]
  as.numeric(filteredRewards$num_rewards)
}

numRewHist <- function(threshold) {
  tInSecond <- threshold * 60 * 60
  hist(numRewardsArr(tInSecond), main = "Number of rewards per students", 
       xlab = "Number of Rewards", 
       ylab = "Number of Students",
       breaks = c(0,1,2,3,4))
}
