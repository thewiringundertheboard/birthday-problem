library(tidyverse)

# number of possible people in the room
numberOfPeople <- 1:3000

# create a ibble to store the data
sameBirthdayData <- tibble('number' = 1:length(numberOfPeople), 'probability' = seq(0,1,length(numberOfPeople)))

# function to return the probability for 
# any number of people having the same birthday as me
calculateProbabilityOfSameBirthday <- function(personNumber) {
  probability <- 1 -(364 / 365)^personNumber
}

# apply to all of the people and return a vector of the probabilities
sameBirthdayData$probability <- unlist(
  lapply(numberOfPeople, calculateProbabilityOfSameBirthday)
)

# plot the data
sameBirthdayData %>%  ggplot(aes(x=number,y=probability)) + 
  geom_line(color='red') +
  scale_x_continuous(breaks=seq(0,length(numberOfPeople),by=200)) +
  labs(x='Number of People', y='Probability') + 
  ggtitle('The probability of two people having the same birthday as me') +
  theme(plot.title = element_text(hjust = 0.5))

