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
> #Identifying distinct values 
> n_distinct(daily_activity$Id)
[1] 33
> n_distinct(sleep_day$Id)
[1] 24
> n_distinct(weight_log$Id)
[1] 8
```

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

 Calories    SedentaryMinutes   TotalSteps   
 Min.   :   0   Min.   :   0.0   Min.   :    0  
 1st Qu.:1828   1st Qu.: 729.8   1st Qu.: 3790  
 Median :2134   Median :1057.5   Median : 7406  
 Mean   :2304   Mean   : 991.2   Mean   : 7638  
 3rd Qu.:2793   3rd Qu.:1229.5   3rd Qu.:10727  
 Max.   :4900   Max.   :1440.0   Max.   :36019
```
From the table, we can see that the mean total steps each day is 7638, which is lower than the World Health Organisation (WHO) recommended 10,000 steps per day

2. Total minutes asleep against the total time in bed

```
sleep_day %>% 
  select(TotalSleepRecords,
         TotalMinutesAsleep,
         TotalTimeInBed) %>%
  summary()

 TotalSleepRecords TotalMinutesAsleep TotalTimeInBed 
 Min.   :1.000     Min.   : 58.0      Min.   : 61.0  
 1st Qu.:1.000     1st Qu.:361.0      1st Qu.:403.0  
 Median :1.000     Median :433.0      Median :463.0  
 Mean   :1.119     Mean   :419.5      Mean   :458.6  
 3rd Qu.:1.000     3rd Qu.:490.0      3rd Qu.:526.0  
 Max.   :3.000     Max.   :796.0      Max.   :961.0  
```
3. The user's overall BMI

```
weight_log %>%
  group_by(Id) %>%
  summarise(mean(BMI, na.rm=TRUE))

 Id `mean(BMI, na.rm = TRUE)`
       <dbl>                     <dbl>
1 1503960366                      22.6
2 1927972279                      47.5
3 2873212765                      21.6
4 4319703577                      27.4
5 4558609924                      27.2
6 5577150313                      28  
7 6962181067                      24.0
8 8877689391                      25.5
```
The mean weight between these 8 users is 27.975, which classifies most of them under the overweight category.
