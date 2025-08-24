# Power-BI-Ola-Data-Analytics-Project
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

##########Questions of this prpjects needs to find out is:
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

   
