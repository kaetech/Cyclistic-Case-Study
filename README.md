# Google Analyticcs Capstone 1: Cyclistic Case Study
Course: [Google Data Analytics Capstone: Complete a Case study](https://www.coursera.org/learn/google-data-analytics-capstone)

## Introduction
This case study is a part of the Google Data Analytics Professional Certificate. In this project I will be assuming the role of a junior data analyst on the marketing team of a fictional company called Cyclistic. In order to address the business questions assigned to me I will be employing the steps of the data analysis process Ask, Prepare, Process, Analyze, Share, and Act) to put together and share my insights. 
### Code and Data Links
Data Source:
Data License:
SQL Queries:
[Data Combining](https://github.com/kaetech/Cyclistic-Case-Study/blob/main/Data%20Combining.sql)
Data Visualizations:
## Background and Scenario 
Cyclistic is a Chicago based bike share program that offers over 5,800 bicycles and 600 docking stations. What sets Cyclistic apart from its competitors is their inclusive variety of bikes for those unable to use a standard two-wheeled bike. This line includes reclining bikes, hand tricycles, and cargo bikes. However, the majority of users make use of our traditional bikes roughly 8% of users opt for the assistive options and about 30 percent of our total users use our bikes to commute to work daily. 
Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members. 
The finance team at Cyclistic have discovered that the future growth strategies need to be focused on increasing annual memberships as members are more profitable than casual riders. The director of marketing believes that instead of creating a marketing strategy to target new customers to gain more annual memberships, it is possible to convert current casual riders into annual members since brand awareness and customer retention has already been established. 
In order to do that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends. 
## Ask 
### Business task 
Provide insights to assist with the creation of a marketing plan to convert casual riders to members.
### Key Questions for the Marketing team 
1. How causal riders and members differ?
1. Why would casual riders buy memberships?
1. How can Cyclistic use digital media to influence casual riders to become members
   
The director of marketing has tasked me with the first question. 
## Prepare 
### Data source 
I will be using Cyclistic’s historical trip data to analyze trends between the two groups of riders. The list of datasets have been provided by Motivate International Inc. under this [license](https://divvybikes.com/data-license-agreement) and can be found here [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html). That link takes you to a AWS file server with zip files indexed by month from April 2020 to November 2023 (as of this project) with data indeed by quarter from 2013 to 2020. I will make use of data from January 2022 to December 2022 for my analysis. Each dataset is organized into 9 columns that go as follows: ride id, bike type, start time, end time, start station, end station, start location, end location, and whether the rider is a member or not. The corresponding column names are ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng and member_casual. There are no causes for concern pertaining to the privacy, security, and integrity of the data. The data has been provided by a verifiable source under the appreciate license, and there is no way to track any personal information from users. 
## Process 
Big query is my tool of choice for cleaning and combining the datasets for two reasons. The first being that excel can only manage just over one million rows of data and the data I am working with has over 5.6 million rows. Secondly, big query and sql in general is more efficient at dealing with large sets of data. However, before importing the data into big query I added two columns for the month and day of each trip respectively named ‘month’ and ‘rental_day’. 
### Data combining 
SQL Query: [Data Combining](https://github.com/kaetech/Cyclistic-Case-Study/blob/main/Data%20Combining.sql)
The 12 csv files are loaded as tables into a dataset called cyclistic_2022 and another table named “annual_data” which will house all 12 csv files adding up to 5,667,717 rows of data. After combining the data checked the table schema to ensure there were no discrepancies with column naming conventions or file types. 

![Field names and data types for the combined table called annual_data](https://github.com/kaetech/Cyclistic-Case-Study/blob/main/images/Screenshot%202023-12-14%20002041.png)
