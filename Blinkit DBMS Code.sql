use blinkit_db;
CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    phone CHAR(10),
    email VARCHAR(35),
    city VARCHAR(25)
);
CREATE TABLE store (
    store_id INT PRIMARY KEY AUTO_INCREMENT,
    store_name VARCHAR(30),
    city VARCHAR(30),
    area VARCHAR(30)
);
CREATE TABLE delivery_partner (
    partner_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(40),
    phone CHAR(10),
    city VARCHAR(40),
    status VARCHAR(35)
);
CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(20),
    category VARCHAR(25),
    price DECIMAL(10,2),
    store_id INT,
    FOREIGN KEY (store_id)
        REFERENCES store(store_id)
);
CREATE TABLE customer_order (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    store_id INT,
    partner_id INT,
    order_datetime DATETIME,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id)
        REFERENCES customer(customer_id),
    FOREIGN KEY (store_id)
        REFERENCES store(store_id),
    FOREIGN KEY (partner_id)
        REFERENCES delivery_partner(partner_id)
);
CREATE TABLE order_item (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id)
        REFERENCES customer_order(order_id),
    FOREIGN KEY (product_id)
        REFERENCES product(product_id)
);
CREATE TABLE payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_method VARCHAR(15),
    payment_status VARCHAR(20),
    FOREIGN KEY (order_id)
        REFERENCES customer_order(order_id)
);
