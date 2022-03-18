# table for the lesson
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

# view
CREATE VIEW productSum(product_type, cnt_product)
AS
SELECT product_type, COUNT(*)
  FROM product
 GROUP BY product_type;
/*
CREATE VIEW view_shop_product(product_type, sale_price, shop_name)
AS
SELECT product_type, sale_price, shop_name
  FROM product, shop_product
 WHERE product.product_id = shop_product.product_id;   -- view basis on multi tables

 ALTER VIEW productSum
AS
SELECT product_type, sale_price  -- modify the view

UPDATE productSum
   SET sale_price = '5000'
 WHERE product_type = '办公用品';  -- update the view
*/
  DROP VIEW productSum;  -- delete the view

# subquery
SELECT product_type, cnt_product
  FROM (SELECT *
	      FROM (SELECT product_type,
					   COUNT(*) AS cnt_product
				  FROM product
				 GROUP BY product_type) AS productsum
		 WHERE cnt_product = 4) AS productsum2;

# functions
# abs mod round
# concat length lower replace substring substring_index
# current_date current_time current_timestamp extract
# cast coalesce

