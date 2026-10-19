DROP TABLE IF EXISTS order_items, orders, products, customers;
CREATE TABLE customers (
    customer_id  INTEGER       PRIMARY KEY,
    first_name   VARCHAR(50)   NOT NULL,
    last_name    VARCHAR(50)   NOT NULL,
    region       VARCHAR(50)   NOT NULL,
    signup_date  DATE          NOT NULL
);
CREATE TABLE products (
    product_id   INTEGER        PRIMARY KEY,
    product_name VARCHAR(150)   NOT NULL,
    category     VARCHAR(50)    NOT NULL,
    unit_price   NUMERIC(10,2)  NOT NULL CHECK (unit_price >= 0)
);
CREATE TABLE orders (
    order_id        INTEGER      PRIMARY KEY,
    customer_id     INTEGER      NOT NULL REFERENCES customers(customer_id),
    order_date      DATE         NOT NULL,
    payment_method  VARCHAR(30)  NOT NULL,
    is_returned     BOOLEAN      NOT NULL DEFAULT FALSE
);
CREATE TABLE order_items (
    order_item_id  INTEGER  PRIMARY KEY,
    order_id       INTEGER  NOT NULL REFERENCES orders(order_id),
    product_id     INTEGER  NOT NULL REFERENCES products(product_id),
    quantity       INTEGER  NOT NULL CHECK (quantity > 0)
);