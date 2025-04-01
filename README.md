# Introduction
Bellabeat Case Study from Google Data Analytics

About the company:
Urška Sršen and Sando Mur founded Bellabeat, a high-tech company that manufactures health-focused sma products.
Sršen used her background as an aist to develop beautifully designed technology that informs and inspires women around
the world. Collecting data on activity, sleep, stress, and reproductive health has allowed Bellabeat to empower women with
knowledge about their own health and habits. Since it was founded in 2013, Bellabeat has grown rapidly and quickly positioned
itself as a tech-driven wellness company for women.

# Ask
**Goal: To analyze smart device usage data in order to gain insight into how consumers use non-Bellabeat smart devices
**
1. What are some trends in smart device usage?
2. How could these trends apply to Bellabeat customers?
3. How could these trends help inuence Bellabeat marketing strategy?

# Prepare
The dataset that is used for this case study is FitBit Fitness Tracker Data (CC0: Public Domain, dataset made available through Mobius). 

**Evaluation:**
1. The data is from 2016, which means that some of the data may be outdated and not reflective of current circumstances, causing low reliability
2. The data is also only from mid-April to mid-May, which means that the dataset contains about a month's worth of data, making it have low reliability
3. There aren't equal entries from every user, meaning that the dataset lacks information from some of its users which can lead to bias in some of the results
4. There are only around 30 users who have contributed their FitBit data, hence it is a small sample size and might not give an accurate reflection of the general populace

# Process
For this case study, data analysis and visualisation will be conducted in R

**Import of datasets:**

For this case study, the focus will be on the user's daily activities, sleep and weight
Thus, the merged excel sheets for the user's daily activity, sleep day and weight will be imported to R

```
library(ggplot2)
library(dplyr)
library(tidyverse)

daily_activity = read.csv("dailyActivity_merged.csv")
sleep_day= read.csv("sleepDay_merged.csv")
weight_log = read.csv("weightLogInfo_merged.csv")

```
To gain a better understanding of the data at hand, we will first summarise the data and understand its contents

```
View(daily_activity)
View(sleep_day)
View(weight_log)

head(daily_activity)
head(sleep_day)
head(weight_log)

colnames(daily_activity)
colnames(sleep_day)
colnames(weight_log)
```
Next, as there are many duplicate user ID in the data, we will identify how many distinct users there are for each dataset

```
n_distinct(daily_activity$Id)
n_distinct(sleep_day$Id)
n_distinct(weight_log$Id)
```
![image](https://github.com/user-attachments/assets/7ee2a1e0-b6c3-41ed-beee-07d1f9f755c2)

From this, we can take note that the sample size is relatively small and hence have to be aware of possible biases that could possibly skew the data analysis

# Analyze
To achieve the business objectives, we will mainly observe 

1. The trend between sendentary minutes and total steps

```
daily_activity %>%
  select(Calories,
         SedentaryMinutes,
         TotalSteps) %>% 
  summary()
```
![image](https://github.com/user-attachments/assets/234848f9-0790-4baf-b242-f0593b0096cf)

From the table, we can see that the mean total steps each day is 7638, which is lower than the World Health Organisation (WHO) recommended 10,000 steps per day


2. Total minutes asleep against the total time in bed

```
sleep_day %>% 
  select(TotalSleepRecords,
         TotalMinutesAsleep,
         TotalTimeInBed) %>%
  summary()
```
![image](https://github.com/user-attachments/assets/ebb6c8cb-a530-472b-ac31-ea74f1893f8a)

3. The user's overall BMI

```
weight_log %>%
  group_by(Id) %>%
  summarise(mean(BMI, na.rm=TRUE))
```
![image](https://github.com/user-attachments/assets/d83f68ef-4a85-41fb-a9df-7f66b008bbc9)

The mean BMI between these 8 users is 27.975, which classifies most of them under the overweight category.

# Share

Next, to observe the relationship between the sedentary minutes and total steps, we will plot a scatter graph with a best fit line.

```
ggplot(data=daily_activity, aes(x=TotalSteps, y= SedentaryMinutes))+geom_point()+geom_smooth()
```

![image](https://github.com/user-attachments/assets/99424d83-0d24-46b9-98b1-cdeeac2395a3)

To observe the relationship between the total minutes asleep against the total time in bed, we will plot histogram.

```
ggplot(data=sleep_day, aes(x=TotalMinutesAsleep)) +geom_histogram(bins=60, na.rm=TRUE)
```
![image](https://github.com/user-attachments/assets/ddf463fc-6d61-45ca-97e7-d2e15d4d1849)
