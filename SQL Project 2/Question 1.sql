-- Create Employee Table
CREATE TABLE IF NOT EXISTS Employee (
    employeeId VARCHAR(100) PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    employee_emailId VARCHAR(50) NOT NULL,
    joining_date DATE NOT NULL,
    tenure INTEGER NOT NULL
);

-- Create Customer Table
CREATE TABLE IF NOT EXISTS Customer (
    customerId VARCHAR(100) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_emailId VARCHAR(50) NOT NULL,
    age INTEGER NOT NULL,
    account_no VARCHAR(100),
    employeeId VARCHAR(100)
);

-- Create Customer_Accounts Table
CREATE TABLE IF NOT EXISTS Customer_Accounts (
    account_no VARCHAR(100) PRIMARY KEY,
    account_name VARCHAR(100) NOT NULL,
    cashback_percent INTEGER NOT NULL,
    bankId VARCHAR(100) NOT NULL,
    membership_id VARCHAR(100)
);

-- Create Memberships Table
CREATE TABLE IF NOT EXISTS Memberships (
    membership_id VARCHAR(100) PRIMARY KEY,
    membership_type VARCHAR(100) NOT NULL,
    customerId VARCHAR(100)
);

-- Create Employee_Benefits Table
CREATE TABLE Employee_Benefits (
    benefitId VARCHAR(100) PRIMARY KEY,
    employeeId VARCHAR(100),
    benefit_type VARCHAR(100) NOT NULL,
    tenure INTEGER NOT NULL
);

-- Create Ex_Employee Table
CREATE TABLE IF NOT EXISTS Ex_Employee (
    exemployeeId VARCHAR(100) PRIMARY KEY,
    exemployee_name VARCHAR(100) NOT NULL,
    exemployee_emailId VARCHAR(50) NOT NULL,
    joining_date DATE NOT NULL,
    leaving_date DATE NOT NULL,
    reason_for_leaving VARCHAR(255) NOT NULL
);



-- Add Foreign Key to Customer Table
ALTER TABLE Customer
ADD CONSTRAINT fk_customer_employee
FOREIGN KEY (employeeId)
REFERENCES Employee(employeeId);

-- Add Foreign Key to Customer_Accounts Table
ALTER TABLE Customer_Accounts
ADD CONSTRAINT fk_customer_accounts_membership
FOREIGN KEY (membership_id)
REFERENCES Memberships(membership_id);

-- Add Foreign Key to Memberships Table
ALTER TABLE Memberships
ADD CONSTRAINT fk_memberships_customer
FOREIGN KEY (customerId)
REFERENCES Customer(customerId);

-- Add Foreign Key to Employee_Benefits Table
ALTER TABLE Employee_Benefits
ADD CONSTRAINT fk_employee_benefits_employee
FOREIGN KEY (employeeId)
REFERENCES Employee(employeeId);


INSERT INTO Employee (employeeId, employee_name, employee_emailId, joining_date, tenure)
VALUES 
    ('E001', 'Charmi Desai', 'cdesai@fincorpez.com', '2021-02-01', 3),
    ('E002', 'Suresh Sharma', 'ssharma@fincorpez.com', '2020-06-20', 4),
	('E003', 'Tina Dixit', 'tdixit@fincorpez.com', '2019-04-12', 5),
	('E004', 'Rohit Patel', 'rpatel@fincorpez.com', '2019-12-12', 4),
	('E005', 'Chalie Menzez', 'cmenzez@fincorpez.com', '2024-01-05', 0),
	('E006', 'Muhammad Imran', 'mimran@fincorpez.com', '2022-09-02', 1),
	('E007', 'Sana Saeed', 'ssaed@fincorpez.com', '2020-03-01', 4),
	('E008', 'Vikram Tiwari', 'vtiwari@fincorpez.com', '2023-03-15', 1),
	('E009', 'Akshay More', 'amore@fincorpez.com', '2023-12-01', 0),
	('E010', 'Riya Nair', 'rnair@fincorpez.com', '2018-05-18', 6),
	('E011', 'Deepak Basu', 'dbasu@fincorpez.com', '2021-01-06', 3);

INSERT INTO Customer (customerId, customer_name, customer_emailId, age, account_no, employeeId)
VALUES 
    ('C001', 'Mrigya Sharma', 'mrigya97@gmail.com', 26, 'FC001', 'E011'),
    ('C002', 'Anushka Rathod', 'arathod45@gmail.com', 25, 'FC002', 'E011'),
	('C003', 'Shrey Patel', 'shrey_patel@gmail.com', 19, 'FC003', 'E010'),
	('C004', 'Lucy Rose', 'lucyrose@yahoo.com', 31, 'FC004', 'E010'),
	('C005', 'Ravish Kumar', 'ravishk89gmail.com', 35, 'FC005', 'E010'),
	('C006', 'Manu Agarwal', 'magarwal@hotmail.com', 20, 'FC006', 'E009'),
	('C007', 'Tia Ghosh', 'tiaghosh123@gmail.com', 24, 'FC007', 'E008'),
	('C008', 'Omar Qureshi', 'mrqureshi@yahoo.com', 28, 'FC008', 'E008'),
	('C009', 'Vicky Sahni', 'vickys32@gmail.com', 30, 'FC009', 'E001'),
	('C010', 'Ayush Shah', 'ayush_shah@hotmail.com', 33, 'FC010', 'E001'),
	('C011', 'Omar Qureshi', 'mrqureshi@yahoo.com', 28, 'FC011', 'E002'),
	('C012', 'Ganesh T', 't_ganesh32@gmail.com', 22, 'FC012', 'E002'),
	('C013', 'Tia Ghosh', 'tiaghosh123@gmail.com', 24, 'FC013', 'E003'),
	('C014', 'Farhan Abdullah', 'a_farhan12@gmail.com', 27, 'FC014', 'E003'),
	('C015', 'Tia Ghosh', 'tiaghosh123@gmail.com', 24, 'FC015', 'E004'),
	('C016', 'Gurpreet Singh', 'gurpeet09@gmail.com', 29, 'FC016', 'E004'),
	('C017', 'Chandni Arora', 'chandni337@gmail.com', 18, 'FC017', 'E005'),
	('C018', 'Sadaf Mirza', 'sadafmirza@yahoo.com', 23, 'FC018', 'E006'),
	('C019', 'Mukesh Arora', 'mukesh_arora@gmail.com', 24, 'FC019', 'E006'),
	('C020', 'Jainam Desai', 'jdesai09@hotmail.com', 33, 'FC020', 'E007'),
	('C021', 'Shreya Kohli', 'shreya_k@yahoo.com', 34, 'FC021', 'E007');



INSERT INTO Memberships (membership_id, customerId, membership_type)
VALUES 
    ('M001', 'C001', 'Basic'),
    ('M002', 'C002', 'Premium'),
	('M003', 'C003', 'Basic'),
	('M004', 'C004', 'Premium'),
	('M005', 'C005', 'Premium'),
	('M006', 'C006', 'Gold'),
	('M007', 'C007', 'Basic'),
	('M008', 'C008', 'Premium'),
	('M009', 'C009', 'Gold'),
	('M010', 'C010', 'Gold'),
	('M011', 'C011', 'Basic'),
	('M012', 'C012', 'Premium'),
	('M013', 'C013', 'Gold'),
	('M014', 'C014', 'Gold'),
	('M015', 'C015', 'Basic'),
	('M016', 'C016', 'Premium'),
	('M017', 'C017', 'Basic'),
	('M018', 'C018', 'Premium'),
	('M019', 'C019', 'Gold'),
	('M020', 'C020', 'Premium'),
	('M021', 'C021', 'Basic');




INSERT INTO Customer_Accounts (account_no, account_name, membership_id, cashback_percent, bankId)
VALUES 
    ('FC001', 'SBI Bank', 'M001', 7, '22756801'),
    ('FC002', 'HDFC Bank', 'M002', 10, '23571111'),
	('FC003', 'HDFC Bank', 'M003', 5, '33456789'),
	('FC004', 'ICICI Bank', 'M004', 11, '27378310'),
	('FC005', 'SBI Bank', 'M005', 9, '28751101'),
	('FC006', 'Kotak Mahindra Bank', 'M006', 12, '11253546'),
	('FC007', 'HDFC Bank', 'M007', 6, '45782234'),
	('FC008', 'Punjab National Bank', 'M008', 8, '72351135'),
	('FC009', 'Union Bank of India', 'M009', 13, '65341234'),
	('FC010', 'ICICI Bank', 'M010', 15, '53456789'),
	('FC011', 'Yes Bank', 'M011', 5, '67812091'),
	('FC012', 'Yes Bank', 'M012', 9, '34512378'),
	('FC013', 'IDFC First Bank', 'M013', 12, '97113568'),
	('FC014', 'SBI Bank', 'M014', 14, '57873446'),
	('FC015', 'DBS Bank', 'M015', 7, '17865598'),
	('FC016', 'Yes Bank', 'M016', 9, '78543618'),
	('FC017', 'Punjab National Bank', 'MO17', 5, '97684871'),
	('FC018', 'Union Bank of India', 'M018', 11, '27351132'),
	('FC019', 'Airtel Payments Bank', 'M019', 15, '88761136'),
	('FC020', 'Axis Bank', 'M020', 10, '51342867'),
	('FC021', 'Bank of Baroda', 'M021', 6, '67843612');

--Add foreign key to Customer_Accounts
ALTER TABLE Customer_Accounts
ADD CONSTRAINT fk_c_accounts_membership
FOREIGN KEY (membership_id)
REFERENCES MEMBERSHIPS(membership_id);



INSERT INTO Employee_Benefits (benefitId, employeeId, benefit_type, tenure)
VALUES 
    ('B001', 'E005', 'NA', 0),
    ('B002', 'E009', 'Health Insurance', 0),
    ('B003', 'E001', 'Health Insurance', 3),
    ('B004', 'E001', 'Gym Membership', 3),
    ('B005', 'E002', 'Car Lease', 4),
    ('B006', 'E003', 'Health Insurance', 5),
	('B007', 'E003', 'Medical Insurance', 5),
	('B008', 'E004', 'Retail Discounts', 4),
	('B009', 'E004', 'Car Lease', 4),
	('B010', 'E006', 'Gym Membership', 1),
	('B011', 'E007', 'Retail Discounts', 4),
	('B012', 'E008', 'Medical Insurance',1 ),
	('B013', 'E008', 'Car Lease', 1),
	('B014', 'E008', 'Retail Discounts', 1),
	('B015', 'E009', 'Medical Insurance', 0),
	('B016', 'E010', 'Medical Insurance', 6),
	('B017', 'E010', 'Car Lease', 6),
	('B018', 'E010', 'Retail Discounts', 6),
	('B019', 'E010', 'Health Insurance', 6),
	('B020', 'E011', 'Medical Insurance', 3);



INSERT INTO Ex_Employee (exemployeeId, exemployee_name, exemployee_emailId, joining_date, leaving_date, reason_for_leaving)
VALUES 
    ('EX01', 'Shrish Thakur', 'sthakur@fincorpez.com', '2020-01-15', '2023-04-30', 'Retirement'),
    ('EX02', 'Tanya Amar', 'tamar@fincorpez.com', '2019-06-01', '2022-12-31', 'Resign'),
	('EX03', 'Noel George', 'ngeorge@fincorpez.com', '2018-05-15', '2021-09-09', 'Redundancy'),
	('EX04', 'Parmeet Chandra', 'pchandra@fincorpez.com', '2020-02-02', '2021-12-20', 'Misconduct'),
	('EX05', 'Aditi Reddy', 'areddy@fincorpez.com', '2021-04-01', '2024-02-08', 'Resign'),
	('EX06', 'Manvi Shah', 'mshah@fincorpez.com', '2020-07-05', '2023-11-20', 'Sabbatical'),
	('EX07', 'Sohil Mehta', 'smehta@fincorpez.com', '2018-01-12', '2024-01-05', 'Moved to new city');
