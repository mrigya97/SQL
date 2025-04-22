# FinCorpez: Fintech Company Database

## Overview

**FinCorpez** is a fintech company that specializes in providing debit cards linked to customers' bank accounts. The company's customers are between the ages of 18 to 35 and are eligible for cashback on each transaction. The cashback percentage varies based on the customer's membership type.

### Membership Types:
- **Basic**: Lowest cashback percent.
- **Premium**: Moderate cashback percent.
- **Gold**: Highest cashback percent.

The database also includes employee details, including both current and former employees, and provides employee benefits depending on their tenure with the company.

---

## Tables in Database

### 1. **Employee**

| Column Name        | Description                                           |
|--------------------|-------------------------------------------------------|
| `employeeid` (PK)  | Unique ID assigned to each employee                   |
| `employee_name`    | Name of the employee                                  |
| `employee_emailid` | Email address of the employee                         |
| `joining_date`     | Date the employee joined the company                  |
| `tenure`           | Number of years the employee has been with the company|

### 2. **Customer**

| Column Name        | Description                                           |
|--------------------|-------------------------------------------------------|
| `customerid` (PK)  | Unique ID assigned to each customer                   |
| `customer_name`    | Name of the customer                                  |
| `customer_emailid` | Email address of the customer                         |
| `age`              | Age of the customer                                   |
| `account_no` (FK)  | Fincorpez account number of the customer              |
| `employeeid` (FK)  | The employee assigned to the customer for support     |

### 3. **Customer_Accounts**

| Column Name        | Description                                           |
|--------------------|-------------------------------------------------------|
| `account_no` (PK)  | Fincorpez account number of the customer              |
| `account_name`     | Name of the bank to which the customer’s account is linked |
| `membership_id` (FK)| Membership ID from the Membership Table              |
| `cashback_percent` | Cashback percentage for the customer’s transactions  |
| `bankid`           | Account number of the bank to which the customer’s debit card is linked |

### 4. **Memberships**

| Column Name        | Description                                           |
|--------------------|-------------------------------------------------------|
| `membership_id` (PK)| Unique ID for each membership                        |
| `customerid` (FK)  | Customer ID from the Customer table                  |
| `membership_type`  | Type of membership (Basic, Premium, Gold)            |

### 5. **Employee_Benefits**

| Column Name        | Description                                           |
|--------------------|-------------------------------------------------------|
| `benefitid` (PK)   | Unique benefit ID for each employee benefit          |
| `employeeid` (FK)  | Employee ID from the Employee Table                  |
| `benefit_type`     | Type of benefits chosen by the employee (e.g., health insurance, medical insurance, retail discounts) |
| `tenure` (FK)      | Tenure of the employee from the Employee Table       |

### 6. **Ex_Employee**

| Column Name        | Description                                           |
|--------------------|-------------------------------------------------------|
| `exemployeeid` (PK)| Unique ID assigned to former employees                |
| `exemployee_name`  | Name of the former employee                          |
| `exemployee_emailid`| Email address of the former employee                |
| `joining_date`     | Date the employee joined the company                  |
| `leaving_date`     | Date the employee left the company                    |
| `reason_for_leaving`| Reason the employee left the company                |

---

## Tasks Performed

The following tasks were performed using PostgreSQL:

1. **Create Database**  
   The database was created and values were inserted into tables.

2. **Extract Employee Data**  
   Extract the data of the existing employees currently working at FinCorpez.

3. **Extract Premium and Gold Membership Data**  
   Extract data from the `Memberships` table where the membership type is either `premium` or `gold`.

4. **List Customers in Alphabetical Order**  
   Extract the names of all the customers in alphabetical order.

5. **Count of Customers by Membership Type**  
   Extract the total number of customers for each membership type.

6. **Delete Duplicate Customer Records**  
   Delete duplicate customer records in the `Customer_Accounts` table, keeping only the first record for each customer.

7. **Create Employee Details with Benefits Table**  
   Using a Left Join, create a new table `Employee_Details_with_Benefits` by joining the `Employee` and `Employee_Benefits` tables.

8. **Top 5 Customers with Highest Cashback Percent**  
   Extract the top 5 customers with the highest cashback percentage.

9. **Insert New Customers**  
   Insert two new customer details in the `Customer`, `Customer_Accounts`, and `Memberships` tables.

10. **Increase Cashback for Customers under 25**  
   Using a Simple Join, increase the cashback percent by 3 for customers whose age is less than 25. Extract details of all customers and save the results in a new table, `Updated_Customer_Details`.

11. **Delete Employees with Less than One Year Tenure**  
   From the `Employee_Details_with_Benefits` table, delete the details of employees with a tenure of less than one year or those whose `benefit_type` is `NA`.

12. **Clear Customer Account Data**  
   Remove all rows from the `Customer_Accounts` table.

13. **Extract Ex-Employee Data**  
   Extract all the data of ex-employees.

14. **Delete Ex-Employee Table**  
   Delete the `Ex_Employee` table after extracting data.

---

## Database Backup

After performing the above CRUD operations, the database was backed up as `Fincorpez_revised.backup`.

---

## ER Diagram

An Entity-Relationship (ER) Diagram is available to illustrate the relationships between tables in the database before the CRUD operations were performed.

---

## Summary of Database Schema

- **Employee** and **Customer** tables are related through the `employeeid` field.
- **Customer_Accounts** and **Memberships** are linked to the **Customer** table using the `customerid`.
- **Employee_Benefits** and **Employee** are linked via `employeeid`, and the employee benefits depend on tenure.
- The **Ex_Employee** table stores the details of former employees, which are managed separately from current employees.
