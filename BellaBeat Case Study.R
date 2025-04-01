library(ggplot2)
library(dplyr)
library(tidyverse)
#Import the data
daily_activity = read.csv("dailyActivity_merged.csv")
sleep_day= read.csv("sleepDay_merged.csv")
weight_log = read.csv("weightLogInfo_merged.csv")

#summary of the raw data
View(daily_activity)
View(sleep_day)
View(weight_log)

head(daily_activity)
head(sleep_day)
head(weight_log)

colnames(daily_activity)
colnames(sleep_day)
colnames(weight_log)

#Identifying distinct values 
n_distinct(daily_activity$Id)
n_distinct(sleep_day$Id)
n_distinct(weight_log$Id)

daily_activity %>%
  select(Calories,
         SedentaryMinutes,
         TotalSteps) %>% 
  summary()

sleep_day %>% 
  select(TotalSleepRecords,
         TotalMinutesAsleep,
         TotalTimeInBed) %>%
  summary()

weight_log %>%
  select(WeightKg,
         Fat,
         BMI) %>%
  summary()

#Plotting the graph
#For daily activity
ggplot(data=daily_activity, aes(x=TotalSteps, y= SedentaryMinutes))+geom_point()+geom_smooth()
#There is a negative exponential relationship between the users' total steps and sedentary minutes
#There is also an outlier that exceeded the 30000 step count

#For sleep day
ggplot(data=sleep_day, aes(x=TotalMinutesAsleep)) +geom_histogram(bins=60, na.rm=TRUE)
#From this graph, we can see the highest frequency of the user's sleeping duration is around the 400-550 minutes range
#However there is still a considerable cluster that fall below 400mintues, meaning that they are not getting enough sleep

