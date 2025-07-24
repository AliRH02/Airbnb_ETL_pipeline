# Airbnb_ETL_pipeline

## Project Overview
This project implements an ETL (Extract, Transform, Load) pipeline for Airbnb listing data. The goal is to clean, process, and load the data into structured tables to enable further analysis of Airbnb market trends and host behaviors.

## Dataset Description
The dataset includes Airbnb listings data containing information about hosts, listings, prices, reviews, and locations. The data covers multiple years and is sourced from publicly available Airbnb data. The raw data contains missing values, inconsistencies, and requires cleaning before analysis.

### ETL Steps
Extraction: Load CSV files containing listings and reviews data using pandas.

Transformation: Clean data by handling missing values, correcting data types, normalizing columns, and filtering relevant rows.

Loading: Append the cleaned data into SQLite database tables for efficient querying and further analysis.

## Database Design

The database follows a **star schema**, which improves query performance and clarity for analytics. Key elements include:

- **Fact Table:** `Listings`
- **Dimension Tables:** 
  - `Host_information`
  - `Listings_location` (with generated `location_id`)
  - `Reviews`
  - `listings_review_scores`

## Lessons Learned & Challenges
During this project, I worked with data that presented several common data quality issues. Here are some key challenges and how I addressed them:

- **Duplicate Host and Listing IDs:**  
  I discovered that `host_id` and `listing_id` were repeated across the dataset. While neither was unique on its own, the combination of both provided a reliable way to identify distinct listings by the same host. I used this combination to maintain data integrity during transformations.

- **Missing Review Scores:**  
  Some listings were missing `review_scores_rating` and other review fields. Instead of dropping these rows, I chose to retain them and set missing values to `NaN`. This allowed me to preserve listings that may still be useful for analysis even if some review data was unavailable.

- **Repeated Locations:**  
  Multiple listings shared identical `latitude` and `longitude`. I normalized these using a generated `location_id` to reduce redundancy and support location-based analysis.

- **Star Schema Design:**  
  This was a valuable exercise in designing a normalized schema that supports scalable querying and aligns with dimensional modeling best practices. 

This experience helped me practice data cleaning techniques, make decisions under ambiguity, and prepare datasets for downstream analysis.


## Tools Used
- Python 
- Pandas: data manipulation
- NumPy: numerical operations
- SQLite: database management
- Jupyter Notebook: Development environment

## 
- **Source:** [Kaggle – Airbnb Listings & Reviews](https://www.kaggle.com/datasets/mysarahmadbhat/airbnb-listings-reviews)
- **License:** [CC0 1.0 Public Domain Dedication](https://creativecommons.org/publicdomain/zero/1.0/)
