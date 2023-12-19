# Google Analyticcs Capstone 1: Cyclistic Case Study
Course: [Google Data Analytics Capstone: Complete a Case study](https://www.coursera.org/learn/google-data-analytics-capstone)

## Introduction
This case study is a part of the Google Data Analytics Professional Certificate. In this project I will be assuming the role of a junior data analyst on the marketing team of a fictional company called Cyclistic. In order to address the business questions assigned to me I will be employing the steps of the data analysis process Ask, Prepare, Process, Analyze, Share, and Act) to put together and share my insights. 
### Code and Data Links
Data Source: [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html) Accessed on 11/29/23

Data License: [License](https://divvybikes.com/data-license-agreement)

SQL Queries:
[Data Combining](https://github.com/kaetech/Cyclistic-Case-Study/blob/main/Data%20Combining.sql)
[Data Cleaning](https://github.com/kaetech/Cyclistic-Case-Study/blob/main/Data%20Cleaning.sql)

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

### Data Cleaning
SQL Query: [Data Cleaning](https://github.com/kaetech/Cyclistic-Case-Study/blob/main/Data%20Cleaning.sql) 
Upon preview of the data I immediately noticed that there were numerous null values in multiple columns. I ran a query to delete all rows wiht nulls and ran another query to chech for nulls in case something was missed. This step removed 1,298,357 rows. I then checked to ensure accuracy of rows in the rideable_type column to cofirm there were only three rideable types and the member_casual column to confirm only two types of members. Next I added a column for ride length which allows for a more thoroguh analysis and removal of trips that lasted less than one minute or more than a day. This step removed 44,797 rows for a total of 1,343,154 rows removed as a result of the cleaning process. Columns for start and end station id were also removed as they were not deemed necessary for analysis. 
## Analyze and Share
####Analysis question: How do annual members and casual riders use Cyclistic bikes differently?
To start off the two groups are compared by bike type usage. 

![Pie charts displaying bike type usage between casual riders and members](https://github.com/kaetech/Cyclistic-Case-Study/blob/main/images/Screenshot%202023-12-14%20015501.png)

In total members account for almost 60% percent of rides and casual riders just over 40%. Percentages seen on individual pie charts for each bike are representative of total  bike usage. The classic bike is the most used bike of the three options with the electric bike falling behind as a close second. Docked bikes are exclusively used by casual riders although by just a small segment of them, this could be a key detail to consider after further analysis. 

Next let's take a look at trip data distributed by months and days of the week. 

![Line Graph showing how many trips members and casual riders took throughout the year 2022](https://github.com/kaetech/Cyclistic-Case-Study/blob/main/images/Screenshot%202023-12-14%20014643.png)

Overall Cyclistic members are taking more trips than casual riders. Over the course of the year both groups tend to follow the same trend of using the bikes more during the spring and summer months than the fall and winter with peak usage occurring in July.  However, there is an interesting difference in trends between these two groups. Members use the bikes almost twice as often as casual riders during the week, which can be explained by people riding the bikes to and from work. On the weekends casual rider usage increases significantly and member usage drops. 

Now to take a look at trip duration over months and days of the week.

![Trip duration over months and days of the week](https://github.com/kaetech/Cyclistic-Case-Study/blob/main/images/Screenshot%202023-12-14%20014616.png)

Interestingly enough we see that casual riders spend significantly more time on trips than members. With peak ride averages in the spring months and weekends. Which would suggest a trend of casual riders using the bikes for leisurely purposes in their spare time. Member usage is fairly consistent across the board with slightly longer trips in the summer months and on the weekends but only by a few minutes. Suggesting that members are more intentional and have some sort of routine with their rides which tracks with the other data that we have come across so far. 

Lastly the locations of starting and ending stations and how frequently they are used will be analyzed for key differences.

![Starting and ending location bike rip map](https://github.com/kaetech/Cyclistic-Case-Study/blob/main/images/Screenshot%202023-12-13%20184424.png)

Causal riders start their rides almost exclusively along the coast line where there are a number of attractions including but not limited to museums, beaches, parks, and harbor points. Members start their rides away from the coast line in the vicinity of academic institutions, churches, restaurants, hospitals, train stations, etc. The same trends are seen with end station popularity. There is some variance compared to the starting stations considering the number of points on the map however we see more of the same. These findings further reinforce the narrative that data has been building. That casual riders use bikes for leisurely activities and members rely on the bikes for more routine and daily activities. 


| Members | Casual Riders |
| --- | --- |
| Make up the majority of Cyclitic users accounting for 59.7% of rides | Ride mostly during the spring and summer months, with some rides during the week but more rides on the weekend | 
| Ride bikes more consistently especially during the week but spend less time per ride, about half the time of casual riders | Use bikes less frequently but spend almost twice as long on each ride |
| Start and end their trips near academic institutions, hospitals, residential commercial areas | Start and end their trips along the Chicago coastline frequenting beaches, parks, museums, and other tourist attractions |

## Act
Considering the key differences the data has revealed between members and casual riders here are my recommendations:
1. Creating marketing and promotional material in the spring/summer months and weekend deals.
1. Implementing seasonal or semi-annual memberships to target peak times when casual riders use the service.
1. Introducing a loyalty program of some sort rewards riders for time spent riding but only allowing members to enjoy those rewards. 
1. Partnering with local attractions along the coast to provide value to casual riders and incentivize membership.
