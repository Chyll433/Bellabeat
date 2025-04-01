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
2. There aren't equal entries from every user, meaning that the dataset lacks information from some of its users which can lead to bias in some of the results
3. There are only around 30 users who have contributed their FitBit data, hence it is a small sample size and might not give an accurate reflection of the general populace

# Process
For this case study, data analysis and visualisation will be conducted in R

**Import of datasets:**
For this case study, the focus will be on the user's daily activities, sleep and weight 

''' 
library(ggplot2)
library(dplyr)
library(tidyverse)

daily_activity = read.csv("dailyActivity_merged.csv")
sleep_day= read.csv("sleepDay_merged.csv")
weight_log = read.csv("weightLogInfo_merged.csv")

'''



