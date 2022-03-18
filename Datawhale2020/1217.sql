# create a database
CREATE DATABASE shop;

CREATE TABLE product (
    product_id CHAR(4) NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    product_type VARCHAR(32) NOT NULL,
    sale_price INTEGER,
    purchase_price INTEGER,
    regist_date DATE,
    PRIMARY KEY (product_id)
);

SHOW DATABASES;
USE shop;
SHOW TABLES;

# delete a table
/*
DROP TABLE product;
SHOW TABLES;
*/

# add or delete a column of a table
ALTER TABLE product ADD COLUMN product_name_pinyin VARCHAR(100);
ALTER TABLE product DROP COLUMN product_name_pinyin;

# clear tables
/*
TRUNCATE TABLE product;
*/

# update data
/*
UPDATE product
SET regist_date = '2009-10-10',
	sale_price = sale_price * 10
WHERE product_id = '0002';
*/

# insert data
/*
INSERT INTO product(product_id, product_name, product_type, sale_price, purchase_price, regist_date)
VALUES('0001', 'T恤衫', '衣服', 1000, 500, '2009-09-20');
*/
INSERT INTO product VALUES('0001', 'T恤衫', '衣服', 1000, 500, '2009-09-20');  -- omit the column lists when doing INSERT for all columns

# set default value when creating tables
CREATE TABLE product (
    product_id CHAR(4) NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    product_type VARCHAR(32) NOT NULL,
    sale_price INTEGER DEFAULT 0,
    purchase_price INTEGER DEFAULT 0,
    regist_date DATE,
    PRIMARY KEY (product_id)
);


# replicate data from other tables
/*
INSERT INTO productCopy(product_id, product_name, product_type, sale_price, purchase_price, regist_date)
SELECT product_id, product_name, product_type, sale_price, purchase_price, regist_date
  FROM product;
*/

# table for the lesson
START TRANSACTION;
INSERT INTO product VALUES('0001', 'T恤衫', '衣服', 1000, 500, '2009-09-20');
INSERT INTO product VALUES('0002', '打孔器', '办公用品', 500, 320, '2009-09-11');
INSERT INTO product VALUES('0003', '运动T恤', '衣服', 4000, 2800, NULL);
INSERT INTO product VALUES('0004', '菜刀', '厨房用具', 3000, 2800, '2009-09-20');
INSERT INTO product VALUES('0005', '高压锅', '厨房用具', 6800, 5000, '2009-01-15');
INSERT INTO product VALUES('0006', '叉子', '厨房用具', 500, NULL, '2009-09-20');
INSERT INTO product VALUES('0007', '擦菜板', '厨房用具', 880, 790, '2008-04-28');
INSERT INTO product VALUES('0008', '圆珠笔', '办公用品', 100, NULL, '2009-11-11');
COMMIT;

# query data
SELECT product_name, product_type
  FROM product
 WHERE product_type = '衣服';

SELECT *
  FROM product  -- * represents all the columns
 ORDER BY -purchase_price ASC, sale_price;  -- show data with NULL in certain column firstly

# set alias
SELECT product_id AS id,
	   product_name AS name,
       sale_price AS '售价'
  FROM product;

# remove duplicate data
SELECT DISTINCT product_type
  FROM product;

# comparison operators
SELECT product_type, product_name, sale_price
  FROM product
 WHERE sale_price <> 500;

SELECT product_name, sale_price, purchase_price
  FROM product
 WHERE purchase_price IS NULL;  -- use IS NULL and IS NOT NULL to judge whether a value is null instead of = or !=

# aggregate functions
SELECT COUNT(*)
  FROM product;  -- count all lines (including NULL)

SELECT COUNT(purchase_price)
  FROM product;  -- count lines (except NULL)

SELECT SUM(sale_price), AVG(purchase_price), MAX(regist_date)
  FROM product;

# group by
SELECT product_name, purchase_price, COUNT(*)
  FROM product
 WHERE product_type = '衣服'
 GROUP BY purchase_price;  -- in ascending order
-- GROUP BY -purchase_price   in descending order

# having
SELECT product_type, COUNT(*)
  FROM product
 GROUP BY product_type
HAVING COUNT(*) = 2;  -- filter and get the groups which have 2 items

# order by 
SELECT product_id, product_name, sale_price, purchase_price
  FROM product
 ORDER BY sale_price DESC;  -- default = ASC

SELECT product_id AS id, product_name, sale_price, purchase_price
  FROM product
 ORDER BY sale_price DESC, id DESC;  -- can use alias in ORDER BY clauses

SELECT product_id, product_name, sale_price, purchase_price
  FROM product
 ORDER BY purchase_price DESC;  -- NULL values are showm firstly or lastly
