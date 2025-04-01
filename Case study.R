library(ggplot2)
library(dplyr)
library(tidyverse)
library(lubridate)
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
nrow(daily_activity)
nrow(sleep_day)
nrow(weight_log)

daily_activity %>%
  select(SedentaryMinutes,
         TotalSteps,
         Calories) %>% 
  summary()
daily_activity %>%
  group_by(Id) %>%
  summarise(mean_steps = mean(TotalSteps, na.rm=TRUE))

weight_log %>%
  group_by(Id) %>%
  summarise(mean(BMI, na.rm=TRUE))
mean_weight = 27.975
#According to WHO, this means that majority of the users are overweight or above,
#indicating an unhealthy BMI 

sleep_day %>% 
  select(TotalSleepRecords,
         TotalMinutesAsleep,
         TotalTimeInBed) %>%
  summary()
sleep_day %>%
  group_by(Id) %>%
  summarise(mean(TotalMinutesAsleep, na.rm=TRUE))


#Plotting the graph
#For daily activity
ggplot(data=daily_activity, aes(x=TotalSteps, y= SedentaryMinutes))+geom_point()+geom_smooth()
#There is a negative exponential relationship between the users' total steps and sedentary minutes
#There is also an outlier that exceeded the 30000 step count
ggplot(data=daily_activity, aes(x=TotalSteps, y=Calories))+ geom_point() + geom_smooth()
#In general, there is a positive exponential relationship between the users' total steps and calories 
ggplot(data=daily_activity, aes(x=ActivityDate, y=TotalSteps))+ geom_boxplot()
#From the graph, we can see that the mean number of steps taken each day are generally below 10000

#For sleep day
ggplot(data=sleep_day, aes(x=TotalMinutesAsleep)) +geom_histogram(bins=60, na.rm=TRUE)
#From this graph, we can see most of the users seem around the 400-550 minutes range
#However there is still a considerable cluster that fall below 400mintues, meaning that they are not getting enough sleep
ggplot(data=sleep_day, aes(x=TotalMinutesAsleep, y=TotalTimeInBed)) +geom_point()
#In general, there is a positive linear relationship between the total time in bed and total minutes asleep





