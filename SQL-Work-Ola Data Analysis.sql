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






#Questions with Answers
#1. Retrieve all successfull bookings;
Select * from Successfull_Bookings;
#2. Find the average ride distance for each vehicle type:
Select * from ride_distance_for_each_vehicle;
#3. Get the total number of canceled rides by customers:
Select * from Canceled_rides_by_customers;
#4. List the top 5 customers who booked the highest number of rides:
Select * from Top_5_customers;
#5. Get the number of rides canceled by drivers due to personal and car-related issues:
Select * from rides_canceled_by_driver_P_C_Issues;
#6. Find the maximum and minimum driver ratings for Prime Sedan bookings: 
Select * from Max_Min_Driver_Rating;
#7. Retrieve all rides where payment was made using UPI:
Select * from Payment_Method_UPI;
#8. Find the average customer rating per vehicle type:
Select * from Average_Customer_Rating_Per_Vehicle_Type;
#9. Calculate the total booking value of rides completed successfully:
Select * from total_successful_ride_Vlaue;
#10. List all incomplete rides along with the reason:
Select * from Incomplete_Rides_Reason;


