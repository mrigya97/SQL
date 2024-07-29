-- Question 2
SELECT * FROM EMPLOYEE;

-- Question 3
SELECT * FROM MEMBERSHIPS
   WHERE membership_type = 'Premium' OR membership_type = 'Gold';

-- Question 4
SELECT * FROM CUSTOMER
   GROUP BY customerId
   ORDER BY customer_name ASC;

--Question 5
SELECT membership_type,
       COUNT(customerId) AS no_of_customers_each_membership
FROM MEMBERSHIPS
GROUP BY membership_type;


--Question 6
--Removing foreign constraint temporarily
ALTER TABLE Memberships DROP CONSTRAINT fk_memberships_customer;

WITH DuplicateCustomerMappings AS (
    SELECT 
        c.customerId AS old_customerId,
        MIN(c2.customerId) AS new_customerId
    FROM 
        Customer c
    JOIN 
        Customer c2 ON c.customer_name = c2.customer_name
    WHERE 
        c.customerId <> c2.customerId
    GROUP BY 
        c.customerId
)
UPDATE Memberships m
SET customerId = dc.new_customerId
FROM DuplicateCustomerMappings dc
WHERE m.customerId = dc.old_customerId;

-- Delete duplicate customer records
WITH DuplicateCustomers AS (
    SELECT 
        customerId,
        ROW_NUMBER() OVER (PARTITION BY customer_name ORDER BY customerId) AS row_num
    FROM 
        Customer
)
DELETE FROM Customer
WHERE customerId IN (
    SELECT customerId
    FROM DuplicateCustomers
    WHERE row_num > 1
);


--Question 7
CREATE TABLE Employee_Details_with_Benefits AS
SELECT 
      e.employeeid,
	  e.employee_name,
	  e.employee_emailid,
	  e.joining_date,
	  e.tenure,
	  b.benefitid,
	  b.benefit_type
FROM 
     Employee e
LEFT JOIN
     Employee_Benefits b ON e.employeeid = b.employeeid;


--Question 8
SELECT * FROM Customer_Accounts
       GROUP BY account_no
	   ORDER BY cashback_percent DESC
	   LIMIT 5;

--Question 9

-- Insert into customers and capture customer_ids
WITH new_customers AS (
    INSERT INTO customer (customerid, customer_name, customer_emailid, age, account_no, employeeid) VALUES
    ('C022', 'Jatin Kumar', 'jatink@gmail.com', 30, 'FC022', 'E005'),
    ('C023', 'Flora Trivedi', 'ftrivedi@yahoo.com', 24, 'FC023', 'E009')
    RETURNING customerid
),

-- Insert into orders using the customer_ids and capture order_ids
new_accounts AS (
    INSERT INTO customer_accounts (account_no, account_name, cashback_percent, bankid, membership_id) VALUES
    ('FC0022', 'SBI Bank', 8, '76321145', 'M022' ),
    ('FC0023', 'Bank of Baroda', 7, '87126745', 'M023')
    RETURNING account_no
)

-- Insert into payments using the order_ids
INSERT INTO memberships (membership_id, membership_type, customerid) VALUES
('M022', 'Basic', (SELECT customerid from new_customers WHERE customerid = 'C022')),
('M023', 'Basic', (SELECT customerid from new_customers WHERE customerid = 'C023'));


--Question 10

CREATE TABLE Updated_Customer_Details AS
SELECT c.customerid,
       c.customer_name,
	   c.customer_emailid,
	   c.age,
	   c.account_no,
	   a.account_name,
	   a.cashback_percent,
	   a.bankid,
	   a.membership_id
	   FROM Customer c
	   JOIN Customer_Accounts a ON c.account_no = a.account_no;

UPDATE Updated_Customer_Details
SET cashback_percent = cashback_percent + 3
WHERE age < 25;


-- Question 11
DELETE FROM Employee_Details_with_Benefits
WHERE employeeId IN (
    SELECT employeeId
    FROM Employee
    WHERE tenure < 1
       OR benefit_type = 'NA'
);


--Question 12
ALTER TABLE Customer_Accounts
DROP CONSTRAINT fk_customer_accounts_membership

TRUNCATE TABLE Customer_Accounts;

ALTER TABLE Customer_Accounts
ADD CONSTRAINT fk_customer_accounts_membership
FOREIGN KEY (membership_id)
REFERENCES Memberships(membership_id);


--Question 13
SELECT * FROM Ex_Employee

--Question 14


DROP TABLE Ex_Employee CASCADE;
