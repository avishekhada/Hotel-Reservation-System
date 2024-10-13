



create database hotel_reservation;

use hotel_reservation;


-- Create a table name Hotel 
create table hotel(
hotel_id int identity(1,1) primary key,
hotel_name varchar(255)  not null,
location varchar(255) not null,
email varchar(255) unique not null,
phone varchar(11)  unique not null
);


-- Create a table name room 
create table room(
room_id int identity(1,1) primary key,
hotel_id int,
room_number varchar(222) not null,
room_category varchar(255),
price_per_night decimal(6,2) not null,
status varchar(255) not null,
foreign key (hotel_id) references hotel(hotel_id)
);



-- Create a table name customer 
create table customer(
customer_id int identity(1,1) primary key,
first_name varchar(255) not null,
last_name varchar(255)not null,
email varchar(255) unique not null,
phone varchar(255) unique not null,
city varchar(244)  not null
);





-- Create a table name booking 
create table booking(
booking_id int identity(1,1) primary key,
hotel_id int ,
customer_id int,
room_id int,
check_in_date date not null,
check_out_date date not null,
booking_date date not null,
foreign key (customer_id) references customer(customer_id),
foreign key (room_id)  references room(room_id),
foreign key (hotel_id)  references hotel(hotel_id)
);



-- Create a table name feedback
create table feedback(
feedback_id int identity(1,1) primary key,
customer_id int,
hotel_id int ,
rating int check (rating between 1 and 5),
comment text,
feedback_date date not null,
foreign key (customer_id) references customer(customer_id),
foreign key (hotel_id) references hotel(hotel_id)
);


-- Create a table name role
create table role (
    role_id int identity(1,1) primary key,
    role_name varchar(50) unique not null
);


-- Create a table name staff
create table staff(
 staff_id int  identity(1,1) primary key ,
staff_name varchar(50)  not null,
  hotel_id int,
 role_id int,
 password varchar(255),
  email varchar(255),
  phone varchar(22),
 foreign key (hotel_id) references hotel(hotel_id),
  foreign key (role_id) references role(role_id)
);


-- Create a table name permission
create table permission (
    permission_id int identity(1,1) primary key,
    permission_type varchar(50) unique not null
);

-- Create a table name RolePermission 
create table RolePermission (
    role_id int foreign key references role(role_id),
     permission_id int foreign key references permission(permission_id),
    PRIMARY KEY (Role_id, Permission_id)
);





 --insert data into table name hotel
insert into hotel (hotel_name,location,email,phone) values ('Yak and yeti','Kathmandu','ac@gmail.com','9841320430'),
 ('Dwarika','Kathmandu','abc@gmail.com','9841320431'),
 ('Soaltee','Kathmandu','bac@gmail.com','9841320432'),
 ('abc','Khotang','qac@gmail.com','9841320433'),
 ('xyz','Beni','wac@gmail.com','9841320434'),
 ('pqr','Rajbiraj','eac@gmail.com','9841320435'),
 ('kantipur','Kaski','arc@gmail.com','9841320436'),
 ('Namaste','Kathmandu','atc@gmail.com','9841320437'),
 ('Three Star','Kathmandu','ayc@gmail.com','9841320438'),
 ('Yela','Kathmandu','axc@gmail.com','9841320439'),
 ('Dream City','Patan','akc@gmail.com','9841320110'),
 ('Lakeside','Pokhara','amc@gmail.com','9841320220'),
 ('Yak','Pokhara','abc1@gmail.com','9841320455'),
 ('Himalaya','Pokhara','ac2@gmail.com','9841320444'),
 ('Everest','Mustang','ac4@gmail.com','9841320488');




--insert data into table name customer
insert into customer(first_name,last_name,email,phone,city ) values ('Ram' ,'Shah', 'ram@gmail.com', '9841234546' ,'Pokhara' ),
 ('Hari' ,'Shah', 'rrram@gmail.com', '9841234547' ,'Bara' ),
 ('Ramesh' ,'Dahal', 'aram@gmail.com', '9841234548','Kathmandu'  ),
 ('Rameshwor' ,'Shah', 'bram@gmail.com', '9841234549','Bandipur'  ),
 ('Karishma' ,'Dhakal', 'cram@gmail.com', '9841234541','Pokhara'  ),
 ('Krish' ,'Shah', 'dram@gmail.com', '9841234542' ,'Lalitpur' ),
 ('Sudip' ,'Shrestha', 'eram@gmail.com', '9841234543' ,'Mustang' ),
 ('Kabita' ,'Shah', 'fram@gmail.com', '9841234544','Chitwan'  ),
 ('Jenish' ,'Suwal', 'gram@gmail.com', '9841234545' ,'Bara' ),
 ('Harshit' ,'Shah', 'hram@gmail.com', '9841234599' ,'Jhapa' ),
 ('Jenny' ,'Duwal', 'iram@gmail.com', '9841239946' ,'Pokhara' ),
 ('Surya' ,'Sujakhu', 'jram@gmail.com', '9841774546' ,'Dang' ),
 ('Govind' ,'Vaidya', 'kram@gmail.com', '9841255546' ,'Banepa' ),
 ('Harish' ,'Pandit', 'lram@gmail.com', '9841320340' ,'Pokhara' ),
 ('Ira' ,'Paneru', 'mram@gmail.com', '9841222345' ,'Dhulikhel' );


--insert data into table name room
insert into room(hotel_id,room_number,room_category,price_per_night,status) values ('1' ,'101', 'Normal', '1000' ,'Occupied' ),
 ('1' ,'102', 'Premium', '3000','Available'  ),
 ('2' ,'201', 'Normal', '1000' ,'Occupied' ),
 ('3' ,'301', 'Premium', '3000' ,'Occupied' ),
 ('3' ,'302', 'Deluxe', '2000' ,'Available' ),
 ('7' ,'701', 'Premium', '3000' ,'Occupied' ),
 ('2' ,'202', 'Deluxe', '2000','Occupied'  ),
 ('3' ,'303', 'Normal', '3000' ,'Occupied' ),
 ('5' ,'501', 'Normal', '1000' ,'Available' ),
 ('2' ,'203', 'Premium', '2000' ,'Occupied' ),
 ('4' ,'401', 'Premium', '3000' ,'Occupied' ),
 ('2' ,'204', 'Normal', '1000' ,'Available' ),
 ('9' ,'901', 'Premium', '3000' ,'Occupied' ),
 ('8' ,'801', 'Deluxe', '2000' ,'Occupied' ),
 ('6' ,'601', 'Normal', '1000' ,'Available' ),
 ('4' ,'402', 'Premium', '3000' ,'Occupied' ),
 ('1' ,'103', 'Deluxe', '2000' ,'Occupied' ),
 ('4' ,'403', 'Deluxe', '2000' ,'Occupied' ),
 ('4' ,'404', 'Normal', '1000' ,'Occupied' ),
 ('5' ,'502', 'Deluxe', '2000' ,'Available' ),
 ('5' ,'503', 'Normal', '1000' ,'Available' ),
 ('6' ,'602', 'Deluxe', '2000' ,'Available' ),
 ('6' ,'603', 'Premium', '2000' ,'Available' ),
 ('9' ,'903', 'Deluxe', '2000' ,'Occupied' ),
 ('9' ,'902', 'Normal', '1000' ,'Occupied' ), 
 ('7' ,'702', 'Deluxe', '2000' ,'Occupied' ),
 ('7' ,'703', 'Normal', '1000' ,'Occupied' ),
 ('8' ,'802', 'Normal', '1000' ,'Available' ),
 ('8' ,'803', 'Premium', '3000' ,'Available' );




--insert data into table name booking
insert into booking(customer_id,hotel_id,room_id,check_in_date,check_out_date,booking_date) values (1,10 ,1, '2024-09-01', '2024-09-05', '2024-08-20'  ),
(4 ,2,3 ,'2024-09-10', '2024-09-15', '2024-08-22' ),
 (6 ,1,4, '2024-09-15', '2024-09-20', '2024-09-01'  ),
(7 ,7,6, '2024-08-15', '2024-08-20', '2024-08-01' ),
 (8 ,6,9, '2024-08-01', '2024-08-10', '2024-07-25'  ),
(9 ,9,11, '2024-07-15', '2024-07-20', '2024-07-01'),  
 (2 ,11,1, '2024-07-10', '2024-07-13', '2024-07-03'  ),
 (11 ,13,2, '2024-07-10', '2024-07-13', '2024-07-02'  ),
 (14 ,5,1, '2024-07-10', '2024-07-12', '2024-07-01'  ),
 (4 ,15,3, '2024-06-29', '2024-06-30', '2024-06-28'  ),
 (1 ,2,4, '2024-06-28', '2024-06-30', '2024-06-27'  ),
 (15 ,4,12, '2024-06-27', '2024-06-29', '2024-06-26'  ),
 (8 ,12,9, '2024-06-27', '2024-06-28', '2024-06-25'  ),
(6 ,14,13, '2024-06-25', '2024-06-27', '2024-06-24'  ),
 (5 ,8,11, '2024-06-23', '2024-06-25', '2024-06-21'  );


 --insert data into table name Feedback

insert into feedback (customer_id, hotel_id, feedback_date, rating, comment) values (1, 1, '2024-09-13', 4, 'Awesome'),
(3, 11, '2024-09-10', 3, 'Decent'),
 (2, 15, '2024-09-03', 1, 'poor'),
 (6, 14, '2024-09-01', 4, 'Good'),
 (9, 12, '2024-08-29', 4, 'Fantastic'),
 (7, 13, '2024-08-23', 4, 'Great stay!'),
 (8, 10, '2024-08-13', 3, 'Beautiful'),
 (3, 2, '2024-08-03', 4, 'Great stay!'),
 (4, 4, '2024-08-03', 4, 'Nice'),
 (5, 5, '2024-07-30', 3, 'Good'),
 (10, 6, '2024-07-23', 2, 'Fantastic'),
 (12, 7, '2024-07-13', 3, 'Great stay!'),
(15, 8, '2024-07-11', 4, 'Brilliant'),
(14, 9, '2024-07-09', 4, 'Nice'),
 (3, 3, '2024-07-10', 2, ' Decent'),
(11, 1, '2024-07-22', 3, 'Great ');


-- insert  data into role
insert into role (role_name) values ('manager'),
('receptionist'),
('House Keeping'),
('Security Staff'),
('kitchen staff'),
('hospitality staff'),
('maintenance');


-- insert data into staff
insert into[staff] ( staff_name, password, role_id,email,phone) values ('Shree Khadka', 'password123', 1,'mger@gmail.com','9846660908'),
('Ram Khadgi', 'password89', 3,'raam@gmail.com','9841230908'),
('Shree Khadgi', 'password', 4,'shre@gmail.com','9841255908'),
('Shreejan Khanal', 'password1', 5,'aaa@gmail.com','9841880908'),
('Sita Khanal', 'password66', 2,'recep@gmail.com','9843330908'),
('Sailesh shahi', 'password55', 7,'mr@gmail.com','9841440908'),
('Satish shah', 'password99', 6,'aar@gmail.com','9841110908');





-- insert  data into Permission
insert into Permission (permission_type)
values 
('ViewBookings'),
('AllocateRooms'),
('ManageExpenses'),
('Checking(survelliance)'),
('entry in Kitchen'),
('access tools for fixing purpose');

-- insert  data into RolePermission
insert into RolePermission (role_id, permission_id)
values 
(1, 1),
(2, 2),
(1, 3),
(2, 1),
(7, 6),
(5, 5),
(4, 4);


select * from rolepermission;



--Q 4.1 SQL queries to Retrieve all customer who have booked at least once in a lifetime
select distinct c.customer_id,c.first_name,c.last_name from customer  c
join booking  b on c.customer_id=b.customer_id ;


--Explanation
--SELECT c.customer_id, c.first_name, c.last_name: This specifies the columns that needs to be retrieve from the database.
-- Here the customer ID, first name, and last name from the customer table is retrieved.
--JOIN booking b ON c.customer_id = b.customer_id: This is a join operation. (combines rows from customer table with rows from booking table.)
--booking b specifies joining with the booking table,b is an alias for it.
--on c.customer_id = b.customer_id is the condition for the join. 




--Q 4.2 Display the total no of room with each category (Premium, Deluxe, Normal) for any given hotel.
select room_category, count(*) as totalrooms
from room
where hotel_id=9
group by room_category;

--Explanation
--select room_category, count(*) AS totalrooms:
--room_category: This specifies the column that needs to be retrieve.
--count(*) as  totalrooms: This is an aggregate function that counts the number of rows for each group of room_category.
-- The result of this count is labeled as totalrooms using the AS keyword(using alias).



--Q 4.3  Find the top 5 customers based on their total no of room booked previously
--(Do not count the room if the booking date period is not over).
select top 5 c.customer_id, c.first_name, c.last_name, COUNT(b.room_id) as totalroomsbooked
from customer c
join booking b ON c.customer_id = b.customer_id
where b.check_out_date < getdate()
group by c.customer_id, c.first_name, c.last_name
order by totalroomsbooked desc;



--Explanation
--select top 5 c.customer_id, c.first_name, c.last_name, count(b.room_id) as totalroomsbooked:
--top 5: Limits the result to the top 5 rows based on the order specified.
--c.customer_id, c.first_name, c.last_name: These are the columns from the customer table that needs to be retrieve.
--count(b.room_id) as totalroomsbooked: This calculates the total number of rooms booked by each customer. 
--The count function counts the number of rows (bookings) for each customer,totalroomsbooked is an alias for this count.

--join booking b on c.customer_id = b.customer_id:
--Performs an join between the customer table and the booking table based on the customer_id,this combines rows from both tables where the customer_id matches.

--where b.checkout_date < GETDATE():
--Filters the results to include only those bookings where the checkout_date is before the current date

--group by c.customer_id, c.first_name, c.last_name:
--Groups the results by customer_id, first_name, and last_name

--order by totalroomsbooked desc:
--Orders the results by the number of rooms booked (totalroomsbooked) in descending order.





                          
--Q 4.5 Write a single query to display hotel with total no of booking in descending order
--(if any hotel is not booked yet then the query should display the particular hotel
--name with total number of bookings with 0)
select h.hotel_name, coalesce(count(b.booking_id), 0) as totalbookings
from hotel h
 left join booking b ON h.hotel_id= b.hotel_id
group by h.hotel_name
order by totalbookings desc;

--Explanation
--select h.hotel_name, coalesce(count(b.booking_id), as totalbookings:

--h.hotel_name: This selects the name of the hotel from the hotel table.
--coalesce(count(b.booking_id), 0) as totalbookings: 
--This counts the number of bookings associated with each hotel. count(b.booking_id) counts the number of bookings for each hotel. 
--The coalesce function is used to ensure that if there are no bookings, it returns 0 instead. totalbookings is an alias for the count of bookings.

--left join booking b ON h.hotel_id= b.hotel_id
--Joins the hotel table with the booking table based on the hotel_id column. 


--group by h.hotel_name:
--Groups the results by the hotel_name. 

--order by totalbookings desc:
--Orders the results by the totalbookings column in descending order. This ensures that hotels with the most bookings appear first in the result set.





--Q 4.6 Write a query to display each month income for any particular hotel.
select datepart(year,b.check_in_date) as year,
datepart(month,b.check_in_date ) as month,
sum(datediff(day,b.check_in_date,b.check_out_date)* r.price_per_night) as totalmonthlyincome,r.hotel_id
from booking b
join room r on b.room_id=r.room_id
where r.Hotel_id = 1
group by datepart(year,b.check_in_date),datepart(month,b.check_in_date),r.hotel_id
order by totalmonthlyincome;
--Explanation
--select datepart(year,b.checkin_date) as year,
--datepart(month,b.checkin_date ) as month:It extracts the year and month from the checkin_date of each booking.

--sum(datediff(day,b.checkin_date,b.checkout_date)* r.price_per_night) as totalmonthlyincome:
--It sums up the total income for each month by calculating the number of nights for each booking (datediff(day, b.checkin_date, b.checkout_date)) 
--and multiplying it by the price_per_night of the room.

--join room r on b.room_id=r.room_id:It joins the booking table with the room table base on room_id.

--group by datepart(year,b.checkin_date),datepart(month,b.checkin_date): It groups the results by year and month to get the total income for each month.

--order by totalmonthlyincome: It sorts the results by totalmonthlyincome in ascending order.


--Q 4.4 Write stored procedure to list all hotel name that a customer has/had booked
--before current date. (listed hotel name should be in comma separated if same 
--customer booked multiple hotel)
create procedure GetCustomerHotelNames
    @customer_id int
as
begin
    select string_agg(h.hotel_name, ', ') as hotelsbooked
    from booking b
    join hotel h on b.hotel_id = h.hotel_id
    where b.customer_id = @customer_id
      and b.check_out_date < getdate();
end;


--Explanation
--create procedure GetBookedHotelsByCustomer: This defines a new stored procedure named GetBookedHotelsByCustomer.
--@CustomerID INT: This parameter allows you to pass in the unique identifier of the customer whose booked hotels you want to retrieve. It is of type INT.
--as begin: This indicates the start of the procedure’s main logic.

--SELECT STRING_AGG(h.HotelName, ', ') AS Hotels:

--string_agg: This function aggregates multiple values(hotel names) into a single string, separated by the specified delimiter (, ). 
--AS Hotels: This aliases the resulting string as Hotels.

--join Booking b ON h.hotel_id = b.hotel_id:This performs an inner join between the Hotel and Booking tables based on the hotel_id.

--where b.CustomerID = @CustomerID:This filters the results to only include bookings made by the customer identified by @CustomerID.

--and b.CheckOutDate < GETDATE():This further filters the results to only include bookings where the checkout date is earlier than the current date.

--end:This marks the end of the stored procedure definition.






--Q.5  Add indexes and evaluate the above query performance after the implementation of proper indexing

-- add an index on CustomerID in Booking table
create index idx_booking_customer_id on booking(customer_id);

-- add  an index on HotelID in Room table
create index idx_room_hotel_id   on room(hotel_id);

-- add an index on RoomID in Booking table
 create index idx_booking_room_id on booking(room_id);

 --add an index on BookingDate in Booking table for income queries
 create index idx_booking_booking_date on booking(booking_date);


