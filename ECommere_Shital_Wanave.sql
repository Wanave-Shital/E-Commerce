--Q1.Users can buy products.

mysql> mysql> select ProductID from Product where ProductID in (select ProductID from Seller where ProductName = 'Scarf');
+-----------+
| ProductID |
+-----------+
| P4        |
+-----------+
1 row in set (0.00 sec)



--Q2.The same products may be sold by multiple sellers

select SellerID from Product where ProductID in (select ProductID from Seller where ProductName = 'Skirt');
+----------+
| SellerID |
+----------+
| S1       |
| S3       |
+----------+
2 rows in set (0.00 sec)

--Q3.Products can have discounts, offers.
mysql> select DiscountID,ProductName from Product,Discount where Discountpercent>15.00;
+------------+-------------+
| DiscountID | ProductName |
+------------+-------------+
| D6         | Skirt       |
| D7         | Skirt       |
| D6         | Hoodie      |
| D7         | Hoodie      |
| D6         | Skirt       |
| D7         | Skirt       |
| D6         | Scarf       |
| D7         | Scarf       |
+------------+-------------+
8 rows in set (0.00 sec)


--Q4.Order can be cash on delivery, online payment.
--select Payment.OrderID from Payment where Payment_Type="COD";
mysql> select Payment.OrderID from Payment where Payment_Type="COD";
+---------+
| OrderID |
+---------+
| O1      |
| O3      |
| O4      |
+---------+
3 rows in set (0.00 sec)


--mysql> select Payment.OrderID from Payment where Payment_Type="OnlineMode";
+---------+
| OrderID |
+---------+
| O2      |
+---------+
1 row in set (0.00 sec)


--Q5.(BONUS) other “must have” use cases related to e-commerce.
mysql> select UnitPrice from Product where Bonus > 20;
+-----------+
| UnitPrice |
+-----------+
|       500 |
|       900 |
|       500 |
|       100 |
+-----------+
4 rows in set (0.01 sec)

----------------------------------------------------------------------------------------------------------

-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Address` (
  `AddressID` varchar(8) NOT NULL,
  `UserID` varchar(10) NOT NULL,
  `AddressLine` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `Country` varchar(8) DEFAULT NULL,
  `PostalCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`AddressID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
INSERT INTO `Address` VALUES ('A1','U1','Shivajinagar','Pune','MH','India','411007'),('A2','U2','MIDC ','Baramati','MH','India','413132'),('A3','U3','SB Road','Pune','MH','India','413112'),('A4','U4','Govt.Hospital','Baramati','MH','India','412116'),('A5','U5','A wing Apartment','Pune','MH','India','413222');
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cart_Product`
--

DROP TABLE IF EXISTS `Cart_Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cart_Product` (
  `ShoppingCardID` varchar(8) NOT NULL,
  `Product_ID` varchar(45) NOT NULL,
  PRIMARY KEY (`ShoppingCardID`,`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cart_Product`
--

LOCK TABLES `Cart_Product` WRITE;
/*!40000 ALTER TABLE `Cart_Product` DISABLE KEYS */;
INSERT INTO `Cart_Product` VALUES ('SC1','P1'),('SC2','P4'),('SC3','P2'),('SC4','P3'),('SC5','P6');
/*!40000 ALTER TABLE `Cart_Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Discount`
--

DROP TABLE IF EXISTS `Discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Discount` (
  `DiscountID` varchar(8) NOT NULL,
  `DiscountPercent` decimal(5,2) NOT NULL,
  PRIMARY KEY (`DiscountID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Discount`
--

LOCK TABLES `Discount` WRITE;
/*!40000 ALTER TABLE `Discount` DISABLE KEYS */;
INSERT INTO `Discount` VALUES ('D1',10.00),('D2',10.00),('D3',10.00),('D4',10.00),('D5',10.00);
/*!40000 ALTER TABLE `Discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoice`
--

DROP TABLE IF EXISTS `Invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoice` (
  `OrderID` varchar(8) NOT NULL,
  `InvoiceID` varchar(8) NOT NULL,
  `Invoice_Type` varchar(4) NOT NULL,
  `InvoiceAmount` decimal(10,0) NOT NULL,
  PRIMARY KEY (`InvoiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoice`
--

LOCK TABLES `Invoice` WRITE;
/*!40000 ALTER TABLE `Invoice` DISABLE KEYS */;
INSERT INTO `Invoice` VALUES ('O1','I1','F',5000),('O2','I2','F',4000),('O3','I3','F',6000);
/*!40000 ALTER TABLE `Invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order_Product`
--

DROP TABLE IF EXISTS `Order_Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Order_Product` (
  `OrderID` varchar(8) NOT NULL,
  `ProductID` varchar(8) NOT NULL,
  PRIMARY KEY (`OrderID`,`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_Product`
--

LOCK TABLES `Order_Product` WRITE;
/*!40000 ALTER TABLE `Order_Product` DISABLE KEYS */;
INSERT INTO `Order_Product` VALUES ('O1','P1'),('O2','P1'),('O3','P2'),('O4','P3'),('O5','P4');
/*!40000 ALTER TABLE `Order_Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Orders` (
  `OrderID` varchar(10) NOT NULL,
  `UserID` varchar(10) NOT NULL,
  `ProductID` varchar(45) NOT NULL,
  `Discount` varchar(10) DEFAULT NULL,
  `OrderDate` date NOT NULL,
  `Tax` decimal(10,0) NOT NULL,
  `TranactionStatus` varchar(45) NOT NULL,
  `Price` decimal(10,0) NOT NULL,
  `ItemQuantity` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES ('O1','U1','P1','10','2021-07-20',15,'Paid',500,'1'),('O2','U2','P2','10','2021-08-01',15,'Fail',600,'2'),('O3','U3','P3','10','2021-09-22',10,'Paid',1200,'2'),('O4','U4','P4','10','2021-09-12',10,'Paid',800,'1');
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Payment` (
  `PaymentID` varchar(10) NOT NULL,
  `OrderID` varchar(45) NOT NULL,
  `Payment_Type` varchar(45) NOT NULL,
  PRIMARY KEY (`PaymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
INSERT INTO `Payment` VALUES ('Py1','O1','COD'),('Py2','O2','OnlineMode'),('Py3','O3','COD'),('Py4','O4','COD');
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment_Card`
--

DROP TABLE IF EXISTS `Payment_Card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Payment_Card` (
  `CardID` varchar(10) NOT NULL,
  `PaymentID` varchar(10) NOT NULL,
  `CardNumber` varchar(20) NOT NULL,
  `CardExpMonth` int(11) NOT NULL,
  `CardExpYear` int(11) NOT NULL,
  PRIMARY KEY (`PaymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment_Card`
--

LOCK TABLES `Payment_Card` WRITE;
/*!40000 ALTER TABLE `Payment_Card` DISABLE KEYS */;
INSERT INTO `Payment_Card` VALUES ('C1','Py1','868842948812',8,2024);
/*!40000 ALTER TABLE `Payment_Card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product` (
  `ProductID` varchar(8) NOT NULL,
  `ProductName` varchar(45) NOT NULL,
  `UnitPrice` decimal(10,0) NOT NULL,
  `Bonus` decimal(10,0) NOT NULL,
  `ProductDecription` varchar(455) DEFAULT NULL,
  `Quantity` int(11) NOT NULL,
  `Discount` int(11) DEFAULT NULL,
  `UnitInStock` int(11) DEFAULT NULL,
  `UnitsInOrder` int(11) DEFAULT NULL,
  `SellerId` varchar(45) NOT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES ('P1','Skirt',500,25,'It Comfortable,looks nice',500,10,500,100,'S1'),('P2','Hoodie',900,25,'Hoodie a sweatshirt with a hood.',600,10,400,200,'S2'),('P3','Skirt',500,25,'It Comfortable,looks nice',400,100,100,100,'S3'),('P4','Scarf',100,25,'Scarf used for protection for the face',1000,10,800,500,'S4');
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Seller`
--

DROP TABLE IF EXISTS `Seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Seller` (
  `SellerID` varchar(8) NOT NULL,
  `UserID` varchar(8) NOT NULL,
  `CompanyName` varchar(45) NOT NULL,
  `SellerFirstName` varchar(45) NOT NULL,
  `SellerLastName` varchar(45) NOT NULL,
  `PhoneNo` varchar(45) NOT NULL,
  `EmailID` varchar(45) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Seller`
--

LOCK TABLES `Seller` WRITE;
/*!40000 ALTER TABLE `Seller` DISABLE KEYS */;
INSERT INTO `Seller` VALUES ('S1','U1','Adidas','Shrikant','Sharma','7896221234','shrikantsharma@gmail.com'),('S2','U2','Vajor','Kishor','Varma','9822455968','kishorvarma@gmail.com'),('S3','U3','Golden','Monahar','Kyade','7777712345','monahar@gmail.com'),('S4','U4','Adidas','Saurabh','Khade','9898989898','khade12@gmail.com');
/*!40000 ALTER TABLE `Seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shipper`
--

DROP TABLE IF EXISTS `Shipper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Shipper` (
  `ShipperID` varchar(8) NOT NULL,
  `CompanyName` varchar(45) DEFAULT NULL,
  `ContactName` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ShipperID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shipper`
--

LOCK TABLES `Shipper` WRITE;
/*!40000 ALTER TABLE `Shipper` DISABLE KEYS */;
INSERT INTO `Shipper` VALUES ('S1','BURBERRY','Shital','7798962276'),('S2','Adidas','Swara','67676712345'),('S3','Golden','Rohan','1234567899'),('S4','Burberry','Shivaji','56565656789');
/*!40000 ALTER TABLE `Shipper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shopping_Cart`
--

DROP TABLE IF EXISTS `Shopping_Cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Shopping_Cart` (
  `ShoppingID` varchar(8) NOT NULL,
  `UserID` varchar(10) DEFAULT NULL,
  `Qunatity` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ShoppingID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shopping_Cart`
--

LOCK TABLES `Shopping_Cart` WRITE;
/*!40000 ALTER TABLE `Shopping_Cart` DISABLE KEYS */;
INSERT INTO `Shopping_Cart` VALUES ('Shop1','U1','1'),('Shop2','U2','2'),('Shop3','U3','2'),('Shop4','U4','3');
/*!40000 ALTER TABLE `Shopping_Cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `UserId` varchar(8) NOT NULL,
  `UserFName` varchar(45) NOT NULL,
  `UserLName` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `DateCreated` date NOT NULL,
  PRIMARY KEY (`DateCreated`,`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES ('1','Shital','Wanave','12345678','2021-07-21'),('2','Swara','Khade','Ash@1123','2021-07-22'),('3','Rutuja','Dhole','Rutu@321','2021-08-01'),('4','Saurabhi','Mane','98765432','2021-08-04'),('5','Shivani','Jadav','Shivani@12','2021-08-12');

-- Dump completed on 2021-07-22  9:28:40
