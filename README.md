Project Description
Banking Intelligence wants to develop a supervised machine learning model to predict the future behavior of its customers, based on transaction data and product ownership characteristics.

The goal of the project is to create a denormalized feature table with a set of indicators (features) derived from the tables available in the database, representing customers’ behaviors and financial activities.

Objective
Our objective is to build a feature table for training machine learning models, enriching customer data with various indicators calculated from their transactions and the accounts they own. The final table will be referenced by customer ID and will contain both quantitative and qualitative information.

Database Structure
The database consists of the following tables:
Customer: contains personal information about customers (for example, age).
Account: contains information about the accounts owned by customers.
Account Type: describes the different types of accounts available.
Transaction Type: contains the types of transactions that can occur on accounts.
Transactions: contains the details of the transactions carried out by customers on the various accounts.

Behavioral Indicators to Calculate
The indicators will be calculated for each individual customer, based on customer_id, and include:

Basic indicators:
Customer age (from the customer table).

Transaction indicators:
Number of outgoing transactions across all accounts.
Number of incoming transactions across all accounts.
Total amount transacted outgoing across all accounts.
Total amount transacted incoming across all accounts.

Account indicators:
Total number of accounts owned.
Number of accounts owned by type (one indicator for each account type).

Transaction indicators by account type:
Number of outgoing transactions by account type (one indicator for each account type).
Number of incoming transactions by account type (one indicator for each account type).

Amount transacted outgoing by account type (one indicator for each account type).

Amount transacted incoming by account type (one indicator for each account type).
