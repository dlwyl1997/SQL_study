show databases;
use world;
show tables;
select * from country;
SELECT name FROM country;
SELECT name, population, HeadOfState FROM country;

# 起别名
SELECT name AS 国家名, Population AS 人口, HeadOfState AS 元首 FROM country;

# 去重
SELECT DISTINCT HeadOfState FROM country;

# +号的作用仅为加法运算符
# CONCAT连接
SELECT CONCAT(Region, '_', Name) AS 地点 FROM country;

# WHERE条件判断
SELECT * FROM country WHERE HeadOfState = 'Jiang Zemin';

# LIKE %代表多个字符 _代表单个字符
SELECT * FROM country WHERE HeadOfState LIKE '%Sh_i%';

# IFNULL(Population, 0); 会将NULL值全部替换为所需要的值
# 判断是否为NULL不能用= 要用IS NULL 或 IS NOT NULL
# BETWEEN AND 用来替代>= AND <=
# IN 用x IN (a, b, c)来替代x = a OR b OR c
