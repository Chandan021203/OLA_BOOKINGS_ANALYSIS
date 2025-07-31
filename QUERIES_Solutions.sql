-- 1. Retrieve all successful bookings:
		CREATE VIEW Successful_Bookings as 
		SELECT * FROM ola_booking WHERE Booking_Status='Success';
		SELECT * FROM Successful_Bookings;
            
		
-- 2. Find the average ride distance for each vehicle type:
		CREATE VIEW Ride_Distance_For_Each_Vehicle AS
		SELECT Vehicle_Type,AVG(Ride_Distance) AS Average_Distance 
		FROM ola_booking 
		GROUP BY Vehicle_Type;
		SELECT * FROM Ride_Distance_For_Each_Vehicle;


-- 3. Get the total number of cancelled rides by customers:
		CREATE VIEW Cancelled_Rides_By_Customer AS
		SELECT COUNT(*) FROM ola_booking WHERE Booking_Status='Canceled by Customer';
		SELECT * FROM Cancelled_Rides_By_Customer;
            
            
-- 4. List the top 5 customers who booked the highest number of rides:
		CREATE VIEW Top_5_Customers AS
		SELECT Customer_ID,COUNT(Booking_ID) AS Total_Rides FROM ola_booking 
		GROUP BY Customer_ID
		ORDER BY Total_Rides DESC LIMIT 5 ;
		SELECT * FROM Top_5_Customers;
            
            
-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
		CREATE VIEW Canceled_Rides_by_Driver_due_to_personal_and_Car_related_issues AS
		SELECT COUNT(*) FROM ola_booking WHERE Booking_Status='Canceled by Driver' AND Canceled_Rides_by_Driver='Personal & Car related issue';
		SELECT * FROM Canceled_Rides_by_Driver_due_to_personal_and_Car_related_issues;
            

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
		CREATE VIEW Driver_Ratings_For_Prime_Sedan AS
		SELECT MAX(Driver_Ratings),MIN(Driver_Ratings) FROM ola_booking WHERE Vehicle_Type='Prime Sedan';
		SELECT * FROM Driver_Ratings_For_Prime_Sedan;
            
            
-- 7. Retrieve all rides where payment was made using UPI:
		CREATE VIEW Payment_By_UPI AS
		SELECT * FROM ola_booking WHERE Payment_Method='UPI';
		SELECT * FROM Payment_By_UPI;
            
		
-- 8. Find the average customer rating per vehicle type:
		CREATE VIEW Customer_Rating_By_Vehicle AS
		SELECT Vehicle_Type,AVG(Customer_Rating) AS Average_Rating 
		FROM ola_booking 
		GROUP BY Vehicle_Type;
		SELECT * FROM Customer_Rating_By_Vehicle;
            
	
-- 9. Calculate the total booking value of rides completed successfully:
		CREATE VIEW Total_Successful_Rides AS
		SELECT SUM(Booking_Value) FROM ola_booking 
		WHERE Booking_Status='Success';
		SELECT * FROM Total_Successful_Rides;
            
            
-- 10. List all incomplete rides along with the reason:
		CREATE VIEW IncompleteRides AS
		SELECT Booking_ID,Incomplete_Rides_Reason FROM ola_booking
		WHERE Incomplete_Rides='Yes';
		SELECT * FROM IncompleteRides;
            