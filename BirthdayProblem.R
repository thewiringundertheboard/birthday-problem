library(tidyverse)

# number of possible people in the room
numberOfPeople <- 0:99

# create a ibble to store the data
sameBirthdayData <- tibble('number' = 1:length(numberOfPeople), 'probability' = seq(0,1,length(numberOfPeople)))

# function to return the probability for 
# any number of people having the same birthday
calculateProbabilityOfSameBirthday <- function(personNumber) {
    probability <- 1 - prod(365:(365 - personNumber) / 365)
}

# apply to all of the people and return a vector of the probabilities
sameBirthdayData$probability <- unlist(
  lapply(numberOfPeople, calculateProbabilityOfSameBirthday)
)

# plot the data
sameBirthdayData %>% ggplot(aes(x=number,y=probability)) + 
  geom_line(color='red') +
  scale_x_continuous(breaks=seq(0,length(numberOfPeople),by=10)) +
  labs(x='Number of People', y='Probability') + 
  ggtitle('The Birthday Problem: the probability of two people having the same birthday') +
  theme(plot.title = element_text(hjust = 0.5))

