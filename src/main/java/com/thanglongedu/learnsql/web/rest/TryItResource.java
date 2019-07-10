package com.thanglongedu.learnsql.web.rest;

import com.thanglongedu.learnsql.service.dto.ArrayTryItDTO;
import com.thanglongedu.learnsql.service.dto.RestoreDTO;
import com.thanglongedu.learnsql.service.dto.TryItQueryDTO;
import org.springframework.web.bind.annotation.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/api")
public class TryItResource {

    @PostMapping("/try-it")
    public List<ArrayTryItDTO> dataQuery(@RequestBody TryItQueryDTO tryItQueryDTO) {
        List<ArrayTryItDTO> list = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");

            String PASSWORD = "123456aA@";
            String USER_NAME = "root";
            String DB_URL = "jdbc:mysql://localhost:3306/LearnSQL?allowMultiQueries=true&?useUnicode=true&characterEncoding=utf8&useSSL=false&useLegacyDatetimeCode=false&serverTimezone=UTC";
            // String DB_URL = "jdbc:mysql://localhost:3306/LearnSQL";
            Connection conn = DriverManager.getConnection(DB_URL,
                USER_NAME, PASSWORD);

            // create statement
            Statement stm = null;
            stm = conn.createStatement();

            //query
            ResultSet result = null;

            boolean hasMoreResultSets = stm.execute(tryItQueryDTO.getQuery());

            READING_QUERY_RESULTS:
            // label
            while (hasMoreResultSets || stm.getUpdateCount() != -1) {
                if (hasMoreResultSets) {
                    ArrayTryItDTO arrayTryItDTO = new ArrayTryItDTO();

                    result = stm.getResultSet();

                    //get metadata
                    ResultSetMetaData meta = null;
                    meta = result.getMetaData();

                    Integer columnCount = meta.getColumnCount();

                    //get column names
                    ArrayList<String> cols = new ArrayList<String>();
                    for (int index = 1; index <= columnCount; index++)
                        cols.add(meta.getColumnName(index));

                    //fetch out rows
                    ArrayList<HashMap<String, Object>> rows =
                        new ArrayList<HashMap<String, Object>>();

                    while (result.next()) {
                        HashMap<String, Object> row = new HashMap<String, Object>();
                        for (String colName : cols) {
                            Object val = result.getObject(colName);
                            row.put(colName, val);
                        }
                        rows.add(row);
                    }
                    arrayTryItDTO.setRow(rows);
                    arrayTryItDTO.setUpdateCount(0);
                    arrayTryItDTO.setMess("");
                    list.add(arrayTryItDTO);

                    // handle your rs here
                } // if has rs
                else { // if ddl/dml/...
                    int queryResult = stm.getUpdateCount();
                    if (queryResult == -1) { // no more queries processed
                        break READING_QUERY_RESULTS;
                    } // no more queries processed
                    // handle success, failure, generated keys, etc here
                    ArrayTryItDTO arrayTryItDTO = new ArrayTryItDTO();
                    arrayTryItDTO.setRow(new ArrayList<>());
                    arrayTryItDTO.setUpdateCount(stm.getUpdateCount());
                    arrayTryItDTO.setMess("");
                    list.add(arrayTryItDTO);
                } // if ddl/dml/...

                // check to continue in the loop
                hasMoreResultSets = stm.getMoreResults();
            } // while results

            stm.close();

            return list;
        } catch (Exception ex) {
            System.out.print(ex.getMessage());
            ArrayTryItDTO arrayTryItDTO = new ArrayTryItDTO();
            arrayTryItDTO.setRow(new ArrayList<>());
            arrayTryItDTO.setUpdateCount(0);
            arrayTryItDTO.setMess(ex.getMessage());
            list.add(arrayTryItDTO);
            return list;
        }
    }

    @PostMapping("/create-table")
    public RestoreDTO createTableName(@RequestBody TryItQueryDTO tryItQueryDTO) {
        RestoreDTO restoreDTO = new RestoreDTO();
        try {
            Class.forName("com.mysql.jdbc.Driver");

            String PASSWORD = "123456aA@";
            String USER_NAME = "root";
            String DB_URL = "jdbc:mysql://localhost:3306/LearnSQL?allowMultiQueries=true&?useUnicode=true&characterEncoding=utf8&useSSL=false&useLegacyDatetimeCode=false&serverTimezone=UTC";
            // String DB_URL = "jdbc:mysql://localhost:3306/LearnSQL";
            Connection conn = DriverManager.getConnection(DB_URL,
                USER_NAME, PASSWORD);

            // create statement
            Statement stm = null;
            stm = conn.createStatement();

            String nametable[] = tryItQueryDTO.getQuery().split(" ", 4);
            System.out.println("tryItQueryDTO: ==================================");
            for (String x : nametable) {
                System.out.println(x);
            }

            System.out.println("tryItQueryDTO: ==================================");
            String params = nametable[2];
            System.out.println(params);
            //query
            ResultSet result = null;

            stm.executeUpdate(tryItQueryDTO.getQuery());

            String sql = "INSERT INTO dbtest (name) VALUES (\'" + params + "\');";
            System.out.println("sql:" + sql);
            stm.executeUpdate(sql);

            stm.close();

            restoreDTO.setRestore("Create a successful table.");
            return restoreDTO;
        } catch (Exception ex) {
            System.out.print(ex.getMessage());
            restoreDTO.setRestore(ex.getMessage());
            return restoreDTO;
        }
    }

    @PostMapping("/loadTable")
    public List<RestoreDTO> loadTable() {
        List<RestoreDTO> list = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");

            String PASSWORD = "123456aA@";
            String USER_NAME = "root";
            String DB_URL = "jdbc:mysql://localhost:3306/LearnSQL?allowMultiQueries=true&?useUnicode=true&characterEncoding=utf8&useSSL=false&useLegacyDatetimeCode=false&serverTimezone=UTC";
            // String DB_URL = "jdbc:mysql://localhost:3306/LearnSQL";
            Connection conn = DriverManager.getConnection(DB_URL,
                USER_NAME, PASSWORD);

            // create statement
            Statement stm = null;
            stm = conn.createStatement();

            Statement statement2 = conn.createStatement();

            ResultSet result = null;

            String sql = "SELECT name FROM dbtest";
            stm.execute(sql);
            result = stm.getResultSet();
            while (result.next()) {
                RestoreDTO restoreDTO = new RestoreDTO();
                restoreDTO.setRestore(result.getString("name"));

                String countNumber = "SELECT count(*) FROM " + result.getString("name");
                statement2.execute(countNumber);
                ResultSet resultSet2 = statement2.getResultSet();
                while (resultSet2.next()) {
                    restoreDTO.setNumberRow(resultSet2.getInt(1));
                }
                list.add(restoreDTO);
            }
            statement2.close();
            stm.close();
            return list;
        } catch (Exception ex) {
            System.out.print(ex.getMessage());
            RestoreDTO restoreDTO = new RestoreDTO();
            restoreDTO.setRestore(ex.getMessage());
            restoreDTO.setNumberRow(0);
            list.add(restoreDTO);
            return list;
        }
    }

    @PostMapping("/delete-table")
    public RestoreDTO deleteTableName() {
        RestoreDTO restoreDTO = new RestoreDTO();
        try {
            Class.forName("com.mysql.jdbc.Driver");

            String PASSWORD = "123456aA@";
            String USER_NAME = "root";
            String DB_URL = "jdbc:mysql://localhost:3306/LearnSQL?allowMultiQueries=true&?useUnicode=true&characterEncoding=utf8&useSSL=false&useLegacyDatetimeCode=false&serverTimezone=UTC";
            // String DB_URL = "jdbc:mysql://localhost:3306/LearnSQL";
            Connection conn = DriverManager.getConnection(DB_URL,
                USER_NAME, PASSWORD);

            // create statement
            Statement stm = null;
            stm = conn.createStatement();

            //query
            ResultSet result = null;

            List<String> list = new ArrayList<>();

            String dropTbl = "SELECT name FROM dbtest";
            stm.execute(dropTbl);
            result = stm.getResultSet();
            while (result.next()) {
                list.add(result.getString("name"));
            }

            for (String x : list) {
                String delDatabase = "DROP TABLE " + x;
                stm.executeUpdate(delDatabase);
            }

            String sql = "DELETE FROM dbtest";
            stm.executeUpdate(sql);

            stm.close();

            restoreDTO.setRestore("Delete Success");
            return restoreDTO;
        } catch (Exception ex) {
            System.out.print(ex.getMessage());
            restoreDTO.setRestore("Delete Fail");
            return restoreDTO;
        }
    }

    @PostMapping("/restore")
    public RestoreDTO restoreDatabase() {
        RestoreDTO restoreDTO = new RestoreDTO();
        try {
            Class.forName("com.mysql.jdbc.Driver");

            String PASSWORD = "123456aA@";
            String USER_NAME = "root";
            String DB_URL = "jdbc:mysql://localhost:3306/LearnSQL?allowMultiQueries=true&?useUnicode=true&characterEncoding=utf8&useSSL=false&useLegacyDatetimeCode=false&serverTimezone=UTC";
            Connection conn = DriverManager.getConnection(DB_URL,
                USER_NAME, PASSWORD);

            // create statement
            Statement stm = null;
            stm = conn.createStatement();

            String customer =
                "SET NAMES utf8mb4;\n" +
                    "SET FOREIGN_KEY_CHECKS = 0;\n" +
                    "\n" +
                    "DROP TABLE IF EXISTS `customer`;\n" +
                    "CREATE TABLE `customer`  (\n" +
                    "  `id` bigint(20) NOT NULL AUTO_INCREMENT,\n" +
                    "  `customer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,\n" +
                    "  `contact_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,\n" +
                    "  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,\n" +
                    "  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,\n" +
                    "  `postal_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,\n" +
                    "  `country` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,\n" +
                    "  PRIMARY KEY (`id`) USING BTREE\n" +
                    ") ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;\n" +
                    "\n" +
                    "INSERT INTO `customer` VALUES (1, 'Cháo Thỏ', 'Thor', '34 Đống Đa', 'Hà Nội', '8888', 'Vietnam');\n" +
                    "INSERT INTO `customer` VALUES (2, 'Jack Nguyễn', 'Jack', '986 Lê Thanh Nghị', 'Bắc Ninh', '1246', 'Vietnam');\n" +
                    "INSERT INTO `customer` VALUES (3, 'Trần Anh', 'Anh Trần', '3 Hoàng Diệu', 'TPHCM', '9999', 'Vietnam');\n" +
                    "INSERT INTO `customer` VALUES (4, 'Thiên Quốc', 'Thiên Quốc', '2351 Phan Đình Tùng', 'TPHCM', '9999', 'Vietnam');\n" +
                    "INSERT INTO `customer` VALUES (5, 'Mường Thanh', 'Thanh Thản', '35B Phan Chu Trinh', 'TPHCM', '9999', 'Vietnam');\n" +
                    "INSERT INTO `customer` VALUES (6, 'Phạm Nhật Vượng', 'Vượng Vingroup', '1 Láng Hạ', 'Quảng Ninh', '68306', 'Vietnam');\n" +
                    "INSERT INTO `customer` VALUES (7, 'Vũ Xuân Hà', 'Hà Vũ', '14 Tây Trà', 'Hà Nội', '8888', 'Vietnam');\n" +
                    "INSERT INTO `customer` VALUES (8, 'Hương Vũ', 'Hương', '14 Tây Trà', 'Hà Nội', '8888', 'Vietnam');\n" +
                    "INSERT INTO `customer` VALUES (9, 'Hoàng Trần Huy', 'Hoàng Trần', '57 Nam Dư', 'Hà Nội', '8888', 'Vietnam');\n" +
                    "INSERT INTO `customer` VALUES (10, 'Long Lê', 'Long', '7 Yên Duyên', 'Hà Nội', '8888', 'Vietnam');\n" +
                    "INSERT INTO `customer` VALUES (11, 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', 'Yesway', '7646', 'Norway');\n" +
                    "INSERT INTO `customer` VALUES (12, 'A', 'Skagen 21', 'Stavanger', 'Yesway', '7646', 'Norway');\n" +
                    "INSERT INTO `customer` VALUES (13, 'B', 'Skagen 21', 'Stavanger', 'Yesway', '7646', 'Norway');\n" +
                    "\n" +
                    "SET FOREIGN_KEY_CHECKS = 1;";

            String employees =
                "SET NAMES utf8mb4;\n" +
                    "SET FOREIGN_KEY_CHECKS = 0;\n" +
                    "\n" +
                    "DROP TABLE IF EXISTS `employees`;\n" +
                    "CREATE TABLE `employees`  (\n" +
                    "  `id` bigint(20) NOT NULL AUTO_INCREMENT,\n" +
                    "  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,\n" +
                    "  `first_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,\n" +
                    "  `birth_date` datetime(0) NOT NULL,\n" +
                    "  `notes` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,\n" +
                    "  PRIMARY KEY (`id`) USING BTREE\n" +
                    ") ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;\n" +
                    "\n" +
                    "INSERT INTO `employees` VALUES (1, 'Xuân Hà', 'Vũ', '1996-10-01 00:00:00', 'Đại Học Thăng Long');\n" +
                    "INSERT INTO `employees` VALUES (2, 'Lan Hương', 'Vũ', '1999-02-24 00:00:00', 'Đại Học Thăng Long');\n" +
                    "INSERT INTO `employees` VALUES (3, 'Long', 'Lê', '1999-02-04 00:00:00', 'Đại Học Thăng Long');\n" +
                    "INSERT INTO `employees` VALUES (4, 'Tùng Thanh', 'Lê', '1999-12-24 00:00:00', 'Kinh Tế Quốc Dân');\n" +
                    "INSERT INTO `employees` VALUES (5, 'Hoàng', 'Bùi', '1995-05-14 00:00:00', 'Kinh Tế Quốc Dân');\n" +
                    "INSERT INTO `employees` VALUES (6, 'Việt Hoàng', 'Nguyễn', '1994-07-30 00:00:00', 'Kinh Tế Quốc Dân');\n" +
                    "INSERT INTO `employees` VALUES (7, 'Duy', 'Bùi', '1996-02-18 00:00:00', 'Đại Học Thăng Long');\n" +
                    "INSERT INTO `employees` VALUES (8, 'Việt Trinh', 'Nguyễn', '1997-10-23 00:00:00', 'Kinh Doanh Và Công Nghệ');\n" +
                    "INSERT INTO `employees` VALUES (9, 'Huyền', 'Nguyễn', '1998-10-22 00:00:00', 'Kinh Doanh Và Công Nghệ');\n" +
                    "INSERT INTO `employees` VALUES (10, 'Hải', 'Lý', '1957-03-16 00:00:00', 'Sân Khấu Điện Ảnh');\n" +
                    "INSERT INTO `employees` VALUES (11, 'Thành', 'Trấn', '1975-06-15 00:00:00', 'Sân Khấu Điện Ảnh');\n" +
                    "INSERT INTO `employees` VALUES (12, 'Giang', 'Trường', '1975-11-12 00:00:00', 'Nhạc Viện Quốc Gia');\n" +
                    "INSERT INTO `employees` VALUES (13, 'Isaac', 'Nguyễn', '1987-11-12 00:00:00', 'Nhạc Viện Quốc Gia');\n" +
                    "INSERT INTO `employees` VALUES (14, 'Khởi My', 'Nguyễn', '1998-12-12 00:00:00', 'Nhạc Viện Quốc Gia');\n" +
                    "INSERT INTO `employees` VALUES (15, 'Chipu', 'Nguyễn', '1997-07-06 00:00:00', 'Đại Học Thăng Long');\n" +
                    "\n" +
                    "SET FOREIGN_KEY_CHECKS = 1;";

            String shipper =
                "SET NAMES utf8mb4;\n" +
                    "SET FOREIGN_KEY_CHECKS = 0;\n" +
                    "\n" +
                    "DROP TABLE IF EXISTS `shipper`;\n" +
                    "CREATE TABLE `shipper`  (\n" +
                    "  `id` bigint(20) NOT NULL AUTO_INCREMENT,\n" +
                    "  `shipper_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,\n" +
                    "  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,\n" +
                    "  PRIMARY KEY (`id`) USING BTREE\n" +
                    ") ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;\n" +
                    "\n" +
                    "INSERT INTO `shipper` VALUES (1, 'Minato Namikaze', '0972794074');\n" +
                    "INSERT INTO `shipper` VALUES (2, 'Hà Vũ Xuân', '0868123456');\n" +
                    "INSERT INTO `shipper` VALUES (3, 'Cô Cô', '0987623561');\n" +
                    "INSERT INTO `shipper` VALUES (4, 'Dương Quá', '0983561256');\n" +
                    "INSERT INTO `shipper` VALUES (5, 'Hải Yến', '0982346125');\n" +
                    "INSERT INTO `shipper` VALUES (6, 'Dương Đình Nghệ', '0912357167');\n" +
                    "INSERT INTO `shipper` VALUES (7, 'Lisa', '0923612465');\n" +
                    "INSERT INTO `shipper` VALUES (8, 'Lý Nhã Kỳ', '0943424123');\n" +
                    "INSERT INTO `shipper` VALUES (9, 'Đàm Vĩnh Hưng', '0912353234');\n" +
                    "INSERT INTO `shipper` VALUES (10, 'Sơn Tùng MTP', '0942367235');\n" +
                    "INSERT INTO `shipper` VALUES (11, 'Phạm Băng Băng', '0974535462');\n" +
                    "INSERT INTO `shipper` VALUES (12, 'Sở Kiều', '0954353472');\n" +
                    "INSERT INTO `shipper` VALUES (13, 'Tần Thủy Hoàng', '0975123233');\n" +
                    "INSERT INTO `shipper` VALUES (14, 'Lục Tiểu Linh Đồng', '0997312353');\n" +
                    "INSERT INTO `shipper` VALUES (15, 'Nguyễn Công Phượng', '0912356125');\n" +
                    "INSERT INTO `shipper` VALUES (16, 'Duy Mạnh', '0991235124');\n" +
                    "INSERT INTO `shipper` VALUES (17, 'Xuân Trường', '0942361245');\n" +
                    "INSERT INTO `shipper` VALUES (18, 'Đặng Văn Lâm', '0931246344');\n" +
                    "INSERT INTO `shipper` VALUES (19, 'Hồng Duy', '0931235125');\n" +
                    "INSERT INTO `shipper` VALUES (20, 'Bùi Tiến Dũng', '0931235218');\n" +
                    "INSERT INTO `shipper` VALUES (21, 'Bùi Tiến Dụng', '0952346234');\n" +
                    "INSERT INTO `shipper` VALUES (22, 'Linh Ka', '0913213652');\n" +
                    "INSERT INTO `shipper` VALUES (23, 'Linh Miu', '0912351234');\n" +
                    "INSERT INTO `shipper` VALUES (24, 'Phan Kim Cương', '0943215612');\n" +
                    "INSERT INTO `shipper` VALUES (25, 'Jennie Kim', '0974234624');\n" +
                    "INSERT INTO `shipper` VALUES (26, 'Kim Ji-soo', '0931235324');\n" +
                    "INSERT INTO `shipper` VALUES (27, 'Roseanne Park', '0423462346');\n" +
                    "INSERT INTO `shipper` VALUES (28, 'Hồ Ngọc Hà', '0974234654');\n" +
                    "INSERT INTO `shipper` VALUES (29, 'Mỹ Tâm', '0941246434');\n" +
                    "INSERT INTO `shipper` VALUES (30, 'Tuấn Hưng', '0941235234');\n" +
                    "INSERT INTO `shipper` VALUES (31, 'Đông Nhi', '0931235124');\n" +
                    "INSERT INTO `shipper` VALUES (32, 'Vũ Cát Tường', '0942135455');\n" +
                    "INSERT INTO `shipper` VALUES (33, 'Bùi Anh Tuấn', '0823412345');\n" +
                    "INSERT INTO `shipper` VALUES (34, 'Noo Phước Thịnh', '0913512334');\n" +
                    "INSERT INTO `shipper` VALUES (35, 'Tóc Tiên', '0931235864');\n" +
                    "\n" +
                    "SET FOREIGN_KEY_CHECKS = 1;";

            String orders =
                "SET NAMES utf8mb4;\n" +
                    "SET FOREIGN_KEY_CHECKS = 0;\n" +
                    "\n" +
                    "DROP TABLE IF EXISTS `orders`;\n" +
                    "CREATE TABLE `orders`  (\n" +
                    "  `id` bigint(20) NOT NULL AUTO_INCREMENT,\n" +
                    "  `order_date` datetime(0) NOT NULL,\n" +
                    "  `customer_id` bigint(20) NULL DEFAULT NULL,\n" +
                    "  `employees_id` bigint(20) NULL DEFAULT NULL,\n" +
                    "  `shipper_id` bigint(20) NULL DEFAULT NULL,\n" +
                    "  PRIMARY KEY (`id`) USING BTREE,\n" +
                    "  INDEX `fk_orders_customer_id`(`customer_id`) USING BTREE,\n" +
                    "  INDEX `fk_orders_employees_id`(`employees_id`) USING BTREE,\n" +
                    "  INDEX `fk_orders_shipper_id`(`shipper_id`) USING BTREE,\n" +
                    "  CONSTRAINT `fk_orders_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,\n" +
                    "  CONSTRAINT `fk_orders_employees_id` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,\n" +
                    "  CONSTRAINT `fk_orders_shipper_id` FOREIGN KEY (`shipper_id`) REFERENCES `shipper` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT\n" +
                    ") ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;\n" +
                    "\n" +
                    "INSERT INTO `orders` VALUES (1, '2019-06-07 13:37:03', 1, 2, 3);\n" +
                    "INSERT INTO `orders` VALUES (2, '2019-06-06 13:37:21', 1, 2, 2);\n" +
                    "INSERT INTO `orders` VALUES (3, '2019-06-08 13:37:34', 3, 2, 5);\n" +
                    "INSERT INTO `orders` VALUES (4, '2019-06-04 13:37:51', 7, 6, 4);\n" +
                    "INSERT INTO `orders` VALUES (5, '2019-06-06 13:37:57', 3, 9, 6);\n" +
                    "INSERT INTO `orders` VALUES (6, '2019-06-13 13:38:29', 10, 12, 12);\n" +
                    "INSERT INTO `orders` VALUES (7, '2019-05-28 13:38:36', 7, 8, 4);\n" +
                    "INSERT INTO `orders` VALUES (8, '2019-06-12 13:38:46', 5, 9, 8);\n" +
                    "INSERT INTO `orders` VALUES (9, '2019-06-05 13:38:58', 8, 5, 3);\n" +
                    "INSERT INTO `orders` VALUES (10, '2019-05-29 13:39:15', 3, 8, 5);\n" +
                    "INSERT INTO `orders` VALUES (11, '2019-05-31 13:39:24', 7, 5, 7);\n" +
                    "INSERT INTO `orders` VALUES (12, '2019-06-06 13:39:33', 8, 7, 5);\n" +
                    "INSERT INTO `orders` VALUES (13, '2019-06-01 13:39:43', 3, 4, 2);\n" +
                    "INSERT INTO `orders` VALUES (14, '2019-06-08 13:39:55', 8, 5, 3);\n" +
                    "INSERT INTO `orders` VALUES (15, '2019-06-13 13:40:02', 3, 7, 2);\n" +
                    "INSERT INTO `orders` VALUES (16, '2019-06-01 13:40:10', 2, 4, 5);\n" +
                    "INSERT INTO `orders` VALUES (17, '2019-06-08 13:40:24', 8, 6, 3);\n" +
                    "INSERT INTO `orders` VALUES (18, '2019-06-01 13:40:34', 2, 5, 1);\n" +
                    "INSERT INTO `orders` VALUES (19, '2019-06-06 13:40:41', 8, 7, 5);\n" +
                    "INSERT INTO `orders` VALUES (20, '2019-05-30 13:40:50', 9, 8, 5);\n" +
                    "INSERT INTO `orders` VALUES (21, '2019-05-30 13:40:50', 4, 5, 8);\n" +
                    "INSERT INTO `orders` VALUES (22, '2019-06-07 13:40:58', 8, 7, 3);\n" +
                    "INSERT INTO `orders` VALUES (23, '2019-06-07 13:41:08', 7, 6, 4);\n" +
                    "INSERT INTO `orders` VALUES (24, '2019-06-15 13:41:19', 3, 6, 2);\n" +
                    "INSERT INTO `orders` VALUES (25, '2019-06-09 13:41:29', 4, 7, 2);\n" +
                    "INSERT INTO `orders` VALUES (26, '2019-06-15 13:41:38', 3, 6, 2);\n" +
                    "INSERT INTO `orders` VALUES (27, '2019-05-29 13:41:45', 8, 7, 5);\n" +
                    "INSERT INTO `orders` VALUES (28, '2019-05-29 13:41:52', 4, 6, 3);\n" +
                    "INSERT INTO `orders` VALUES (29, '2019-05-29 13:42:17', 9, 7, 4);\n" +
                    "INSERT INTO `orders` VALUES (30, '2019-06-13 13:42:24', 9, 10, 10);\n" +
                    "\n" +
                    "SET FOREIGN_KEY_CHECKS = 1;";

            stm.executeUpdate(customer);
            stm.executeUpdate(employees);
            stm.executeUpdate(shipper);
            stm.executeUpdate(orders);

            stm.close();
            restoreDTO.setRestore("Restore Success");
            return restoreDTO;
        } catch (Exception ex) {
            ex.printStackTrace();
            restoreDTO.setRestore("Restore Fail");
            return restoreDTO;
        }
    }
}
