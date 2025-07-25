-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2024 at 03:30 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)   SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '1234567890');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(186, 59, '::1', -1, 1),
(187, 60, '::1', -1, 1),
(188, 62, '::1', -1, 1),
(189, 61, '::1', -1, 1),
(190, 63, '::1', -1, 1),
(191, 73, '::1', -1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Bakery and Dairy'),
(2, 'Vegetables'),
(3, 'Fruits'),
(4, 'Canned foods'),
(5, 'Meat and Seafood'),
(6, 'oil and other products'),
(7, 'Rice and produces');

-- --------------------------------------------------------

--
-- Table structure for table `checkout_info`
--

CREATE TABLE `checkout_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `checkout_info`
--

INSERT INTO `checkout_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `cardname`, `expdate`, `prod_count`, `total_amt`) VALUES
(1, 26, 'user user', 'user@gmail.com', 'ktm', 'ktm', 'bagmati', 'user', '12/23', 5, 2339),
(2, 26, 'user user', 'user@gmail.com', 'ktm', 'ktm', 'bagmati', 'user', '12/22', 2, 850),
(3, 26, 'user user', 'user@gmail.com', 'ktm', 'ktm', 'bagmati', 'user', '12/23', 3, 1085),
(4, 26, 'user user', 'user@gmail.com', 'ktm', 'ktm', 'bagmati', 'user', '11/24', 2, 749),
(5, 26, 'user user', 'user@gmail.com', 'ktm', 'ktm', 'bagmati', 'user', '12/23', 2, 120),
(6, 26, 'user user', 'user@gmail.com', 'ktm', 'ktm', 'bagmati', 'happy', '11/24', 3, 1199),
(7, 26, 'user user', 'user@gmail.com', 'ktm', 'ktm', 'bagmati', 'happy', '12/23', 4, 885);

-- --------------------------------------------------------

--
-- Table structure for table `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com'),
(6, 'nitakhatiwada345@gamil.com'),
(7, 'user@gmail.com'),
(8, 'user445@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(91, 1, 70, 1, 399),
(92, 1, 62, 1, 300),
(93, 1, 63, 1, 550),
(94, 1, 61, 1, 235),
(95, 1, 59, 1, 855),
(96, 2, 63, 4, 2200),
(97, 2, 62, 1, 300),
(98, 3, 63, 1, 550),
(99, 3, 62, 1, 300),
(100, 3, 61, 1, 235),
(101, 4, 72, 1, 350),
(102, 4, 70, 1, 399),
(103, 5, 89, 1, 70),
(104, 5, 88, 1, 50),
(105, 6, 86, 1, 350),
(106, 6, 59, 1, 450),
(107, 6, 70, 1, 399),
(108, 7, 60, 1, 100),
(109, 7, 59, 1, 450),
(110, 7, 62, 1, 85),
(111, 7, 63, 1, 250);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(59, 3, 'Dragons fruit', 450, 'Dragon fruit is super tasty', '1714489964_fruit.jpg', 'fruits'),
(60, 7, 'Xtreme energy drink', 100, 'energy drink', '1714576974_energy.png', 'drinks'),
(61, 6, 'Cow Ghee', 400, 'ghee', '1714576878_ghee.jpg', 'oil'),
(62, 7, 'Jackpot Noodles', 85, 'noodles', '1714577112_jackpot-4.png', 'noodles'),
(63, 7, 'Pasta', 250, 'pasta', '1711529992_pasta.jpg', 'pasta'),
(70, 4, 'Almond', 399, 'Almonds', 'almonds.jpg', 'almonds'),
(71, 2, 'Carrots', 85, 'carrots', '1714576584_carrots.jpg', 'vegetable'),
(72, 6, '8 Drinks pack', 350, '8 different Soft Drinks', '1711530119_1711520687_drinks.jpg', 'drinks'),
(73, 2, 'Iskus', 150, 'iskus', '1714577023_iskus.JPG', 'vegetable'),
(74, 7, 'Chat Masala', 140, 'chat', '1714577289_chat.jpg', 'Chat'),
(75, 6, 'Salt', 200, 'salt', '1714577485_Aayo Noon or Ayo Salt.jpg', 'salt'),
(76, 1, 'crossient', 85, 'cheese crossient', '1711529743_1709827000_crossient.jpeg', 'Bakery'),
(77, 1, 'Chololate chip muffins', 200, 'muffins', '1711532638_banana-bread-muffins.jpg', 'Bakery'),
(78, 4, '5 lays chips', 300, 'Collection of 5 different flavor of lays chips', '1711516920_shop_01.jpg', 'canned food'),
(79, 2, 'Spinach', 35, 'Green spinach', 'spinach.jpg', 'Vegetable'),
(86, 1, 'Yak cheese ', 350, 'yak cheese', '1711529613_cheese.png', 'Dairy'),
(88, 1, 'Safal Milk', 50, 'cow milk', '1711529811_milk.jpg', 'Dairy'),
(89, 1, 'Brown Bread', 70, 'brown bread', '1711529869_brownbread.jpg', 'Bakery'),
(90, 1, 'White Bread', 75, 'Bread', '1711529917_nanglo.jpg', 'Bakery'),
(92, 7, 'Rice', 700, 'White Rice', '1711530048_newar.jpg', 'Rice'),
(94, 5, 'Pork meat', 999, 'pork', '1711530658_pork.jpg', 'meat'),
(95, 5, 'Beef', 890, 'beef', '1711530711_beef.jpg', 'meat'),
(96, 5, 'Beef Jerky', 799, 'beef jerky', '1711530770_beefjerky.jpg', 'meat'),
(97, 6, 'Amrit Oil', 350, 'oil', '1711531087_amrit.jpg', 'oil'),
(98, 5, 'Chicken Meat', 250, 'chicken', '1711531885_Packaged Chicken Thighs.jpg', 'meat'),
(99, 1, 'Yogurt', 150, 'dahi', '1711532076_Dairy-Farmers.jpg', 'Dairy'),
(100, 1, 'Dahi', 70, 'dahi', '1711532116_nd.jpg', 'Dairy'),
(101, 1, 'Chocolate Ice cream', 100, 'ice cream', '1711532166_icecrream.jpg', 'Dairy'),
(103, 1, 'Mini Muffins', 150, 'muffins', '1711532685_minimuffins.jpg', 'Bakery'),
(104, 1, 'Khari', 200, 'khari', '1711532728_khari.jpg', 'Bakery'),
(105, 1, 'Cookies', 80, 'cookies', '1711532762_cookies.jpg', 'Bakery'),
(109, 3, 'pomegranate (Aanar)', 300, 'Aanar', '1714576674_anar.jpg', 'fruits'),
(110, 3, 'White Apples (Nashpati)', 230, 'nashpati or white apples', '1714576742_naspati.jpg', 'fruits');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'new', 'user', 'user123@gmail.com', '1234567890@hello', '9448121558', '123456789', '12345'),
(26, 'user', 'user', 'user@gmail.com', '1one--1234', '1234567890', 'ktm', 'ktm');

--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `checkout_info`
--
ALTER TABLE `checkout_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `checkout_info`
--
ALTER TABLE `checkout_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `checkout_info`
--
ALTER TABLE `checkout_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `checkout_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
