/*
 Navicat Premium Data Transfer

 Source Server         : learnsql
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : learnsql

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 05/08/2019 00:31:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name_category` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `is_keyword` bit(1) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `name_table_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_date` timestamp(0) NULL DEFAULT NULL,
  `created_by` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `last_modified_date` timestamp(0) NULL DEFAULT NULL,
  `last_modified_by` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `category_type_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_category_category_type_id`(`category_type_id`) USING BTREE,
  CONSTRAINT `fk_category_category_type_id` FOREIGN KEY (`category_type_id`) REFERENCES `category_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'SQL Intro', 'Introduction to SQL', b'0', 'Introduction to SQL', NULL, '2019-04-23 17:00:00', 'admin', '2019-07-09 05:04:40', 'admin', 1);
INSERT INTO `category` VALUES (2, 'SQL Syntax', 'SQL Syntax', b'0', 'SQL Syntax', NULL, '2019-04-24 05:31:00', 'admin', '2019-07-09 04:35:05', 'admin', 1);
INSERT INTO `category` VALUES (3, 'SQL Select', 'SQL SELECT Statement', b'1', NULL, NULL, '2019-04-23 17:00:00', 'admin', '2019-04-23 17:00:00', 'admin', 1);
INSERT INTO `category` VALUES (4, 'SQL Select Distinct', 'SQL SELECT DISTINCT Statement', b'1', NULL, NULL, '2019-04-24 05:31:00', 'admin', '2019-04-24 05:31:00', 'admin', 1);
INSERT INTO `category` VALUES (5, 'SQL Create DB', 'SQL CREATE DATABASE Statement', b'1', NULL, NULL, '2019-06-04 05:31:00', 'admin', '2019-06-04 05:31:00', 'admin', 2);
INSERT INTO `category` VALUES (6, 'SQL Drop DB', 'SQL DROP DATABASE Statement', b'1', NULL, NULL, '2019-06-04 05:31:00', 'admin', '2019-06-04 05:31:00', 'admin', 2);
INSERT INTO `category` VALUES (7, 'SQL Backup DB', 'SQL BACKUP DATABASE for SQL Server', b'1', NULL, NULL, '2019-06-04 05:31:00', 'admin', '2019-06-04 05:31:00', 'admin', 2);
INSERT INTO `category` VALUES (8, 'SQL Create Table', 'SQL CREATE TABLE Statement', b'1', NULL, NULL, '2019-06-04 05:31:00', 'admin', '2019-06-04 05:31:00', 'admin', 2);
INSERT INTO `category` VALUES (9, 'SQL Drop Table', 'SQL DROP TABLE Statement', b'1', NULL, NULL, '2019-06-04 05:31:00', 'admin', '2019-06-04 05:31:00', 'admin', 2);
INSERT INTO `category` VALUES (10, 'SQL Alter Table', 'SQL ALTER TABLE Statement', b'1', NULL, NULL, '2019-06-04 05:31:00', 'admin', '2019-06-04 05:31:00', 'admin', 2);
INSERT INTO `category` VALUES (11, 'SQL Constraints', 'SQL Constraints', b'1', NULL, NULL, '2019-06-04 05:31:00', 'admin', '2019-06-04 05:31:00', 'admin', 2);
INSERT INTO `category` VALUES (12, 'SQL Not Null', 'SQL NOT NULL Constraint', b'1', NULL, NULL, '2019-06-04 05:31:00', 'admin', '2019-06-04 05:31:00', 'admin', 2);
INSERT INTO `category` VALUES (13, 'SQL Unique', 'SQL UNIQUE Constraint', b'1', NULL, NULL, '2019-06-04 05:31:00', 'admin', '2019-06-04 05:31:00', 'admin', 2);
INSERT INTO `category` VALUES (14, 'SQL Primary Key', 'SQL PRIMARY KEY Constraint', b'1', NULL, NULL, '2019-06-04 05:31:00', 'admin', '2019-06-04 05:31:00', 'admin', 2);
INSERT INTO `category` VALUES (15, 'SQL Foreign Key', 'SQL FOREIGN KEY Constraint', b'1', NULL, NULL, '2019-06-04 05:31:00', 'admin', '2019-06-04 05:31:00', 'admin', 2);
INSERT INTO `category` VALUES (16, 'SQL Check', 'SQL CHECK Constraint', b'0', NULL, NULL, '2019-06-04 05:31:00', 'admin', '2019-06-04 05:31:00', 'admin', 2);
INSERT INTO `category` VALUES (17, 'SQL Default', 'SQL DEFAULT Constraint', b'1', NULL, NULL, '2019-06-04 05:31:00', 'admin', '2019-06-04 05:31:00', 'admin', 2);
INSERT INTO `category` VALUES (18, 'SQL Index', 'SQL CREATE INDEX Statement', b'0', NULL, NULL, '2019-06-04 05:31:00', 'admin', '2019-06-04 05:31:00', 'admin', 2);
INSERT INTO `category` VALUES (19, 'SQL Auto Increment', 'SQL AUTO INCREMENT Field', b'1', NULL, NULL, '2019-06-04 05:31:00', 'admin', '2019-06-04 05:31:00', 'admin', 2);
INSERT INTO `category` VALUES (20, 'SQL Dates', 'SQL Working With Dates', b'1', NULL, NULL, '2019-06-04 05:31:00', 'admin', '2019-06-04 05:31:00', 'admin', 2);
INSERT INTO `category` VALUES (21, 'SQL Views', 'SQL Views', b'1', NULL, NULL, '2019-06-04 05:31:00', 'admin', '2019-06-04 05:31:00', 'admin', 2);
INSERT INTO `category` VALUES (22, 'SQL Injection', 'SQL Injection', b'1', NULL, NULL, '2019-06-04 05:31:00', 'admin', '2019-06-04 05:31:00', 'admin', 2);
INSERT INTO `category` VALUES (23, 'SQL Hosting', 'SQL Hosting', b'1', NULL, NULL, '2019-06-04 05:31:00', 'admin', '2019-06-04 05:31:00', 'admin', 2);
INSERT INTO `category` VALUES (24, 'SQL Where', 'SQL WHERE Clause', b'1', NULL, NULL, '2019-06-04 05:31:00', 'admin', '2019-06-04 05:31:00', 'admin', 1);
INSERT INTO `category` VALUES (25, 'SQL And, Or, Not', 'SQL AND, OR and NOT Operators', b'1', NULL, NULL, '2019-06-04 05:31:00', 'admin', '2019-06-04 05:31:00', 'admin', 1);
INSERT INTO `category` VALUES (26, 'SQL Order By', 'SQL ORDER BY Keyword', b'1', NULL, NULL, '2019-06-04 05:31:00', 'admin', '2019-06-04 05:31:00', 'admin', 1);
INSERT INTO `category` VALUES (27, 'SQL Insert Into', 'SQL INSERT INTO Statement', b'1', NULL, NULL, '2019-06-04 05:31:00', 'admin', '2019-06-04 05:31:00', 'admin', 1);
INSERT INTO `category` VALUES (28, 'SQL Null Values', 'SQL NULL Values', b'1', NULL, NULL, '2019-06-04 05:31:00', 'admin', '2019-06-04 05:31:00', 'admin', 1);
INSERT INTO `category` VALUES (29, 'SQL Update', 'SQL UPDATE Statement', b'1', NULL, NULL, '2019-06-04 05:31:00', 'admin', '2019-06-04 05:31:00', 'admin', 1);
INSERT INTO `category` VALUES (30, 'SQL Delete', 'SQL DELETE Statement', b'1', NULL, NULL, '2019-06-04 05:31:00', 'admin', '2019-06-04 05:31:00', 'admin', 1);
INSERT INTO `category` VALUES (31, 'SQL Select Top', 'SQL TOP, LIMIT or ROWNUM Clause', b'1', NULL, NULL, '2019-06-04 05:31:00', 'admin', '2019-06-04 05:31:00', 'admin', 1);
INSERT INTO `category` VALUES (32, 'SQL Min and Max', 'SQL MIN() and MAX() Functions', b'1', NULL, NULL, '2019-06-04 05:31:00', 'admin', '2019-06-04 05:31:00', 'admin', 1);
INSERT INTO `category` VALUES (33, 'SQL Count, Avg, Sum', 'SQL COUNT(), AVG() and SUM() Functions', b'1', NULL, NULL, '2019-06-04 05:31:00', 'admin', '2019-06-04 05:31:00', 'admin', 1);
INSERT INTO `category` VALUES (34, 'SQL Like', 'SQL LIKE Operator', b'1', NULL, NULL, '2019-06-04 05:31:00', 'admin', '2019-06-04 05:31:00', 'admin', 1);
INSERT INTO `category` VALUES (35, 'SQL In', 'SQL IN Operator', b'0', NULL, NULL, '2019-06-04 05:31:00', 'admin', '2019-06-04 05:31:00', 'admin', 1);
INSERT INTO `category` VALUES (36, 'SQL Between', 'SQL BETWEEN Operator', b'1', NULL, NULL, '2019-06-04 05:31:00', 'admin', '2019-06-04 05:31:00', 'admin', 1);

-- ----------------------------
-- Table structure for category_type
-- ----------------------------
DROP TABLE IF EXISTS `category_type`;
CREATE TABLE `category_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name_category_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_date` timestamp(0) NULL DEFAULT NULL,
  `created_by` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `last_modified_date` timestamp(0) NULL DEFAULT NULL,
  `last_modified_by` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category_type
-- ----------------------------
INSERT INTO `category_type` VALUES (1, 'SQL Tutorial', 'SQL is a standard language for storing, manipulating and retrieving data in databases.  Our SQL tutorial will teach you how to use SQL in: MySQL, SQL Server, MS Access, Oracle, Sybase, Informix, Postgres, and other database systems.', '2019-06-18 17:00:00', 'admin', '2019-07-10 19:07:33', 'admin');
INSERT INTO `category_type` VALUES (2, 'SQL Database', 'SQL Database', '2019-06-18 17:00:00', 'admin', '2019-06-18 17:00:00', 'admin');

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_date` timestamp(0) NULL DEFAULT NULL,
  `created_by` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `last_modified_date` timestamp(0) NULL DEFAULT NULL,
  `last_modified_by` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `category_id` bigint(20) NULL DEFAULT NULL,
  `type_content_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_content_category_id`(`category_id`) USING BTREE,
  INDEX `fk_content_type_content_id`(`type_content_id`) USING BTREE,
  CONSTRAINT `fk_content_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_content_type_content_id` FOREIGN KEY (`type_content_id`) REFERENCES `type_content` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of content
-- ----------------------------
INSERT INTO `content` VALUES (1, 'What is SQL?', 'SQL stands for Structured Query Language. SQL lets you access and manipulate databases. SQL became a standard of the American National Standards Institute (ANSI) in 1986, and of the International Organization for Standardization (ISO) in 1987', '2019-04-24 05:31:00', 'admin', '2019-04-24 05:31:00', 'admin', 1, 1);
INSERT INTO `content` VALUES (2, 'What Can SQL do?', 'SQL can execute queries against a database. SQL can retrieve data from a database. SQL can insert records in a database. SQL can update records in a database. SQL can delete records from a database.', '2019-04-24 05:31:00', 'admin', '2019-04-24 05:31:00', 'admin', 1, 1);
INSERT INTO `content` VALUES (3, 'SQL is a Standard - BUT....', 'Although SQL is an ANSI/ISO standard, there are different versions of the SQL language. However, to be compliant with the ANSI standard, they all support at least the major commands (such as SELECT, UPDATE, DELETE, INSERT, WHERE) in a similar manner', '2019-04-24 05:31:00', 'admin', '2019-04-24 05:31:00', 'admin', 1, 1);
INSERT INTO `content` VALUES (4, 'Note', 'Most of the SQL database programs also have their own proprietary extensions in addition to the SQL standard!', '2019-04-24 05:31:00', 'admin', '2019-04-24 05:31:00', 'admin', 1, 2);
INSERT INTO `content` VALUES (6, 'Semicolon after SQL Statements?', 'Some database systems require a semicolon at the end of each SQL statement.  Semicolon is the standard way to separate each SQL statement in database systems that allow more than one SQL statement to be executed in the same call to the server.', '2019-04-24 05:31:00', 'admin', '2019-04-24 05:31:00', 'admin', 2, 1);
INSERT INTO `content` VALUES (7, 'Some of The Most Important SQL Commands', 'SELECT - extracts data from a database. UPDATE - updates data in a database. DELETE - deletes data from a database', '2019-04-24 05:31:00', 'admin', '2019-04-24 05:31:00', 'admin', 2, 1);
INSERT INTO `content` VALUES (8, 'The SQL SELECT Statement', 'The SELECT statement is used to select data from a database. The data returned is stored in a result table, called the result-set.', '2019-04-24 05:31:00', 'admin', '2019-04-24 05:31:00', 'admin', 3, 1);
INSERT INTO `content` VALUES (9, 'SELECT Syntax', 'SELECT column1, column2, ... FROM table_name;', '2019-04-24 05:31:00', 'admin', '2019-04-24 05:31:00', 'admin', 3, 3);
INSERT INTO `content` VALUES (11, 'The SQL SELECT DISTINCT Statement', 'The SELECT DISTINCT statement is used to return only distinct (different) values.  Inside a table, a column often contains many duplicate values; and sometimes you only want to list the different (distinct) values.', '2019-04-24 05:31:00', 'admin', '2019-04-24 05:31:00', 'admin', 4, 1);
INSERT INTO `content` VALUES (12, 'SELECT DISTINCT Syntax', 'SELECT DISTINCT column1, column2, ... FROM table_name;', '2019-04-24 05:31:00', 'admin', '2019-04-24 05:31:00', 'admin', 4, 3);
INSERT INTO `content` VALUES (14, 'What is a NULL Value?', 'A field with a NULL value is a field with no value. If a field in a table is optional, it is possible to insert a new record or update a record without adding a value to this field. Then, the field will be saved with a NULL value', '2019-06-07 05:31:00', 'admin', '2019-06-07 05:31:00', 'admin', 28, 1);
INSERT INTO `content` VALUES (15, 'Note', 'A NULL value is different from a zero value or a field that contains spaces. A field with a NULL value is one that has been left blank during record creation!', '2019-06-07 05:31:00', 'admin', '2019-06-07 05:31:00', 'admin', 28, 2);
INSERT INTO `content` VALUES (16, 'How to Test for NULL Values?', 'It is not possible to test for NULL values with comparison operators, such as =, <, or <>. We will have to use the IS NULL and IS NOT NULL operators instead.', '2019-06-07 05:31:00', 'admin', '2019-06-07 05:31:00', 'admin', 28, 1);
INSERT INTO `content` VALUES (17, 'IS NULL Syntax', 'SELECT column_names FROM table_name WHERE column_name IS NULL;', '2019-06-07 05:31:00', 'admin', '2019-06-07 05:31:00', 'admin', 28, 3);
INSERT INTO `content` VALUES (18, 'IS NOT NULL Syntax', 'SELECT column_names FROM table_name WHERE column_name IS NOT NULL;', '2019-06-07 05:31:00', 'admin', '2019-06-07 05:31:00', 'admin', 28, 3);
INSERT INTO `content` VALUES (20, 'The IS NULL Operator', 'The IS NULL operator is used to test for empty values (NULL values)', '2019-06-07 05:31:00', 'admin', '2019-06-07 05:31:00', 'admin', 28, 1);
INSERT INTO `content` VALUES (21, 'Example', 'SELECT * FROM Orders WHERE Customer_id IS NULL;', '2019-06-07 05:31:00', 'admin', '2019-07-10 20:13:56', 'admin', 28, 6);
INSERT INTO `content` VALUES (22, 'The IS NOT NULL Operator', 'The IS NOT NULL operator is used to test for non-empty values (NOT NULL values)', '2019-06-07 05:31:00', 'admin', '2019-06-07 05:31:00', 'admin', 28, 1);
INSERT INTO `content` VALUES (23, 'Example', 'SELECT * FROM Orders WHERE Customer_id IS NOT NULL;', '2019-06-07 05:31:00', 'admin', '2019-07-10 20:14:23', 'admin', 28, 6);
INSERT INTO `content` VALUES (24, 'Tip', 'Always use IS NULL to look for NULL values.', '2019-06-07 05:31:00', 'admin', '2019-06-07 05:31:00', 'admin', 28, 5);
INSERT INTO `content` VALUES (25, 'References', 'https://www.youtube.com/embed/DUGppOtEX-s', '2019-06-08 05:31:00', 'admin', '2019-06-08 05:31:00', 'admin', 28, 7);
INSERT INTO `content` VALUES (26, 'Using SQL in Your Web Site', 'An RDBMS database program (i.e. MS Access, SQL Server, MySQL). To use a server-side scripting language, like PHP or ASP. To use SQL to get the data you want. To use HTML / CSS to style the page', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 1, 1);
INSERT INTO `content` VALUES (27, 'RDBMS', 'RDBMS stands for Relational Database Management System. RDBMS is the basis for SQL, and for all modern database systems such as MS SQL Server, IBM DB2, Oracle, MySQL, and Microsoft Access.', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 1, 1);
INSERT INTO `content` VALUES (28, 'SELECT Column Example', 'SELECT Customer_Name, City FROM Customer;', '2019-06-25 17:00:00', 'admin', '2019-07-10 20:14:45', 'admin', 3, 6);
INSERT INTO `content` VALUES (29, 'SELECT * Example', 'SELECT * FROM Customer;', '2019-06-25 17:00:00', 'admin', '2019-07-10 20:14:59', 'admin', 3, 6);
INSERT INTO `content` VALUES (30, 'SELECT Example Without DISTINCT', 'SELECT Country FROM Customer;', '2019-06-25 17:00:00', 'admin', '2019-07-10 20:15:08', 'admin', 4, 6);
INSERT INTO `content` VALUES (31, 'SELECT DISTINCT Examples', 'SELECT DISTINCT Country FROM Customer;', '2019-06-25 17:00:00', 'admin', '2019-07-10 20:15:24', 'admin', 4, 6);
INSERT INTO `content` VALUES (32, 'SELECT DISTINCT Examples', 'SELECT COUNT(DISTINCT Country) FROM Customer;', '2019-06-25 17:00:00', 'admin', '2019-07-10 20:15:36', 'admin', 4, 6);
INSERT INTO `content` VALUES (33, 'Note', 'The example above will not work in Firefox and Microsoft Edge! Because COUNT(DISTINCT column_name) is not supported in Microsoft Access databases. Firefox and Microsoft Edge are using Microsoft Access in our examples.', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 4, 2);
INSERT INTO `content` VALUES (34, 'The SQL WHERE Clause', 'The WHERE clause is used to filter records.\nThe WHERE clause is used to extract only those records that fulfill a specified condition.', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 24, 1);
INSERT INTO `content` VALUES (35, 'WHERE Syntax', 'SELECT column1, column2, ...\nFROM table_name\nWHERE condition;', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 24, 3);
INSERT INTO `content` VALUES (36, 'Note', 'The WHERE clause is not only used in SELECT statement, it is also used in UPDATE, DELETE statement, etc.!', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 24, 2);
INSERT INTO `content` VALUES (37, 'WHERE Clause Example', 'SELECT * FROM Customer WHERE Country=\'Vietnam\';', '2019-06-25 17:00:00', 'admin', '2019-07-10 20:16:20', 'admin', 24, 6);
INSERT INTO `content` VALUES (38, 'Example', 'SELECT * FROM Customer\nWHERE ID=1;', '2019-06-25 17:00:00', 'admin', '2019-07-10 20:16:48', 'admin', 24, 6);
INSERT INTO `content` VALUES (39, 'The SQL AND, OR and NOT Operators', 'The AND operator displays a record if all the conditions separated by AND are TRUE.\nThe OR operator displays a record if any of the conditions separated by OR is TRUE.\nThe NOT operator displays a record if the condition(s) is NOT TRUE.', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 25, 1);
INSERT INTO `content` VALUES (40, 'AND Syntax', 'SELECT column1, column2, ...\nFROM table_name\nWHERE condition1 AND condition2 AND condition3 ...;', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 25, 3);
INSERT INTO `content` VALUES (41, 'OR Syntax', 'SELECT column1, column2, ...\nFROM table_name\nWHERE condition1 OR condition2 OR condition3 ...;', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 25, 3);
INSERT INTO `content` VALUES (42, 'NOT Syntax', 'SELECT column1, column2, ...\nFROM table_name\nWHERE NOT condition;', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 25, 3);
INSERT INTO `content` VALUES (43, 'AND Example', 'SELECT * FROM Customer\nWHERE Country=\'Vietnam\' AND City=\'Hà Nội\';', '2019-06-25 17:00:00', 'admin', '2019-07-10 20:17:26', 'admin', 25, 6);
INSERT INTO `content` VALUES (44, 'OR Example', 'SELECT * FROM Customer\nWHERE Country=\'Vietnam\' OR City=\'Hà Nội\';', '2019-06-25 17:00:00', 'admin', '2019-07-10 20:17:50', 'admin', 25, 6);
INSERT INTO `content` VALUES (45, 'Example', 'SELECT * FROM Customers\nWHERE Country=\'Germany\' OR Country=\'Spain\';', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 25, 6);
INSERT INTO `content` VALUES (46, 'NOT Example', 'SELECT * FROM Customers\nWHERE NOT Country=\'Germany\';', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 25, 6);
INSERT INTO `content` VALUES (47, 'Combining AND, OR and NOT', 'SELECT * FROM Customer\nWHERE Country=\'Vietnam\' AND (City=\'Quảng Ninh\' OR City=\'Hà Nội\');', '2019-06-25 17:00:00', 'admin', '2019-07-10 20:18:54', 'admin', 25, 6);
INSERT INTO `content` VALUES (48, 'The SQL ORDER BY Keyword', 'The ORDER BY keyword is used to sort the result-set in ascending or descending order.\nThe ORDER BY keyword sorts the records in ascending order by default. To sort the records in descending order, use the DESC keyword.', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 26, 1);
INSERT INTO `content` VALUES (49, 'ORDER BY Syntax', 'SELECT column1, column2, ...\nFROM table_name\nORDER BY column1, column2, ... ASC|DESC;', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 26, 3);
INSERT INTO `content` VALUES (50, 'ORDER BY Example', 'SELECT * FROM Customer\nORDER BY Country;', '2019-06-25 17:00:00', 'admin', '2019-07-10 20:19:25', 'admin', 25, 6);
INSERT INTO `content` VALUES (51, 'ORDER BY DESC Example', 'SELECT * FROM Customers\nORDER BY Country DESC;', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 26, 6);
INSERT INTO `content` VALUES (52, 'ORDER BY Several Columns Example', 'SELECT * FROM Customer\nORDER BY Country, Customer_Name;', '2019-06-25 17:00:00', 'admin', '2019-07-10 20:19:42', 'admin', 26, 6);
INSERT INTO `content` VALUES (53, 'ORDER BY Several Columns Example 2', 'SELECT * FROM Customer\nORDER BY Country ASC, Customer_Name DESC;', '2019-06-25 17:00:00', 'admin', '2019-07-10 20:19:59', 'admin', 26, 6);
INSERT INTO `content` VALUES (54, 'The SQL INSERT INTO Statement', 'The INSERT INTO statement is used to insert new records in a table.', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 27, 1);
INSERT INTO `content` VALUES (55, 'INSERT INTO Syntax', 'INSERT INTO table_name (column1, column2, column3, ...)\nVALUES (value1, value2, value3, ...);', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 27, 3);
INSERT INTO `content` VALUES (56, 'INSERT INTO Example', 'INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)\nVALUES (\'Cardinal\', \'Tom B. Erichsen\', \'Skagen 21\', \'Stavanger\', \'4006\', \'Norway\');', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 27, 6);
INSERT INTO `content` VALUES (57, 'Insert Data Only in Specified Columns', 'INSERT INTO Customers (CustomerName, City, Country)\nVALUES (\'Cardinal\', \'Stavanger\', \'Norway\');', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 27, 6);
INSERT INTO `content` VALUES (58, 'The SQL UPDATE Statement', 'The UPDATE statement is used to modify the existing records in a table.', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 29, 1);
INSERT INTO `content` VALUES (59, 'UPDATE Syntax', 'UPDATE table_name\nSET column1 = value1, column2 = value2, ...\nWHERE condition;', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 29, 3);
INSERT INTO `content` VALUES (60, 'Note', 'Be careful when updating records in a table! Notice the WHERE clause in the UPDATE statement. The WHERE clause specifies which record(s) that should be updated. If you omit the WHERE clause, all records in the table will be updated!', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 29, 2);
INSERT INTO `content` VALUES (61, 'UPDATE Table', 'UPDATE Customers\nSET ContactName = \'Alfred Schmidt\', City= \'Frankfurt\'\nWHERE CustomerID = 1;', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 29, 6);
INSERT INTO `content` VALUES (62, 'UPDATE Multiple Records', 'UPDATE Customers\nSET ContactName=\'Juan\'\nWHERE Country=\'Mexico\';', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 29, 6);
INSERT INTO `content` VALUES (63, 'The SQL DELETE Statement', 'The DELETE statement is used to delete existing records in a table.', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 30, 1);
INSERT INTO `content` VALUES (64, 'DELETE Syntax', 'DELETE FROM table_name WHERE condition;', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 30, 3);
INSERT INTO `content` VALUES (65, 'Note', 'Be careful when deleting records in a table! Notice the WHERE clause in the DELETE statement. The WHERE clause specifies which record(s) should be deleted. If you omit the WHERE clause, all records in the table will be deleted!', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 30, 2);
INSERT INTO `content` VALUES (66, 'SQL DELETE Example', 'DELETE FROM Customers WHERE CustomerName=\'Alfreds Futterkiste\';', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 30, 6);
INSERT INTO `content` VALUES (67, 'Delete All Records', 'DELETE FROM table_name;', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 30, 6);
INSERT INTO `content` VALUES (68, 'The SQL SELECT TOP Clause', 'The SELECT TOP clause is used to specify the number of records to return.\nThe SELECT TOP clause is useful on large tables with thousands of records. Returning a large number of records can impact on performance.', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 31, 1);
INSERT INTO `content` VALUES (69, 'Note', 'Not all database systems support the SELECT TOP clause. MySQL supports the LIMIT clause to select a limited number of records, while Oracle uses ROWNUM.', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 31, 2);
INSERT INTO `content` VALUES (70, 'SQL Server / MS Access Syntax:', 'SELECT TOP number|percent column_name(s)\nFROM table_name\nWHERE condition;', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 31, 3);
INSERT INTO `content` VALUES (71, 'MySQL Syntax:', 'SELECT column_name(s)\nFROM table_name\nWHERE condition\nLIMIT number;', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 31, 3);
INSERT INTO `content` VALUES (72, 'Oracle Syntax:', 'SELECT column_name(s)\nFROM table_name\nWHERE ROWNUM <= number;', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 31, 3);
INSERT INTO `content` VALUES (73, 'SQL TOP, LIMIT and ROWNUM Examples', 'SELECT TOP 3 * FROM Customers;', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 31, 6);
INSERT INTO `content` VALUES (74, 'SQL TOP PERCENT Example', 'SELECT TOP 50 PERCENT * FROM Customers;', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 31, 6);
INSERT INTO `content` VALUES (75, 'ADD a WHERE CLAUSE', 'SELECT TOP 3 * FROM Customers\nWHERE Country=\'Germany\';', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 31, 6);
INSERT INTO `content` VALUES (76, 'The SQL MIN() and MAX() Functions', 'The MIN() function returns the smallest value of the selected column.\nThe MAX() function returns the largest value of the selected column.', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 32, 1);
INSERT INTO `content` VALUES (77, 'MIN() Syntax', 'SELECT MIN(column_name)\nFROM table_name\nWHERE condition;', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 32, 3);
INSERT INTO `content` VALUES (78, 'MAX() Syntax', 'SELECT MAX(column_name)\nFROM table_name\nWHERE condition;', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 32, 3);
INSERT INTO `content` VALUES (79, 'MIN() Example', 'SELECT MIN(Price) AS SmallestPrice\nFROM Products;', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 32, 6);
INSERT INTO `content` VALUES (80, 'MAX() Example', 'SELECT MAX(Price) AS LargestPrice\nFROM Products;', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 32, 6);
INSERT INTO `content` VALUES (81, 'The SQL COUNT(), AVG() and SUM() Functions', 'The COUNT() function returns the number of rows that matches a specified criteria.\nThe AVG() function returns the average value of a numeric column.\nThe SUM() function returns the total sum of a numeric column.', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 33, 1);
INSERT INTO `content` VALUES (82, 'COUNT() Syntax', 'SELECT COUNT(column_name)\nFROM table_name\nWHERE condition;', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 33, 3);
INSERT INTO `content` VALUES (83, 'AVG() Syntax', 'SELECT AVG(column_name)\nFROM table_name\nWHERE condition;', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 33, 3);
INSERT INTO `content` VALUES (84, 'SUM() Syntax', 'SELECT SUM(column_name)\nFROM table_name\nWHERE condition;', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 33, 3);
INSERT INTO `content` VALUES (85, 'The SQL LIKE Operator', 'The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.\n% - The percent sign represents zero, one, or multiple characters.\n_ - The underscore represents a single character.', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 34, 1);
INSERT INTO `content` VALUES (86, 'Note', 'MS Access uses an asterisk (*) instead of the percent sign (%), and a question mark (?) instead of the underscore (_).', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 34, 2);
INSERT INTO `content` VALUES (87, 'LIKE Syntax', 'SELECT column1, column2, ...\nFROM table_name\nWHERE columnN LIKE pattern;', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 34, 3);
INSERT INTO `content` VALUES (88, 'SQL LIKE Examples', 'SELECT * FROM Customers\nWHERE CustomerName LIKE \'a%\';', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 34, 6);
INSERT INTO `content` VALUES (89, 'SQL LIKE Examples', 'SELECT * FROM Customers\nWHERE CustomerName LIKE \'%a\';', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 34, 6);
INSERT INTO `content` VALUES (90, 'The SQL IN Operator', 'The IN operator allows you to specify multiple values in a WHERE clause.\nThe IN operator is a shorthand for multiple OR conditions.', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 35, 1);
INSERT INTO `content` VALUES (91, 'IN Syntax', 'SELECT column_name(s)\nFROM table_name\nWHERE column_name IN (value1, value2, ...);', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 35, 3);
INSERT INTO `content` VALUES (92, 'IN Syntax', 'SELECT column_name(s)\nFROM table_name\nWHERE column_name IN (SELECT STATEMENT);', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 35, 3);
INSERT INTO `content` VALUES (93, 'IN Operator Examples', 'SELECT * FROM Customers\nWHERE Country IN (\'Germany\', \'France\', \'UK\');', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 35, 6);
INSERT INTO `content` VALUES (94, 'The SQL BETWEEN Operator', 'The BETWEEN operator selects values within a given range. The values can be numbers, text, or dates.\nThe BETWEEN operator is inclusive: begin and end values are included. ', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 36, 1);
INSERT INTO `content` VALUES (95, 'BETWEEN Syntax', 'SELECT column_name(s)\nFROM table_name\nWHERE column_name BETWEEN value1 AND value2;', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 36, 3);
INSERT INTO `content` VALUES (96, 'BETWEEN Example', 'SELECT * FROM Products\nWHERE Price BETWEEN 10 AND 20;', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 36, 6);
INSERT INTO `content` VALUES (97, 'NOT BETWEEN Example', 'SELECT * FROM Products\nWHERE Price NOT BETWEEN 10 AND 20;', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 36, 6);
INSERT INTO `content` VALUES (98, 'BETWEEN with IN Example', 'SELECT * FROM Products\nWHERE Price BETWEEN 10 AND 20\nAND NOT CategoryID IN (1,2,3);', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 36, 6);
INSERT INTO `content` VALUES (99, 'BETWEEN Text Values Example', 'SELECT * FROM Products\nWHERE ProductName BETWEEN \'Carnarvon Tigers\' AND \'Mozzarella di Giovanni\'\nORDER BY ProductName;', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 36, 6);
INSERT INTO `content` VALUES (100, 'NOT BETWEEN Text Values Example', 'SELECT * FROM Products\nWHERE ProductName NOT BETWEEN \'Carnarvon Tigers\' AND \'Mozzarella di Giovanni\'\nORDER BY ProductName;', '2019-06-25 17:00:00', 'admin', '2019-06-25 17:00:00', 'admin', 36, 6);
INSERT INTO `content` VALUES (101, 'BETWEEN Dates Example', 'SELECT * FROM Orders WHERE Order_Date BETWEEN \'2019-07-05\' AND \'2019-07-12\';', '2019-06-25 17:00:00', 'admin', '2019-07-10 20:28:41', 'admin', 3, 6);

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `contact_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `postal_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, 'Cháo Thỏ', 'Thor', '34 Đống Đa', 'Hà Nội', '8888', 'Vietnam');
INSERT INTO `customer` VALUES (2, 'Jack Nguyễn', 'Jack', '986 Lê Thanh Nghị', 'Bắc Ninh', '1246', 'Vietnam');
INSERT INTO `customer` VALUES (3, 'Trần Anh', 'Anh Trần', '3 Hoàng Diệu', 'TPHCM', '9999', 'Vietnam');
INSERT INTO `customer` VALUES (4, 'Thiên Quốc', 'Thiên Quốc', '2351 Phan Đình Tùng', 'TPHCM', '9999', 'Vietnam');
INSERT INTO `customer` VALUES (5, 'Mường Thanh', 'Thanh Thản', '35B Phan Chu Trinh', 'TPHCM', '9999', 'Vietnam');
INSERT INTO `customer` VALUES (6, 'Phạm Nhật Vượng', 'Vượng Vingroup', '1 Láng Hạ', 'Quảng Ninh', '68306', 'Vietnam');
INSERT INTO `customer` VALUES (7, 'Vũ Xuân Hà', 'Hà Vũ', '14 Tây Trà', 'Hà Nội', '8888', 'Vietnam');
INSERT INTO `customer` VALUES (8, 'Hương Vũ', 'Hương', '14 Tây Trà', 'Hà Nội', '8888', 'Vietnam');
INSERT INTO `customer` VALUES (9, 'Hoàng Trần Huy', 'Hoàng Trần', '57 Nam Dư', 'Hà Nội', '8888', 'Vietnam');
INSERT INTO `customer` VALUES (10, 'Long Lê', 'Long', '7 Yên Duyên', 'Hà Nội', '8888', 'Vietnam');
INSERT INTO `customer` VALUES (11, 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', 'Yesway', '7646', 'Norway');
INSERT INTO `customer` VALUES (12, 'A', 'Skagen 21', 'Stavanger', 'Yesway', '7646', 'Norway');
INSERT INTO `customer` VALUES (13, 'B', 'Skagen 21', 'null', 'Yesway', '7646', 'Norway');

-- ----------------------------
-- Table structure for databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `databasechangelog`;
CREATE TABLE `databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DATEEXECUTED` datetime(0) NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of databasechangelog
-- ----------------------------
INSERT INTO `databasechangelog` VALUES ('00000000000001', 'jhipster', 'config/liquibase/changelog/00000000000000_initial_schema.xml', '2019-04-23 18:20:43', 1, 'EXECUTED', '7:41601557597e1094de7fb3656d819edf', 'createTable tableName=jhi_user; createTable tableName=jhi_authority; createTable tableName=jhi_user_authority; addPrimaryKey tableName=jhi_user_authority; addForeignKeyConstraint baseTableName=jhi_user_authority, constraintName=fk_authority_name, ...', '', NULL, '3.5.4', NULL, NULL, '6018441360');
INSERT INTO `databasechangelog` VALUES ('20190423111348-1', 'jhipster', 'config/liquibase/changelog/20190423111348_added_entity_CategoryType.xml', '2019-04-23 18:20:43', 2, 'EXECUTED', '7:6419172b8bde7cdf4c868aee9ee12349', 'createTable tableName=category_type; dropDefaultValue columnName=created_date, tableName=category_type; dropDefaultValue columnName=updated_date, tableName=category_type', '', NULL, '3.5.4', NULL, NULL, '6018441360');
INSERT INTO `databasechangelog` VALUES ('20190423111349-1', 'jhipster', 'config/liquibase/changelog/20190423111349_added_entity_Category.xml', '2019-04-23 18:20:43', 3, 'EXECUTED', '7:1e112985ae3ec69cb6e58e226a1d2b32', 'createTable tableName=category; dropDefaultValue columnName=created_date, tableName=category; dropDefaultValue columnName=updated_date, tableName=category', '', NULL, '3.5.4', NULL, NULL, '6018441360');
INSERT INTO `databasechangelog` VALUES ('20190423111350-1', 'jhipster', 'config/liquibase/changelog/20190423111350_added_entity_Content.xml', '2019-04-23 18:20:44', 4, 'EXECUTED', '7:dc4f270dee5ebdc5d21921ef8c5a34e7', 'createTable tableName=content; dropDefaultValue columnName=created_date, tableName=content; dropDefaultValue columnName=updated_date, tableName=content', '', NULL, '3.5.4', NULL, NULL, '6018441360');
INSERT INTO `databasechangelog` VALUES ('20190423111351-1', 'jhipster', 'config/liquibase/changelog/20190423111351_added_entity_SQLQuery.xml', '2019-04-23 18:20:44', 5, 'EXECUTED', '7:fb755b55e844ad5cede58156b28bf056', 'createTable tableName=sql_query; dropDefaultValue columnName=created_date, tableName=sql_query; dropDefaultValue columnName=updated_date, tableName=sql_query', '', NULL, '3.5.4', NULL, NULL, '6018441360');
INSERT INTO `databasechangelog` VALUES ('20190423111352-1', 'jhipster', 'config/liquibase/changelog/20190423111352_added_entity_TypeContent.xml', '2019-04-23 18:20:44', 6, 'EXECUTED', '7:4023f8949bdd4cfbc8574b64ea7ac90d', 'createTable tableName=type_content; dropDefaultValue columnName=created_date, tableName=type_content; dropDefaultValue columnName=updated_date, tableName=type_content', '', NULL, '3.5.4', NULL, NULL, '6018441360');
INSERT INTO `databasechangelog` VALUES ('20190423111353-1', 'jhipster', 'config/liquibase/changelog/20190423111353_added_entity_Exercises.xml', '2019-04-23 18:20:44', 7, 'EXECUTED', '7:32c5d9180a5b237ceb7282e9a984a9b6', 'createTable tableName=exercises; dropDefaultValue columnName=created_date, tableName=exercises; dropDefaultValue columnName=updated_date, tableName=exercises', '', NULL, '3.5.4', NULL, NULL, '6018441360');
INSERT INTO `databasechangelog` VALUES ('20190423111354-1', 'jhipster', 'config/liquibase/changelog/20190423111354_added_entity_ExercisesAnswer.xml', '2019-04-23 18:20:44', 8, 'EXECUTED', '7:69c8440732a9e0f1ad5b8279a78f4b0c', 'createTable tableName=exercises_answer; dropDefaultValue columnName=created_date, tableName=exercises_answer; dropDefaultValue columnName=updated_date, tableName=exercises_answer', '', NULL, '3.5.4', NULL, NULL, '6018441360');
INSERT INTO `databasechangelog` VALUES ('20190423111355-1', 'jhipster', 'config/liquibase/changelog/20190423111355_added_entity_Orders.xml', '2019-04-23 18:20:45', 9, 'EXECUTED', '7:5557c5f6bb6c20042e552a8cdc4dfb35', 'createTable tableName=orders; dropDefaultValue columnName=order_date, tableName=orders', '', NULL, '3.5.4', NULL, NULL, '6018441360');
INSERT INTO `databasechangelog` VALUES ('20190423111356-1', 'jhipster', 'config/liquibase/changelog/20190423111356_added_entity_Customer.xml', '2019-04-23 18:20:45', 10, 'EXECUTED', '7:040d2dd2923e4804138e834d4923bac6', 'createTable tableName=customer', '', NULL, '3.5.4', NULL, NULL, '6018441360');
INSERT INTO `databasechangelog` VALUES ('20190423111357-1', 'jhipster', 'config/liquibase/changelog/20190423111357_added_entity_Employees.xml', '2019-04-23 18:20:45', 11, 'EXECUTED', '7:d0a881afd22e9ab23ae7ba779cec332b', 'createTable tableName=employees; dropDefaultValue columnName=birth_date, tableName=employees', '', NULL, '3.5.4', NULL, NULL, '6018441360');
INSERT INTO `databasechangelog` VALUES ('20190423111358-1', 'jhipster', 'config/liquibase/changelog/20190423111358_added_entity_Shipper.xml', '2019-04-23 18:20:45', 12, 'EXECUTED', '7:650f68a81438adb351438030c6640630', 'createTable tableName=shipper', '', NULL, '3.5.4', NULL, NULL, '6018441360');
INSERT INTO `databasechangelog` VALUES ('20190423111349-2', 'jhipster', 'config/liquibase/changelog/20190423111349_added_entity_constraints_Category.xml', '2019-04-23 18:20:45', 13, 'EXECUTED', '7:f7e7604de585c54d2c0a6a806b36b62d', 'addForeignKeyConstraint baseTableName=category, constraintName=fk_category_category_type_id, referencedTableName=category_type', '', NULL, '3.5.4', NULL, NULL, '6018441360');
INSERT INTO `databasechangelog` VALUES ('20190423111350-2', 'jhipster', 'config/liquibase/changelog/20190423111350_added_entity_constraints_Content.xml', '2019-04-23 18:20:46', 14, 'EXECUTED', '7:28d925f20cc0572c4b70dcc51643bb6f', 'addForeignKeyConstraint baseTableName=content, constraintName=fk_content_category_id, referencedTableName=category; addForeignKeyConstraint baseTableName=content, constraintName=fk_content_type_content_id, referencedTableName=type_content', '', NULL, '3.5.4', NULL, NULL, '6018441360');
INSERT INTO `databasechangelog` VALUES ('20190423111353-2', 'jhipster', 'config/liquibase/changelog/20190423111353_added_entity_constraints_Exercises.xml', '2019-04-23 18:20:46', 15, 'EXECUTED', '7:a276cb85fc2bc56f9d93978ef5858420', 'addForeignKeyConstraint baseTableName=exercises, constraintName=fk_exercises_category_id, referencedTableName=category', '', NULL, '3.5.4', NULL, NULL, '6018441360');
INSERT INTO `databasechangelog` VALUES ('20190423111354-2', 'jhipster', 'config/liquibase/changelog/20190423111354_added_entity_constraints_ExercisesAnswer.xml', '2019-04-23 18:20:46', 16, 'EXECUTED', '7:33dc9b57958ec294e776601fd093f843', 'addForeignKeyConstraint baseTableName=exercises_answer, constraintName=fk_exercises_answer_exercises_id, referencedTableName=exercises', '', NULL, '3.5.4', NULL, NULL, '6018441360');
INSERT INTO `databasechangelog` VALUES ('20190423111355-2', 'jhipster', 'config/liquibase/changelog/20190423111355_added_entity_constraints_Orders.xml', '2019-04-23 18:20:47', 17, 'EXECUTED', '7:69f1aea5fdc4070329357e4a1850745d', 'addForeignKeyConstraint baseTableName=orders, constraintName=fk_orders_customer_id, referencedTableName=customer; addForeignKeyConstraint baseTableName=orders, constraintName=fk_orders_employees_id, referencedTableName=employees; addForeignKeyCons...', '', NULL, '3.5.4', NULL, NULL, '6018441360');

-- ----------------------------
-- Table structure for databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `databasechangeloglock`;
CREATE TABLE `databasechangeloglock`  (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime(0) NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of databasechangeloglock
-- ----------------------------
INSERT INTO `databasechangeloglock` VALUES (1, b'1', '2019-05-05 01:00:45', 'XUANHA (192.168.1.10)');

-- ----------------------------
-- Table structure for dbtest
-- ----------------------------
DROP TABLE IF EXISTS `dbtest`;
CREATE TABLE `dbtest`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for employees
-- ----------------------------
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `birth_date` datetime(0) NOT NULL,
  `notes` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employees
-- ----------------------------
INSERT INTO `employees` VALUES (1, 'Xuân Hà', 'Vũ', '1996-10-01 00:00:00', 'Đại Học Thăng Long');
INSERT INTO `employees` VALUES (2, 'Lan Hương', 'Vũ', '1999-02-24 00:00:00', 'Đại Học Thăng Long');
INSERT INTO `employees` VALUES (3, 'Long', 'Lê', '1999-02-04 00:00:00', 'Đại Học Thăng Long');
INSERT INTO `employees` VALUES (4, 'Tùng Thanh', 'Lê', '1999-12-24 00:00:00', 'Kinh Tế Quốc Dân');
INSERT INTO `employees` VALUES (5, 'Hoàng', 'Bùi', '1995-05-14 00:00:00', 'Kinh Tế Quốc Dân');
INSERT INTO `employees` VALUES (6, 'Việt Hoàng', 'Nguyễn', '1994-07-30 00:00:00', 'Kinh Tế Quốc Dân');
INSERT INTO `employees` VALUES (7, 'Duy', 'Bùi', '1996-02-18 00:00:00', 'Đại Học Thăng Long');
INSERT INTO `employees` VALUES (8, 'Việt Trinh', 'Nguyễn', '1997-10-23 00:00:00', 'Kinh Doanh Và Công Nghệ');
INSERT INTO `employees` VALUES (9, 'Huyền', 'Nguyễn', '1998-10-22 00:00:00', 'Kinh Doanh Và Công Nghệ');
INSERT INTO `employees` VALUES (10, 'Hải', 'Lý', '1957-03-16 00:00:00', 'Sân Khấu Điện Ảnh');
INSERT INTO `employees` VALUES (11, 'Thành', 'Trấn', '1975-06-15 00:00:00', 'Sân Khấu Điện Ảnh');
INSERT INTO `employees` VALUES (12, 'Giang', 'Trường', '1975-11-12 00:00:00', 'Nhạc Viện Quốc Gia');
INSERT INTO `employees` VALUES (13, 'Isaac', 'Nguyễn', '1987-11-12 00:00:00', 'Nhạc Viện Quốc Gia');
INSERT INTO `employees` VALUES (14, 'Khởi My', 'Nguyễn', '1998-12-12 00:00:00', 'Nhạc Viện Quốc Gia');
INSERT INTO `employees` VALUES (15, 'Chipu', 'Nguyễn', '1997-07-06 00:00:00', 'Đại Học Thăng Long');

-- ----------------------------
-- Table structure for exercises
-- ----------------------------
DROP TABLE IF EXISTS `exercises`;
CREATE TABLE `exercises`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name_exercises` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `question` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `score` int(11) NOT NULL,
  `time_on_minutes` int(11) NOT NULL,
  `created_date` timestamp(0) NULL DEFAULT NULL,
  `created_by` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `last_modified_date` timestamp(0) NULL DEFAULT NULL,
  `last_modified_by` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `category_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_exercises_category_id`(`category_id`) USING BTREE,
  CONSTRAINT `fk_exercises_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exercises
-- ----------------------------
INSERT INTO `exercises` VALUES (1, 'Exercise 1', 'Insert the missing statement to get all the columns from the Customers table.', 100, 60, '2019-04-24 05:31:00', 'admin', '2019-04-24 05:31:00', 'admin', 3);
INSERT INTO `exercises` VALUES (2, 'Exercise 2', 'Write a statement that will select the City column from the Customers table.', 100, 60, '2019-04-24 05:31:00', 'admin', '2019-04-24 05:31:00', 'admin', 3);
INSERT INTO `exercises` VALUES (3, 'Exercise 3', 'Select all the different values from the Country column in the Customers table.', 100, 60, '2019-04-24 05:31:00', 'admin', '2019-04-24 05:31:00', 'admin', 3);

-- ----------------------------
-- Table structure for exercises_answer
-- ----------------------------
DROP TABLE IF EXISTS `exercises_answer`;
CREATE TABLE `exercises_answer`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `result` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `is_correct` bit(1) NULL DEFAULT NULL,
  `created_date` timestamp(0) NULL DEFAULT NULL,
  `created_by` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `last_modified_date` timestamp(0) NULL DEFAULT NULL,
  `last_modified_by` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `exercises_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_exercises_answer_exercises_id`(`exercises_id`) USING BTREE,
  CONSTRAINT `fk_exercises_answer_exercises_id` FOREIGN KEY (`exercises_id`) REFERENCES `exercises` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exercises_answer
-- ----------------------------
INSERT INTO `exercises_answer` VALUES (1, ' SELECT  * FROM Customers;', b'1', '2019-04-24 05:31:00', 'admin', '2019-04-24 05:32:00', 'admin', 1);
INSERT INTO `exercises_answer` VALUES (2, ' SELECT  * FROM Customers', b'0', '2019-04-24 05:31:00', 'admin', '2019-04-24 05:31:00', 'admin', 1);
INSERT INTO `exercises_answer` VALUES (3, ' SELECT  * FROM Customers.', b'0', '2019-04-24 05:31:00', 'admin', '2019-04-24 05:31:00', 'admin', 1);
INSERT INTO `exercises_answer` VALUES (4, ' SELECT City FROM Customers;', b'1', '2019-04-24 05:31:00', 'admin', '2019-04-24 05:31:00', 'admin', 2);
INSERT INTO `exercises_answer` VALUES (5, ' SELECT City FROM Customers', b'0', '2019-04-24 05:31:00', 'admin', '2019-04-24 05:31:00', 'admin', 2);
INSERT INTO `exercises_answer` VALUES (6, ' SELECT * FROM Customers;', b'0', '2019-04-24 05:31:00', 'admin', '2019-04-24 05:31:00', 'admin', 2);
INSERT INTO `exercises_answer` VALUES (7, ' SELECT DISTINCT Country FROM Customers;', b'1', '2019-04-24 05:31:00', 'admin', '2019-04-24 05:31:00', 'admin', 3);
INSERT INTO `exercises_answer` VALUES (8, ' SELECT Country FROM Customers;', b'0', '2019-04-24 05:31:00', 'admin', '2019-04-24 05:31:00', 'admin', 3);
INSERT INTO `exercises_answer` VALUES (9, ' SELECT * Country FROM Customers', b'0', '2019-04-24 05:31:00', 'admin', '2019-04-24 05:31:00', 'admin', 3);
INSERT INTO `exercises_answer` VALUES (10, ' SELECT DISTINCT Country -> Customers;', b'0', '2019-04-24 05:31:00', 'admin', '2019-04-24 05:31:00', 'admin', 3);

-- ----------------------------
-- Table structure for jhi_authority
-- ----------------------------
DROP TABLE IF EXISTS `jhi_authority`;
CREATE TABLE `jhi_authority`  (
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jhi_authority
-- ----------------------------
INSERT INTO `jhi_authority` VALUES ('ROLE_ADMIN');
INSERT INTO `jhi_authority` VALUES ('ROLE_USER');

-- ----------------------------
-- Table structure for jhi_persistent_audit_event
-- ----------------------------
DROP TABLE IF EXISTS `jhi_persistent_audit_event`;
CREATE TABLE `jhi_persistent_audit_event`  (
  `event_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `principal` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `event_date` timestamp(0) NULL DEFAULT NULL,
  `event_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`event_id`) USING BTREE,
  INDEX `idx_persistent_audit_event`(`principal`, `event_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 431 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jhi_persistent_audit_event
-- ----------------------------
INSERT INTO `jhi_persistent_audit_event` VALUES (1, 'admin', '2019-04-23 11:21:34', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (2, 'admin', '2019-04-23 11:22:36', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (3, 'admin', '2019-04-23 11:35:57', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (4, 'admin', '2019-04-23 12:15:18', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (5, 'admin', '2019-04-24 06:59:49', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (6, 'admin', '2019-04-24 07:24:17', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (7, 'admin', '2019-04-24 07:24:20', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (8, 'admin', '2019-04-24 07:55:09', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (9, 'admin', '2019-04-28 02:59:36', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (10, 'admin', '2019-04-28 07:34:23', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (11, 'admin', '2019-04-28 07:57:12', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (12, 'admin', '2019-04-28 07:57:20', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (13, 'admin', '2019-04-28 09:02:19', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (14, 'admin', '2019-04-28 09:02:20', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (15, 'admin', '2019-05-01 02:52:47', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (16, 'admin', '2019-05-02 08:18:32', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (17, 'admin', '2019-05-02 08:42:08', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (18, 'admin', '2019-05-04 16:58:15', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (19, 'admin', '2019-05-04 17:15:47', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (20, 'admin', '2019-05-04 18:03:33', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (21, 'admin', '2019-05-05 13:42:00', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (22, 'admin', '2019-05-06 07:45:28', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (23, 'admin', '2019-05-06 07:45:46', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (24, 'admin', '2019-05-06 07:46:19', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (25, 'admin', '2019-05-06 07:50:57', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (26, 'user', '2019-05-06 07:51:17', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (27, 'admin', '2019-05-06 07:58:54', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (28, 'admin', '2019-05-06 08:06:16', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (29, 'admin', '2019-05-06 08:08:09', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (30, 'admin', '2019-05-06 08:10:46', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (31, 'admin', '2019-05-07 09:16:07', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (32, 'admin', '2019-05-07 09:25:41', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (33, 'admin', '2019-05-07 09:25:43', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (34, 'admin', '2019-05-07 09:25:44', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (35, 'admin', '2019-05-07 09:25:44', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (36, 'admin', '2019-05-07 09:25:45', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (37, 'admin', '2019-05-07 09:25:45', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (38, 'admin', '2019-05-07 09:27:25', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (39, 'admin', '2019-05-07 09:27:27', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (40, 'admin', '2019-05-07 09:28:06', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (41, 'admin', '2019-05-07 09:28:58', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (42, 'admin', '2019-05-07 09:30:09', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (43, 'admin', '2019-05-07 09:31:19', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (44, 'admin', '2019-05-07 09:41:19', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (45, 'admin', '2019-05-07 09:48:32', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (46, 'admin', '2019-05-13 01:43:36', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (47, 'admin', '2019-05-13 03:07:04', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (48, 'admin', '2019-05-13 06:55:25', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (49, 'admin', '2019-05-15 04:29:48', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (50, 'admin', '2019-05-15 05:08:06', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (51, 'admin', '2019-05-21 06:17:47', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (52, 'admin', '2019-05-21 07:15:05', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (53, 'admin', '2019-05-21 08:32:58', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (54, 'admin', '2019-05-21 08:47:54', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (55, 'admin', '2019-05-21 09:05:08', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (56, 'admin', '2019-05-21 15:21:47', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (57, 'admin', '2019-05-21 15:24:31', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (58, 'admin', '2019-05-25 06:35:32', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (59, 'admin', '2019-05-27 08:32:04', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (60, 'admin', '2019-05-27 08:32:11', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (61, 'admin', '2019-05-27 08:36:04', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (62, 'admin', '2019-05-27 08:57:25', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (63, 'user', '2019-05-27 09:01:17', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (64, 'admin', '2019-05-27 09:04:24', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (65, 'admin', '2019-05-27 09:27:10', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (66, 'admin', '2019-05-27 09:27:15', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (67, 'admin', '2019-05-28 03:14:51', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (68, 'admin', '2019-05-28 05:12:43', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (69, 'admin', '2019-05-28 05:12:48', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (70, 'admin', '2019-05-28 05:13:04', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (71, 'admin', '2019-05-28 05:13:05', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (72, 'admin', '2019-05-28 05:13:05', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (73, 'admin', '2019-05-28 14:30:33', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (74, 'admin', '2019-05-28 14:30:33', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (75, 'admin', '2019-05-28 16:45:10', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (76, 'ád', '2019-05-29 06:28:53', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (77, 'admin', '2019-05-29 08:13:16', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (78, 'admin', '2019-05-29 08:18:56', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (79, 'admin', '2019-05-29 08:28:53', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (80, 'admin', '2019-05-29 08:32:49', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (81, 'admin', '2019-05-29 08:32:58', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (82, 'sssd', '2019-05-29 08:33:08', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (83, 'admin', '2019-05-29 08:36:39', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (84, 'admin', '2019-05-29 08:52:40', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (85, 'user', '2019-05-29 08:52:49', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (86, 'admin', '2019-05-29 08:58:01', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (87, 'admin', '2019-05-29 08:58:08', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (88, 'admin', '2019-05-29 09:05:20', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (89, 'admin', '2019-05-29 09:06:28', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (90, 'user', '2019-05-29 09:09:31', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (91, 'admin', '2019-05-29 09:09:35', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (92, 'admin', '2019-05-29 14:00:25', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (93, 'admin', '2019-05-29 14:16:57', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (94, 'admin', '2019-05-29 14:19:28', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (95, 'user', '2019-05-29 14:19:46', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (96, 'admin', '2019-05-29 14:19:58', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (97, 'admin', '2019-05-29 14:24:40', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (98, 'admin', '2019-05-29 14:44:25', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (99, 'admin', '2019-05-29 14:49:12', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (100, 'admin', '2019-05-29 14:56:20', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (101, 'admin', '2019-05-29 15:03:59', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (102, 'admin', '2019-05-29 15:09:42', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (103, 'admin', '2019-05-29 15:19:35', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (104, 'admin', '2019-05-29 15:21:28', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (105, 'admin', '2019-05-29 15:23:58', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (106, 'admin', '2019-05-29 15:46:20', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (107, 'admin', '2019-05-29 16:25:36', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (108, 'admin', '2019-05-29 16:27:54', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (109, 'admin', '2019-05-29 16:32:07', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (110, 'admin', '2019-05-29 16:46:20', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (111, 'admin', '2019-05-29 16:47:23', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (112, 'admin', '2019-05-30 03:43:35', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (113, 'admin', '2019-05-30 06:33:26', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (114, 'admin', '2019-05-30 07:41:15', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (115, 'admin', '2019-05-30 09:16:54', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (116, 'admin', '2019-05-30 09:20:50', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (117, 'admin', '2019-05-30 09:26:10', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (118, 'admin', '2019-05-30 09:26:17', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (119, 'admin', '2019-05-30 09:33:06', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (120, 'admin', '2019-05-30 09:34:05', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (121, 'admin', '2019-05-30 09:44:35', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (122, 'asasd', '2019-05-30 09:46:51', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (123, 'admin', '2019-05-30 09:47:02', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (124, 'admin', '2019-05-30 09:48:31', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (125, 'admin', '2019-05-30 09:48:53', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (126, 'xuanhatlu', '2019-05-30 09:49:22', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (127, 'admin', '2019-05-30 09:52:08', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (128, 'admin', '2019-05-30 15:14:09', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (129, 'admin', '2019-05-30 15:26:45', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (130, 'admin', '2019-05-30 15:58:05', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (131, 'user', '2019-05-30 16:00:38', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (132, 'admin', '2019-05-30 16:07:23', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (133, 'admin', '2019-05-30 17:43:54', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (134, 'admin', '2019-05-30 17:55:42', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (135, 'admin', '2019-05-30 18:16:30', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (136, 'admin', '2019-05-31 06:25:19', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (137, 'admin', '2019-05-31 07:01:47', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (138, 'admin', '2019-05-31 07:12:48', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (139, 'admin', '2019-05-31 07:43:49', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (140, 'admin', '2019-05-31 07:53:03', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (141, 'admin', '2019-05-31 08:05:28', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (142, 'admin', '2019-05-31 08:21:03', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (143, 'admin', '2019-05-31 08:45:32', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (144, 'admin', '2019-05-31 08:46:00', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (145, 'admin', '2019-05-31 08:50:20', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (146, 'admin', '2019-05-31 08:54:57', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (147, 'admin', '2019-05-31 09:00:21', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (148, 'admin', '2019-05-31 09:00:41', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (149, 'admin', '2019-06-03 07:18:58', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (150, 'admin', '2019-06-03 07:59:12', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (151, 'admin', '2019-06-03 08:04:49', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (152, 'admin', '2019-06-03 08:05:02', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (153, 'admin', '2019-06-03 08:07:03', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (154, 'admin', '2019-06-03 08:55:15', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (155, 'admin', '2019-06-03 09:02:08', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (156, 'user', '2019-06-03 09:02:18', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (157, 'admin', '2019-06-03 09:02:59', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (158, 'admin', '2019-06-03 09:03:11', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (159, 'admin', '2019-06-03 16:16:04', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (160, 'admin', '2019-06-03 16:19:00', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (161, 'admin', '2019-06-03 16:32:13', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (162, 'admin', '2019-06-03 16:43:42', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (163, 'admin', '2019-06-03 16:49:28', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (164, 'admin', '2019-06-03 16:50:39', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (165, 'admin', '2019-06-03 17:35:39', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (166, 'admin', '2019-06-03 17:50:05', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (167, 'admin', '2019-06-04 05:59:57', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (168, 'admin', '2019-06-04 14:21:43', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (169, 'admin', '2019-06-04 14:27:49', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (170, 'admin', '2019-06-04 16:08:29', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (171, 'admin', '2019-06-04 16:17:01', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (172, 'admin', '2019-06-04 16:54:24', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (173, 'admin', '2019-06-04 18:06:27', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (174, 'admin', '2019-06-06 07:06:24', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (175, 'admin', '2019-06-06 08:44:44', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (176, 'admin', '2019-06-06 09:09:49', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (177, 'admin', '2019-06-06 09:13:51', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (178, 'admin', '2019-06-06 09:13:51', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (179, 'admin', '2019-06-06 14:26:34', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (180, 'admin', '2019-06-06 14:26:41', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (181, 'admin', '2019-06-06 14:32:44', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (182, 'admin', '2019-06-06 14:33:44', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (183, 'admin', '2019-06-06 15:02:25', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (184, 'admin', '2019-06-06 15:41:06', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (185, 'admin', '2019-06-06 15:41:11', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (186, 'admin', '2019-06-06 15:49:10', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (187, 'admin', '2019-06-06 16:17:52', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (188, 'admin', '2019-06-06 16:35:47', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (189, 'admin', '2019-06-06 16:35:47', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (190, 'admin', '2019-06-06 16:45:51', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (191, 'admin', '2019-06-06 16:46:22', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (192, 'admin', '2019-06-06 16:51:06', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (193, 'admin', '2019-06-06 17:26:23', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (194, 'admin', '2019-06-06 17:32:48', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (195, 'admin', '2019-06-06 18:06:45', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (196, 'admin', '2019-06-06 18:30:49', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (197, 'admin', '2019-06-06 18:35:00', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (198, 'admin', '2019-06-06 18:41:00', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (199, 'admin', '2019-06-06 18:47:32', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (200, 'admin', '2019-06-06 18:59:50', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (201, 'admin', '2019-06-06 19:46:45', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (202, 'admin', '2019-06-06 19:46:53', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (203, 'admin', '2019-06-07 15:36:11', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (204, 'admin', '2019-06-07 16:41:30', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (205, 'admin', '2019-06-07 16:56:53', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (206, 'admin', '2019-06-07 17:15:31', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (207, 'admin', '2019-06-07 17:20:36', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (208, 'admin', '2019-06-07 17:47:43', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (209, 'admin', '2019-06-07 17:50:50', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (210, 'admin', '2019-06-07 18:13:32', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (211, 'admin', '2019-06-07 18:26:13', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (212, 'admin', '2019-06-07 18:33:25', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (213, 'admin', '2019-06-07 18:36:12', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (214, 'admin', '2019-06-07 19:10:39', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (215, 'admin', '2019-06-07 19:46:30', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (216, 'admin', '2019-06-07 19:56:55', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (217, 'admin', '2019-06-10 08:04:39', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (218, 'admin', '2019-06-10 15:04:33', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (219, 'admin', '2019-06-10 18:06:41', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (220, 'admin', '2019-06-10 18:09:42', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (221, 'admin', '2019-06-10 19:22:49', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (222, 'admin', '2019-06-10 19:22:57', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (223, 'admin', '2019-06-10 19:43:39', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (224, 'admin', '2019-06-10 19:43:48', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (225, 'admin', '2019-06-10 20:01:22', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (226, 'admin', '2019-06-10 20:03:12', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (227, 'admin', '2019-06-10 20:04:09', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (228, 'admin', '2019-06-10 20:05:43', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (229, 'admin', '2019-06-11 14:06:50', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (230, 'admin', '2019-06-12 04:16:26', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (231, 'amdin', '2019-06-12 13:49:07', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (232, 'admin', '2019-06-12 13:49:12', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (233, 'admin', '2019-06-14 18:47:41', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (234, 'admin', '2019-06-14 18:49:12', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (235, 'admin', '2019-06-14 18:56:36', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (236, 'admin', '2019-06-14 18:58:51', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (237, 'admin', '2019-06-14 19:00:00', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (238, 'admin', '2019-06-14 19:09:03', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (239, 'admin', '2019-06-14 19:14:13', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (240, 'admin', '2019-06-14 19:26:48', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (241, 'admin', '2019-06-14 19:34:53', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (242, 'admin', '2019-06-14 19:44:49', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (243, 'admin', '2019-06-14 19:55:31', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (244, 'admin', '2019-06-14 20:03:47', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (245, 'admin', '2019-06-14 20:13:38', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (246, 'admin', '2019-06-14 20:20:08', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (247, 'admin', '2019-06-14 20:20:39', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (248, 'admin', '2019-06-14 20:40:32', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (249, 'admin', '2019-06-16 03:19:27', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (250, 'admin', '2019-06-16 03:19:28', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (251, 'admin', '2019-06-16 03:30:44', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (252, 'admin', '2019-06-16 03:33:08', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (253, 'admin', '2019-06-16 03:41:51', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (254, 'admin', '2019-06-16 04:06:57', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (255, 'admin', '2019-06-16 04:17:34', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (256, 'admin', '2019-06-16 04:30:33', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (257, 'admin', '2019-06-16 13:15:01', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (258, 'admin', '2019-06-16 17:12:34', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (259, 'admin', '2019-06-16 17:19:57', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (260, 'admin', '2019-06-16 17:25:12', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (261, 'admin', '2019-06-17 14:48:54', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (262, 'admin', '2019-06-17 14:51:20', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (263, 'admin', '2019-06-17 14:55:27', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (264, 'admin', '2019-06-17 15:05:19', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (265, 'admin', '2019-06-17 23:50:26', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (266, 'admin', '2019-06-18 00:22:06', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (267, 'admin', '2019-06-19 02:12:45', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (268, 'admin', '2019-06-19 03:34:56', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (269, 'admin', '2019-06-19 03:45:56', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (270, 'admin', '2019-06-19 04:38:54', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (271, 'admin', '2019-06-19 05:08:21', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (272, 'admin', '2019-06-19 05:43:19', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (273, 'admin', '2019-06-20 04:49:25', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (274, 'admin', '2019-06-20 04:51:45', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (275, 'admin', '2019-06-21 02:07:57', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (276, 'admin', '2019-06-21 02:08:16', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (277, 'admin', '2019-06-21 02:09:51', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (278, 'admin', '2019-06-21 02:41:22', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (279, 'admin', '2019-06-21 02:53:03', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (280, 'admin', '2019-06-23 14:47:41', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (281, 'admin', '2019-06-23 14:48:18', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (282, 'admin', '2019-06-24 06:28:29', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (283, 'admin', '2019-06-24 06:29:45', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (284, 'admin', '2019-06-24 06:32:23', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (285, 'admin', '2019-06-24 06:43:18', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (286, 'admin', '2019-06-24 06:45:07', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (287, 'admin', '2019-06-24 06:48:59', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (288, 'admin', '2019-06-24 06:49:20', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (289, 'admin', '2019-06-24 13:41:36', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (290, 'admin', '2019-06-24 14:58:08', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (291, 'admin', '2019-06-24 17:08:11', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (292, 'admin', '2019-06-25 14:56:49', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (293, 'admin', '2019-06-25 15:32:41', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (294, 'admin', '2019-06-25 16:29:35', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (295, 'admin', '2019-06-26 03:21:35', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (296, 'admin', '2019-06-26 03:26:55', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (297, 'admin', '2019-06-26 03:31:21', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (298, 'admin', '2019-06-26 03:44:33', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (299, 'admin', '2019-06-26 04:23:55', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (300, 'admin', '2019-07-01 02:26:16', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (301, 'admin', '2019-07-02 03:11:44', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (302, 'admin', '2019-07-02 03:37:56', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (303, 'admin', '2019-07-02 03:43:13', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (304, 'admin', '2019-07-02 04:04:46', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (305, 'admin', '2019-07-03 03:47:23', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (306, 'admn', '2019-07-03 03:56:53', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (307, 'admin', '2019-07-03 04:05:46', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (308, 'admin', '2019-07-03 04:10:11', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (309, 'admin', '2019-07-03 04:46:33', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (310, 'admin', '2019-07-03 05:14:13', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (311, 'admin', '2019-07-03 05:38:05', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (312, 'vuxuanha96', '2019-07-03 06:24:58', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (313, 'vuxuanha96', '2019-07-03 06:25:08', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (314, 'vuxuanha96', '2019-07-03 06:25:26', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (315, 'vuxuanha96', '2019-07-03 06:25:32', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (316, 'vuxuanha96', '2019-07-03 06:25:35', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (317, 'admin', '2019-07-03 06:25:47', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (318, 'admin', '2019-07-03 06:26:29', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (319, 'user', '2019-07-03 06:26:40', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (320, 'admin', '2019-07-03 06:26:58', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (321, 'a25597', '2019-07-03 06:31:56', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (322, 'a25597', '2019-07-03 06:32:06', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (323, 'a25597', '2019-07-03 06:32:09', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (324, 'a25597', '2019-07-03 06:32:13', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (325, 'admin', '2019-07-03 06:32:24', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (326, 'xuanhatlu', '2019-07-03 06:33:13', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (327, 'xuanhatlu', '2019-07-03 06:33:16', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (328, 'xuanhatlu', '2019-07-03 06:33:17', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (329, 'xuanhatlu', '2019-07-03 06:33:19', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (330, 'xuanhatlu', '2019-07-03 06:33:20', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (331, 'xuanhatlu', '2019-07-03 06:33:20', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (332, 'xuanhatlu', '2019-07-03 06:33:24', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (333, 'xuanhatlu', '2019-07-03 06:34:05', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (334, 'admin', '2019-07-03 06:35:29', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (335, 'vuxuanha96', '2019-07-03 06:36:11', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (336, 'vuxuanha96', '2019-07-03 06:36:14', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (337, 'vuxuanha96', '2019-07-03 06:36:19', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (338, 'vuxuanha96', '2019-07-03 06:36:23', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (339, 'vuxuanha96', '2019-07-03 06:36:26', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (340, 'vuxuanha96', '2019-07-03 06:38:25', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (341, 'admin', '2019-07-03 06:38:29', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (342, 'havu', '2019-07-03 06:39:48', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (343, 'havu', '2019-07-03 06:39:54', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (344, 'havu', '2019-07-03 06:40:13', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (345, 'havu', '2019-07-03 06:40:15', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (346, 'havu', '2019-07-03 06:40:24', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (347, 'havu', '2019-07-03 06:40:25', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (348, 'havu', '2019-07-03 06:40:26', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (349, 'havu', '2019-07-03 06:40:26', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (350, 'havu', '2019-07-03 06:40:26', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (351, 'havu', '2019-07-03 06:40:26', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (352, 'havu', '2019-07-03 06:43:06', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (353, 'havu', '2019-07-03 06:43:15', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (354, 'admin', '2019-07-03 06:43:29', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (355, 'admin', '2019-07-03 06:55:10', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (356, 'admin', '2019-07-03 07:04:24', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (357, 'a12345', '2019-07-03 07:07:23', 'AUTHENTICATION_FAILURE');
INSERT INTO `jhi_persistent_audit_event` VALUES (358, 'a12345', '2019-07-03 07:08:15', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (359, 'admin', '2019-07-03 07:24:45', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (360, 'a123', '2019-07-03 07:27:02', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (361, 'admin', '2019-07-04 00:53:41', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (362, 'admin', '2019-07-06 03:37:13', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (363, 'admin', '2019-07-06 03:40:37', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (364, 'admin', '2019-07-06 03:42:26', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (365, 'admin', '2019-07-06 04:12:28', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (366, 'admin', '2019-07-06 04:16:25', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (367, 'admin', '2019-07-06 04:16:25', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (368, 'admin', '2019-07-06 07:07:25', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (369, 'admin', '2019-07-08 15:00:22', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (370, 'admin', '2019-07-08 15:06:15', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (371, 'admin', '2019-07-08 15:23:56', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (372, 'admin', '2019-07-08 15:27:16', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (373, 'admin', '2019-07-09 04:32:46', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (374, 'admin', '2019-07-09 05:01:36', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (375, 'admin', '2019-07-09 05:04:32', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (376, 'admin', '2019-07-10 08:17:00', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (377, 'admin', '2019-07-10 08:21:17', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (378, 'admin', '2019-07-10 09:32:56', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (379, 'admin', '2019-07-10 18:43:13', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (380, 'admin', '2019-07-10 19:01:42', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (381, 'admin', '2019-07-10 19:33:12', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (382, 'admin', '2019-07-10 19:38:57', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (383, 'admin', '2019-07-10 19:41:22', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (384, 'admin', '2019-07-10 20:05:46', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (385, 'admin', '2019-07-10 20:24:59', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (386, 'admin', '2019-07-10 21:21:16', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (387, 'admin', '2019-07-10 21:28:41', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (388, 'admin', '2019-07-11 03:14:55', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (389, 'admin', '2019-07-27 14:35:19', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (390, 'admin', '2019-07-27 14:57:35', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (391, 'user', '2019-07-27 14:57:51', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (392, 'admin', '2019-07-27 15:19:28', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (393, 'admin', '2019-07-27 15:32:53', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (394, 'admin', '2019-07-27 15:35:09', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (395, 'admin', '2019-07-27 15:36:40', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (396, 'admin', '2019-07-27 15:37:52', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (397, 'admin', '2019-07-27 15:40:45', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (398, 'admin', '2019-07-27 15:47:45', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (399, 'admin', '2019-07-27 15:47:48', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (400, 'admin', '2019-07-27 15:49:54', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (401, 'admin', '2019-07-27 19:24:51', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (402, 'admin', '2019-07-27 19:28:02', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (403, 'admin', '2019-07-27 20:43:08', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (404, 'admin', '2019-08-03 13:58:10', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (405, 'user', '2019-08-03 17:09:10', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (406, 'admin', '2019-08-03 17:12:44', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (407, 'user', '2019-08-03 17:39:11', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (408, 'admin', '2019-08-03 18:11:14', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (409, 'admin', '2019-08-03 18:17:19', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (410, 'admin', '2019-08-03 19:31:03', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (411, 'admin', '2019-08-03 19:41:34', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (412, 'admin', '2019-08-03 19:49:08', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (413, 'admin', '2019-08-03 19:53:44', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (414, 'admin', '2019-08-03 19:55:28', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (415, 'admin', '2019-08-03 20:00:25', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (416, 'admin', '2019-08-03 20:09:13', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (417, 'admin', '2019-08-03 20:39:47', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (418, 'admin', '2019-08-03 20:41:11', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (419, 'admin', '2019-08-03 20:44:11', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (420, 'admin', '2019-08-03 20:50:04', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (421, 'admin', '2019-08-03 20:57:17', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (422, 'admin', '2019-08-03 20:57:52', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (423, 'admin', '2019-08-03 21:02:59', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (424, 'admin', '2019-08-03 21:03:47', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (425, 'admin', '2019-08-03 21:07:29', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (426, 'admin', '2019-08-03 21:10:19', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (427, 'admin', '2019-08-03 21:11:32', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (428, 'admin', '2019-08-03 21:11:51', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (429, 'admin', '2019-08-03 21:25:11', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (430, 'admin', '2019-08-03 21:47:06', 'AUTHENTICATION_SUCCESS');
INSERT INTO `jhi_persistent_audit_event` VALUES (431, 'admin', '2019-08-03 21:47:36', 'AUTHENTICATION_SUCCESS');

-- ----------------------------
-- Table structure for jhi_persistent_audit_evt_data
-- ----------------------------
DROP TABLE IF EXISTS `jhi_persistent_audit_evt_data`;
CREATE TABLE `jhi_persistent_audit_evt_data`  (
  `event_id` bigint(20) NOT NULL,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`event_id`, `name`) USING BTREE,
  INDEX `idx_persistent_audit_evt_data`(`event_id`) USING BTREE,
  CONSTRAINT `fk_evt_pers_audit_evt_data` FOREIGN KEY (`event_id`) REFERENCES `jhi_persistent_audit_event` (`event_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jhi_persistent_audit_evt_data
-- ----------------------------
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (11, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (11, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (76, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (76, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (82, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (82, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (122, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (122, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (179, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (179, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (223, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (223, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (224, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (224, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (231, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (231, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (284, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (284, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (306, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (306, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (312, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (312, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (313, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (313, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (314, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (314, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (315, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (315, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (316, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (316, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (321, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (321, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (322, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (322, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (323, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (323, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (324, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (324, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (326, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (326, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (327, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (327, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (328, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (328, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (329, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (329, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (330, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (330, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (331, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (331, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (332, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (332, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (333, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (333, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (335, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (335, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (336, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (336, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (337, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (337, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (338, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (338, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (339, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (339, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (340, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (340, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (342, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (342, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (343, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (343, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (344, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (344, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (345, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (345, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (346, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (346, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (347, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (347, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (348, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (348, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (349, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (349, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (350, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (350, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (351, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (351, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (352, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (352, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (353, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (353, 'type', 'org.springframework.security.authentication.BadCredentialsException');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (357, 'message', 'Bad credentials');
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (357, 'type', 'org.springframework.security.authentication.BadCredentialsException');

-- ----------------------------
-- Table structure for jhi_user
-- ----------------------------
DROP TABLE IF EXISTS `jhi_user`;
CREATE TABLE `jhi_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `image_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `activated` bit(1) NOT NULL,
  `lang_key` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `activation_key` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `reset_key` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_date` timestamp(0) NULL DEFAULT NULL,
  `reset_date` timestamp(0) NULL DEFAULT NULL,
  `last_modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `last_modified_date` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ux_user_login`(`login`) USING BTREE,
  UNIQUE INDEX `ux_user_email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jhi_user
-- ----------------------------
INSERT INTO `jhi_user` VALUES (1, 'system', '$2a$10$mE.qmcV0mFU5NcKh73TZx.z4ueI/.bDWbj0T1BYyqP481kGGarKLG', 'System', 'System', 'system@localhost', '', b'1', 'en', NULL, NULL, 'system', NULL, NULL, 'system', NULL);
INSERT INTO `jhi_user` VALUES (2, 'anonymoususer', '$2a$10$j8S5d7Sr7.8VTOYNviDPOeWX8KcYILUVJBsYV83Y5NtECayypx9lO', 'Anonymous', 'User', 'anonymous@localhost', '', b'1', 'en', NULL, NULL, 'system', NULL, NULL, 'system', NULL);
INSERT INTO `jhi_user` VALUES (3, 'admin', '$2a$10$wdrXbydCLTAIlUpuVSC4gOmqixNr34LjeMhTn6MTfLL.mpkdsTEQq', 'Administrator', 'Administrator', 'admin@localhost', '', b'1', 'vi', NULL, NULL, 'system', NULL, NULL, 'admin', '2019-06-10 20:09:53');
INSERT INTO `jhi_user` VALUES (4, 'user', '$2a$10$VEjxo0jq2YG9Rbk2HmX9S.k1uZBGYUHdUcid3g/vfiEl7lwWgOH/K', 'User', 'User', 'user@localhost', '', b'1', 'en', NULL, NULL, 'system', NULL, NULL, 'admin', '2019-07-03 06:26:32');
INSERT INTO `jhi_user` VALUES (5, 'xuanhatlu', '$2a$10$WVEomvYzQaWhJ0DUJLP1oukay/yMnJULFBIwReNvYo3VfM3n7cjCW', NULL, NULL, 'xuanhatlu@gmail.com', NULL, b'1', 'en', '80939082463376644836', '63548672726479499434', 'anonymousUser', '2019-05-30 09:48:23', '2019-07-03 04:06:05', 'anonymousUser', '2019-07-03 04:06:05');
INSERT INTO `jhi_user` VALUES (6, 'a25597', '$2a$10$bADg22IxvvgSSZRrCjLK1.PwAKDgfrez1VB9kHbRtUKVjxOckBlBG', NULL, NULL, 'a25597@thanglong.edu.vn', NULL, b'1', 'en', '15849346403280859504', NULL, 'anonymousUser', '2019-06-10 19:56:18', NULL, 'admin', '2019-07-03 06:26:10');
INSERT INTO `jhi_user` VALUES (8, 'havu', '$2a$10$U/YUrIGc8DcmaJXgzqdAluobgcjyjIhUNCR7W0aWqL.h2R3E/A.d6', NULL, NULL, 'havu@localhost', NULL, b'1', 'en', NULL, '82376803860710922766', 'admin', '2019-07-03 06:39:16', '2019-07-03 06:39:59', 'anonymousUser', '2019-07-03 06:39:59');
INSERT INTO `jhi_user` VALUES (11, 'a123', '$2a$10$WvQY/QGIJkXVtX9VEZl0BehhI0skQET4tqzFG5vMddnBzB6iL3nwy', NULL, NULL, 'vuxuanha96@gmail.com', NULL, b'1', 'en', NULL, NULL, 'admin', '2019-07-03 07:25:03', NULL, 'anonymousUser', '2019-07-03 07:26:52');

-- ----------------------------
-- Table structure for jhi_user_authority
-- ----------------------------
DROP TABLE IF EXISTS `jhi_user_authority`;
CREATE TABLE `jhi_user_authority`  (
  `user_id` bigint(20) NOT NULL,
  `authority_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`, `authority_name`) USING BTREE,
  INDEX `fk_authority_name`(`authority_name`) USING BTREE,
  CONSTRAINT `fk_authority_name` FOREIGN KEY (`authority_name`) REFERENCES `jhi_authority` (`name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `jhi_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jhi_user_authority
-- ----------------------------
INSERT INTO `jhi_user_authority` VALUES (1, 'ROLE_ADMIN');
INSERT INTO `jhi_user_authority` VALUES (3, 'ROLE_ADMIN');
INSERT INTO `jhi_user_authority` VALUES (11, 'ROLE_ADMIN');
INSERT INTO `jhi_user_authority` VALUES (1, 'ROLE_USER');
INSERT INTO `jhi_user_authority` VALUES (3, 'ROLE_USER');
INSERT INTO `jhi_user_authority` VALUES (4, 'ROLE_USER');
INSERT INTO `jhi_user_authority` VALUES (5, 'ROLE_USER');
INSERT INTO `jhi_user_authority` VALUES (6, 'ROLE_USER');
INSERT INTO `jhi_user_authority` VALUES (8, 'ROLE_USER');
INSERT INTO `jhi_user_authority` VALUES (11, 'ROLE_USER');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_date` datetime(0) NOT NULL,
  `customer_id` bigint(20) NULL DEFAULT NULL,
  `employees_id` bigint(20) NULL DEFAULT NULL,
  `shipper_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_orders_customer_id`(`customer_id`) USING BTREE,
  INDEX `fk_orders_employees_id`(`employees_id`) USING BTREE,
  INDEX `fk_orders_shipper_id`(`shipper_id`) USING BTREE,
  CONSTRAINT `fk_orders_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_orders_employees_id` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_orders_shipper_id` FOREIGN KEY (`shipper_id`) REFERENCES `shipper` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, '2019-06-07 13:37:03', 1, 2, 3);
INSERT INTO `orders` VALUES (2, '2019-06-06 13:37:21', 1, 2, 2);
INSERT INTO `orders` VALUES (3, '2019-06-08 13:37:34', 3, 2, 5);
INSERT INTO `orders` VALUES (4, '2019-06-04 13:37:51', 7, 6, 4);
INSERT INTO `orders` VALUES (5, '2019-06-06 13:37:57', 3, 9, 6);
INSERT INTO `orders` VALUES (6, '2019-06-13 13:38:29', 10, 12, 12);
INSERT INTO `orders` VALUES (7, '2019-05-28 13:38:36', 7, 8, 4);
INSERT INTO `orders` VALUES (8, '2019-06-12 13:38:46', 5, 9, 8);
INSERT INTO `orders` VALUES (9, '2019-06-05 13:38:58', 8, 5, 3);
INSERT INTO `orders` VALUES (10, '2019-05-29 13:39:15', 3, 8, 5);
INSERT INTO `orders` VALUES (11, '2019-05-31 13:39:24', 7, 5, 7);
INSERT INTO `orders` VALUES (12, '2019-06-06 13:39:33', 8, 7, 5);
INSERT INTO `orders` VALUES (13, '2019-06-01 13:39:43', 3, 4, 2);
INSERT INTO `orders` VALUES (14, '2019-06-08 13:39:55', 8, 5, 3);
INSERT INTO `orders` VALUES (15, '2019-06-13 13:40:02', 3, 7, 2);
INSERT INTO `orders` VALUES (16, '2019-06-01 13:40:10', 2, 4, 5);
INSERT INTO `orders` VALUES (17, '2019-06-08 13:40:24', 8, 6, 3);
INSERT INTO `orders` VALUES (18, '2019-06-01 13:40:34', 2, 5, 1);
INSERT INTO `orders` VALUES (19, '2019-06-06 13:40:41', 8, 7, 5);
INSERT INTO `orders` VALUES (20, '2019-05-30 13:40:50', 9, 8, 5);
INSERT INTO `orders` VALUES (21, '2019-05-30 13:40:50', 4, 5, 8);
INSERT INTO `orders` VALUES (22, '2019-06-07 13:40:58', 8, 7, 3);
INSERT INTO `orders` VALUES (23, '2019-06-07 13:41:08', 7, 6, 4);
INSERT INTO `orders` VALUES (24, '2019-06-15 13:41:19', 3, 6, 2);
INSERT INTO `orders` VALUES (25, '2019-06-09 13:41:29', 4, 7, 2);
INSERT INTO `orders` VALUES (26, '2019-06-15 13:41:38', 3, 6, 2);
INSERT INTO `orders` VALUES (27, '2019-05-29 13:41:45', 8, 7, 5);
INSERT INTO `orders` VALUES (28, '2019-05-29 13:41:52', 4, 6, 3);
INSERT INTO `orders` VALUES (29, '2019-05-29 13:42:17', 9, 7, 4);
INSERT INTO `orders` VALUES (30, '2019-06-13 13:42:24', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for shipper
-- ----------------------------
DROP TABLE IF EXISTS `shipper`;
CREATE TABLE `shipper`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shipper_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shipper
-- ----------------------------
INSERT INTO `shipper` VALUES (1, 'Minato Namikaze', '0972794074');
INSERT INTO `shipper` VALUES (2, 'Hà Vũ Xuân', '0868123456');
INSERT INTO `shipper` VALUES (3, 'Cô Cô', '0987623561');
INSERT INTO `shipper` VALUES (4, 'Dương Quá', '0983561256');
INSERT INTO `shipper` VALUES (5, 'Hải Yến', '0982346125');
INSERT INTO `shipper` VALUES (6, 'Dương Đình Nghệ', '0912357167');
INSERT INTO `shipper` VALUES (7, 'Lisa', '0923612465');
INSERT INTO `shipper` VALUES (8, 'Lý Nhã Kỳ', '0943424123');
INSERT INTO `shipper` VALUES (9, 'Đàm Vĩnh Hưng', '0912353234');
INSERT INTO `shipper` VALUES (10, 'Sơn Tùng MTP', '0942367235');
INSERT INTO `shipper` VALUES (11, 'Phạm Băng Băng', '0974535462');
INSERT INTO `shipper` VALUES (12, 'Sở Kiều', '0954353472');
INSERT INTO `shipper` VALUES (13, 'Tần Thủy Hoàng', '0975123233');
INSERT INTO `shipper` VALUES (14, 'Lục Tiểu Linh Đồng', '0997312353');
INSERT INTO `shipper` VALUES (15, 'Nguyễn Công Phượng', '0912356125');
INSERT INTO `shipper` VALUES (16, 'Duy Mạnh', '0991235124');
INSERT INTO `shipper` VALUES (17, 'Xuân Trường', '0942361245');
INSERT INTO `shipper` VALUES (18, 'Đặng Văn Lâm', '0931246344');
INSERT INTO `shipper` VALUES (19, 'Hồng Duy', '0931235125');
INSERT INTO `shipper` VALUES (20, 'Bùi Tiến Dũng', '0931235218');
INSERT INTO `shipper` VALUES (21, 'Bùi Tiến Dụng', '0952346234');
INSERT INTO `shipper` VALUES (22, 'Linh Ka', '0913213652');
INSERT INTO `shipper` VALUES (23, 'Linh Miu', '0912351234');
INSERT INTO `shipper` VALUES (24, 'Phan Kim Cương', '0943215612');
INSERT INTO `shipper` VALUES (25, 'Jennie Kim', '0974234624');
INSERT INTO `shipper` VALUES (26, 'Kim Ji-soo', '0931235324');
INSERT INTO `shipper` VALUES (27, 'Roseanne Park', '0423462346');
INSERT INTO `shipper` VALUES (28, 'Hồ Ngọc Hà', '0974234654');
INSERT INTO `shipper` VALUES (29, 'Mỹ Tâm', '0941246434');
INSERT INTO `shipper` VALUES (30, 'Tuấn Hưng', '0941235234');
INSERT INTO `shipper` VALUES (31, 'Đông Nhi', '0931235124');
INSERT INTO `shipper` VALUES (32, 'Vũ Cát Tường', '0942135455');
INSERT INTO `shipper` VALUES (33, 'Bùi Anh Tuấn', '0823412345');
INSERT INTO `shipper` VALUES (34, 'Noo Phước Thịnh', '0913512334');
INSERT INTO `shipper` VALUES (35, 'Tóc Tiên', '0931235864');

-- ----------------------------
-- Table structure for sql_query
-- ----------------------------
DROP TABLE IF EXISTS `sql_query`;
CREATE TABLE `sql_query`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_date` timestamp(0) NULL DEFAULT NULL,
  `created_by` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `last_modified_date` timestamp(0) NULL DEFAULT NULL,
  `last_modified_by` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sql_query
-- ----------------------------
INSERT INTO `sql_query` VALUES (1, 'SQL Syntax', 'sql_syntax', 'SELECT * FROM Customer;', ' Select all the records from a specific table (\"Customer\")', '2019-06-23 17:00:00', 'admin', '2019-07-10 18:45:19', 'admin');
INSERT INTO `sql_query` VALUES (2, 'SQL SELECT', 'select_columns', 'SELECT Customer_Name,City FROM Customer;', 'SELECT Columns', '2019-04-24 05:31:00', 'admin', '2019-07-10 18:47:48', 'admin');
INSERT INTO `sql_query` VALUES (3, 'SQL SELECT DISTINCT', 'select_distinct', 'SELECT DISTINCT Country FROM Customer;', 'SELECT DISTINCT', '2019-04-24 05:31:00', 'admin', '2019-07-10 18:46:21', 'admin');
INSERT INTO `sql_query` VALUES (4, 'SQL SELECT DISTINCT', 'select_distinct2', 'SELECT COUNT(DISTINCT Country) FROM Customer;', ' SELECT COUNT(DISTINCT column_name)', '2019-04-24 05:31:00', 'admin', '2019-07-10 18:48:37', 'admin');
INSERT INTO `sql_query` VALUES (5, 'SQL WHERE', 'sql_where', 'SELECT * FROM Customer WHERE Postal_Code = 8888;', 'WHERE Clause', '2019-04-24 05:31:00', 'admin', '2019-07-10 18:50:00', 'admin');
INSERT INTO `sql_query` VALUES (6, 'SQL AND, OR and NOT Operators', 'sql_and', 'SELECT * FROM Customer WHERE Country = \'Vietnam\' AND Postal_Code = 8888', 'AND', '2019-07-10 19:35:54', 'admin', '2019-07-10 19:35:54', 'admin');

-- ----------------------------
-- Table structure for type_content
-- ----------------------------
DROP TABLE IF EXISTS `type_content`;
CREATE TABLE `type_content`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name_type_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL,
  `created_date` timestamp(0) NULL DEFAULT NULL,
  `created_by` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `last_modified_date` timestamp(0) NULL DEFAULT NULL,
  `last_modified_by` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type_content
-- ----------------------------
INSERT INTO `type_content` VALUES (1, 'Paragraph', 1, '2019-04-24 05:31:00', 'admin', '2019-04-24 05:31:00', 'admin');
INSERT INTO `type_content` VALUES (2, 'Note', 2, '2019-04-24 05:31:00', 'admin', '2019-04-24 05:31:00', 'admin');
INSERT INTO `type_content` VALUES (3, 'Syntax', 3, '2019-04-24 05:31:00', 'admin', '2019-04-24 05:31:00', 'admin');
INSERT INTO `type_content` VALUES (4, 'Table Data', 4, '2019-04-24 05:31:00', 'admin', '2019-04-24 05:31:00', 'admin');
INSERT INTO `type_content` VALUES (5, 'Tip', 5, '2019-06-07 05:31:00', 'admin', '2019-06-07 05:31:00', 'admin');
INSERT INTO `type_content` VALUES (6, 'Example', 6, '2019-06-07 05:31:00', 'admin', '2019-06-07 05:31:00', 'admin');
INSERT INTO `type_content` VALUES (7, 'Document', 7, '2019-06-07 05:31:00', 'admin', '2019-06-07 05:31:00', 'admin');
INSERT INTO `type_content` VALUES (8, 'Question & Answer', 8, '2019-08-03 20:01:58', 'admin', '2019-08-03 20:01:58', 'admin');

SET FOREIGN_KEY_CHECKS = 1;
