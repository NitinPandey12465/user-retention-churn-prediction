
DROP TABLE IF EXISTS fact_billing;
DROP TABLE IF EXISTS dim_contracts;
DROP TABLE IF EXISTS dim_services;
DROP TABLE IF EXISTS dim_customers;

CREATE TABLE dim_customers (
    customer_id     VARCHAR(20) PRIMARY KEY,
    gender          VARCHAR(10),
    senior_citizen  INTEGER,
    partner         VARCHAR(5),
    dependents      VARCHAR(5)
);

CREATE TABLE dim_services (
    customer_id         VARCHAR(20) PRIMARY KEY,
    phone_service       VARCHAR(25),
    multiple_lines      VARCHAR(25),
    internet_service    VARCHAR(25),
    online_security     VARCHAR(25),
    online_backup       VARCHAR(25),
    device_protection   VARCHAR(25),
    tech_support        VARCHAR(25),
    streaming_tv        VARCHAR(25),
    streaming_movies    VARCHAR(25),
    FOREIGN KEY (customer_id) REFERENCES dim_customers(customer_id)
);

CREATE TABLE dim_contracts (
    customer_id         VARCHAR(20) PRIMARY KEY,
    contract            VARCHAR(25),
    paperless_billing   VARCHAR(5),
    payment_method      VARCHAR(40),
    FOREIGN KEY (customer_id) REFERENCES dim_customers(customer_id)
);

CREATE TABLE fact_billing (
    customer_id     VARCHAR(20) PRIMARY KEY,
    tenure          INTEGER,
    monthly_charges NUMERIC(8,2),
    total_charges   NUMERIC(8,2),
    churn           VARCHAR(5),
    FOREIGN KEY (customer_id) REFERENCES dim_customers(customer_id)
);