A company named FinCorpez is a fintech company specializing in debit cards linked with the bank account of the customers. The customers of this company are between the age of 18 to 35. With each transaction, they get cashbacks. Different customers are entitled to different cashback percent. The debit card can be used for shopping, entertainment, restaurants, petrol pump, travel, etc. Each customer is entitled to membership id. There are three types of membership :- basic, premium and gold. The basic membership has the lowest cashback percent whereas gold membership has the highest cashback percent. The database also contains the names of the current employees and ex-employees. The current employees are entitled to get benefits depending on the tenure with their company. However, those employees who are in the company for less than one year are eligible for employee benefits.



The following tasks has been performed:-


1) Create the database using PostgreSQL and insert the values.
2) Extract the data of the existing employees working at Fincorpez.
3) Extract the data from the customer accounts where the membership type is either premium or gold.
4) Extract the names of all the customers in alphabetical order.
5) Extract the total number of each membership type with customerId and membershipId
6) Delete the customer details from customer accounts record is more than once. Also they might have two different account numbers.
7) Using Left Join, create a new table Employee_Details_with_Benefits by joining employee and employee_benefits.
8) Extract the top 5 customer with highest cashback percent.
9) Insert 2 more new customer details in Customer and Customer_Accounts table.
10) Using Simple Join, increase the cashback percent by 3 to those customers whose age is less than 25 and extract details of all the customers (including those whose age is more than 25) Also give the new name to the table, Updated_Customer_details.
11) From the new table Employee_Details_with_Benefits, Delete the details of those employees who tenure is either less than one year or whose benefit_type is NA.
12) From the table Customer_Accounts, remove all the rows.
13) Extract all the data of Ex_Employee.
14) Delete the table of Ex_Employee.



Here are the tables with its column names:-

Employee:-

employeeId(PK) - ID number assigned to each employee,
employee_name - Names of the employees,
employee_emailId - Email address of the employee,
joining_date - Date of joining the company,
tenure - For how long they are working with the company (in years)


Customer:-

customerId(PK) - ID number assigned to each customer,
customer_nmae - Names of the customer,
customer_emailId - Email address of the customer,
age - Age of the customer,
membership_type - Type of membership customer bought,
account_no (FK) - Fincorpez account number of the customer,
employeeId (FK) - Each customer has been assigned under one employee of the company for the customer support and services. employeeId from       Employee table


Customer_Accounts:-

account_no(PK) - Fincorpez account number of the customer,
account_name - Name of the bank to which the customer bank account is linked to the Fincorpez debit card,
membership_id (FK) - membershipId from Membership Table,
cashback_percent - Percentage of cashback on each transaction which will be made by the customer,
bankId - Account number of the bank account to which customer has linked their Fincorpez debit card



Memberships:- 


membership_id(PK) :- Each customer has been eassigned the unique membershipId,
customerId(FK) :- customerId from Customer table,
membership_type :- One customer is entitled to only one membership. Memberships available are basic, premium and gold



Employee_Benefits:-


benefitId(PK) :- Each employee has been entitled to benefit ID depending on the type of benefits they have chose. One employee can have multiple benefits,
employeeId(FK) :- One employeeId can have multiple benefits. However each benefit Id is unique. employeeId from Employee Table,
benefit_type :- Type of benefit employee has chose. Some of the benefits available are :- health insurance, medical insurance, retail discounts, etc. ,
tenure(FK) :- tenure from Employee Table. Employees who are in a company for less than a year are not eligible for benefits


Ex_Employee:-


EmployeeId(PK) - ID was assigned to former employees when they were working for the company,
EmployeeName - Names of the former employees,
EmployeeEmailID :- Email address of the former employees,
joining_date :- Joining date of the ex-employees,
leaving_date :- Leaving date from the company of the ex-employees,
reason_for_leaving :- reason for leaving the company. 



