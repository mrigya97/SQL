A company names FinCorpez is a fintech company specializing in debit cards linked with the bank account of the customers. The customers of this company are between the age of 18 to 35. With each transaction, they get cashbacks. Different customers are entitled to different cashback percent. The debit can be used for shopping, entertainment, restaurants, petrol pump, travel, etc. Each customer is entitled to membership id. There are three types of membership :- basic, premium and gold. The basic membership has the lowest cashback percent whereas gold membership has the highest cashback percent. The database also contains the names of the current employees and ex-employees. The current employees are entitled to get benefits depending on the tenure with their company. However, those employees who are in the company for less than one year are eligible for employee benefits.



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
13) Extract all the data of Ex_Employees.
14) Delete the table of Ex_Employees.
