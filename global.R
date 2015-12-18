
rewards <- read.csv("rewards.csv", header = FALSE, sep = ";")

l <- function(s){
  length(unlist(strsplit(s, split=",")))
}

maxTimePlayed <- ceiling(max(rewards$V3) / 60)

num_rewards <- lapply(as.vector(rewards$V2), l)

rewards$num_rewards <- num_rewards

numRewardsArr <- function(threshold) {
  filteredRewards <- rewards[rewards$V3 > threshold,]
  as.numeric(unlist(filteredRewards$num_rewards))
}

numRewHist <- function(threshold, title) {
  tInSecond <- threshold * 60
  hist(numRewardsArr(tInSecond), main = title, 
       xlab = "Number of Rewards", 
       ylab = "Number of Students",
       breaks = c(0,1,2,3,4))
}


typeRewards <- read.csv("rewardTypes.csv", header = TRUE, sep = ";")
totalPlayTime <- aggregate(typeRewards$timePlayed, list(typeRewards$id), FUN = sum)
colnames(totalPlayTime) <- c("id", "totalTimePlayed")
typeRewards <- merge(typeRewards, totalPlayTime, by = "id")

rewardsFilteredRewardType <- function(rewardType) {
  typeRewards[typeRewards$rewardType == rewardType,]
}

rewardPlot <- function(rewardType, title) {
  filteredRewards <- rewardsFilteredRewardType(rewardType)
  plot(filteredRewards$numRewards, 
       filteredRewards$totalTimePlayed, 
       xlab = "Number of Rewards",
       ylab = "Num of seconds played",
       main = title)
}
