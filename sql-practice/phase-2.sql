-- Your code here
DROP table if exists customers;

CREATE table if not exists customers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name varchar(40) not null,
    phone BIGINT unsigned unique,
    email varchar(255) unique,
    points int not null default 5,
    created_at timestamp DEFAULT CURRENT_TIMESTAMP not null,
    CONSTRAINT check_ten_digits CHECK (
        phone BETWEEN 1000000000 AND 9999999999
    )
);

drop table if exists coffee_orders;

CREATE table if not exists coffee_orders (
    id INTEGER PRIMARY key AUTOINCREMENT,
    is_redeemed boolean default false,
    ordered_at timestamp DEFAULT CURRENT_TIMESTAMP not null,
    customer_id int not null,
    constraint fk_customers Foreign Key (customer_id) REFERENCES customers (id)
);

.table 

.schema 
