##Ola Data Analysis using SQL

Project Description

This project contains SQL queries and views for analyzing a ride-sharing dataset, likely from a company named "Ola." The primary goal is to extract key business insights related to ride bookings, financial performance, and customer/driver behavior. The SQL script is designed to be a clear and repeatable way to generate analytical views.

### Key Features and Analysis

The SQL script creates several views that address specific business questions, including:

* **Ride Performance:**
    * Tracking successful, canceled, and incomplete bookings.
    * Analyzing reasons for canceled rides by both drivers and customers.
    * Calculating average ride distances per vehicle type.
* **Customer & Driver Insights:**
    * Identifying the top 5 customers by the number of rides.
    * Analyzing the range of driver ratings.
    * Calculating the average customer rating for each vehicle type.
* **Financials:**
    * Calculating the total value of all successful rides.
    * Identifying revenue streams by payment method (e.g., UPI, Cash).

### Usage

To use this project, you would need to execute the SQL script against a database containing the raw booking data. The script will create a series of views, which can then be queried directly to retrieve the analytical results.

##CODE
create database ola;
use ola;

#1. Retrieve all successfull bookings;
Create View Successfull_Bookings As
SELECT * FROM Bookings
where Booking_status = 'Success';
#1. Retrieve all successfull bookings;
Select * from Successfull_Bookings;

#2. Find the average ride distance for each vehicle type:
Create View ride_distance_for_each_vehicle As
SELECT Vehicle_Type, AVG(Ride_Distance)
as avg_distance FROM Bookings
GROUP BY Vehicle_Type;

#2. Find the average ride distance for each vehicle type:
Select * from ride_distance_for_each_vehicle;

#3. Get the total number of canceled rides by customers:
Create View Canceled_rides_by_customers As
SELECT COUNT(*) FROM Bookings
WHERE Booking_status = 'Canceled rides by customers';

#3. Get the total number of canceled rides by customers:
Select * from Canceled_rides_by_customers;

#4. List the top 5 customers who booked the highest number of rides:
Create View Top_5_customers As
SELECT Customer_ID, COUNT(Booking_ID) as total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;

#4. List the top 5 customers who booked the highest number of rides:
Select * from Top_5_customers;

#5. Get the number of rides canceled by drivers due to personal and car-related issues:
Create View rides_canceled_by_driver_P_C_Issues As
SELECT COUNT(*) FROM Bookings
WHERE Canceled_Rides_by_Driver = 'Personal and Car-related issues';

#5. Get the number of rides canceled by drivers due to personal and car-related issues:
Select * from rides_canceled_by_driver_P_C_Issues;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings: 
Create View Max_Min_Driver_Rating As
SELECT MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
FROM bookings WHERE Vehicle_type = 'Prime Sedan';

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings: 
Select * from Max_Min_Driver_Rating;

#7. Retrieve all rides where payment was made using UPI:
Create View Payment_Method_UPI As
SELECT * FROM bookings
WHERE Payment_Method = 'UPI';

#7. Retrieve all rides where payment was made using UPI:
Select * from Payment_Method_UPI;

#8. Find the average customer rating per vehicle type:
Create View Average_Customer_Rating_Per_Vehicle_Type As 
SELECT Vehicle_type, AVG(Customer_Rating) as avg_customer_rating
FROM bookings
GROUP BY Vehicle_type;

#8. Find the average customer rating per vehicle type:
Select * from Average_Customer_Rating_Per_Vehicle_Type;

#9. Calculate the total booking value of rides completed successfully: 
Create View total_successful_ride_Vlaue As
SELECT SUM(Booking_Value) as total_succesfull_value
FROM bookings
WHERE Booking_status = 'Success';

#9. Calculate the total booking value of rides completed successfully:
Select * from total_successful_ride_Vlaue;

#10. List all incomplete rides along with the reason:
Create View Incomplete_Rides_Reason As
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';

##Power Bi Ola Data Analytics projects
This analysis would be performed by following a typical data workflow in Power BI Desktop.

### 1. Data Connection and Transformation

The first step would be to load the `Bookings.csv` file into Power BI using the **Get Data** feature. Once loaded, you would use **Power Query** to perform essential data transformations.

* **Date Conversion**: The `Date` column would be converted from a text format to a proper date data type. This is crucial for analyzing trends over time.
* **Data Cleaning**: You would handle missing values (nulls) in columns like `Driver_Ratings` and `Customer_Rating`. Power Query can handle this by either removing rows with nulls or replacing them with a default value, though removing them is best for accurate calculations.
* **Column Typing**: You would ensure that numerical columns like `Booking_Value` and `Ride_Distance` are correctly set as whole numbers or decimals to allow for mathematical operations.

### 2. Data Modeling and Measures (DAX)

After cleaning the data, I enter the Data Model view to create custom measures using Data Analysis Expressions (DAX). These measures perform the calculations needed for your analysis.

* Ride Volume Over Time: A measure to count the total number of bookings would be created.I use a visual like a line chart to plot this count against the `Date` column.
* **Booking Status Breakdown**: I create a measure that counts the number of rows for each unique value in the `Booking_Status` column. A pie chart or bar chart would then be used to visualize the breakdown.
* **Top 5 Vehicle Types**: I create a measure to sum `Ride_Distance` (`SUM(Bookings[Ride_Distance])`). Then, a bar chart would be used with a **Top N filter** to show only the top 5 vehicle types based on this measure.
* **Average Customer Ratings**: A DAX measure `Average_Customer_Rating = AVERAGE(Bookings[Customer_Rating])` would calculate the average rating. This measure could then be used in a bar chart, grouped by `Vehicle_Type`.
* **Cancelled Rides Reasons**: I would create measures to count the occurrences of each cancellation reason found in the `Canceled_Rides_by_Customer` and `Canceled_Rides_by_Driver` columns.
* **Revenue by Payment Method**: A measure to calculate total revenue would be `Total_Revenue = SUM(Bookings[Booking_Value])`. A bar or column chart would then show this measure against the `Payment_Method` column.
* **Top 5 Customers**: Similar to the vehicle types, a measure to sum `Booking_Value` would be created. A bar chart with a **Top N filter** on the `Customer_ID` column would then display the top 5 customers by total booking value.
* **Ride Distance Distribution**: A histogram visual in Power BI would be used to plot the distribution of the `Ride_Distance` column.
* **Driver Ratings Distribution**: A histogram would also be used to show the frequency of different `Driver_Ratings`.
* **Customer vs. Driver Ratings**: Two separate DAX measures would be created to calculate the average customer rating and the average driver rating. These values would be displayed on a card visual or in a table for easy comparison.

### 3. Report and Dashboard Creation
Finally, I create an interactive report with visualizations for each of these points.

Questions (KPIs):
1. Ride Volume Over Time
2. Booking Status Breakdown
3. Top 5 Vehicle Types by Ride Distance
4. Average Customer Ratings by Vehicle Type
5. cancelled Rides Reasons
6. Revenue by Payment Method
7. Top 5 Customers by Total Booking Value
8. Ride Distance Distribution Per Day
9. Driver Ratings Distribution
10. Customer vs. Driver Ratings

   
