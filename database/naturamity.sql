-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 15, 2022 at 12:06 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `naturamity`
--

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_text` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','archived','','') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `sender_id`, `title`, `message_text`, `status`) VALUES
(1, 5, 'Naslov', 'Texst poruke', 'active'),
(2, 5, 'naslov poruke', 'poruka', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `customer_id` int(11) NOT NULL,
  `status` enum('active','finished','') COLLATE utf8mb4_unicode_ci DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `date`, `customer_id`, `status`) VALUES
(39, '2022-09-10', 5, 'finished'),
(42, '2022-09-12', 5, 'active'),
(43, '2022-09-12', 5, 'finished'),
(44, '2022-09-12', 5, 'finished');

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` double NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_id`, `product_id`, `product_name`, `product_price`, `quantity`) VALUES
(39, 1, 'Kapi gloga', 500, 1),
(39, 3, 'Kapi hajdučke trave', 700, 2),
(42, 1, 'Kapi gloga', 500, 3),
(43, 1, 'Kapi gloga', 500, 3),
(43, 3, 'Kapi hajdučke trave', 700, 3),
(44, 2, 'Kapi bele imele', 400, 2),
(44, 1, 'Kapi gloga', 500, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'nopicture.webp',
  `net_weight` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `category` enum('tinkture','kreme') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `description`, `image`, `net_weight`, `price`, `category`) VALUES
(1, 'Kapi gloga', 'Podržavaju normalnu srčanu aktivnost, povoljno utiču na dotok kiseonika i cirkulaciju krvi, doprinose smanjenju napetosti i nemira i olakšavaju nastupanje sna.', 'kapi glog.webp', '50 ml', 500, 'tinkture'),
(2, 'Kapi bele imele', 'Aktivni sastojci bele imele povoljno deluju na cirkulaciju i regulisanje krvnog pritiska, a pokazuju i citotoksični efekat. Takođe, u narodnoj medicini, upotreba KAPI BELE IMELE preporučuje se i kod krvarenja, u slučaju povišenog nivoa šećera u krvi i kod reumatskih bolesti.', 'noimage.webp', '30 ml', 400, 'tinkture'),
(3, 'Kapi hajdučke trave', 'Aktivni sastojci hajdučke trave povoljno deluju na organe za varenje, pa se upotreba preporučuje za poboljšanje apetita, eliminisanje gasova, regulisanje lučenja žuči i kod bolova i grčeva u stomaku. Takođe, u narodnoj medicini, preparati hajdučke trave preporučuju se kod „ženskih bolesti“, kod amenoreje ili u slučaju neredovnih ili obilnih menstruacija za normalizovanje mesečnog ciklusa.', 'noimage.webp', '30 ml', 700, 'tinkture');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` enum('customer','operator','manager','') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `username`, `password`, `email`, `phone`, `address`, `user_type`) VALUES
(1, 'Marko', 'Bubanja', 'mBubanja', 'b9296cb68e835014aa22d73f2e3f6665a7ac48a0984879cd28f43bc69714529b', 'bubanjamarko@gmail.com', '0644556469', 'Jurija Gagarina', 'manager'),
(2, 'Petar', 'Petrovic', 'pPetrovic', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'petar.petrovic@gmail.com', '0644556469', 'Ulica br, Grad', 'operator'),
(3, 'Radunka', 'Milenkovic', 'rMilenkovic', 'ff5a972ba33179c7ec67c73e00a362b629c489f9d7c86489644db2bcd8c62c61', 'radunka.milenkovic@gmail.com', '0644556469', 'Ulica br, Cuprija', 'customer'),
(5, 'Mitar', 'Miric', 'mMiric', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'mitarmiric@gmail.com', '06333333', 'UlicaBrojGrad', 'customer'),
(6, 'Ivan', 'Ilic', 'iIlic', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'iilic@gmail.com', '06555555', 'UlicaBrojGrad', 'customer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD KEY `fk_order` (`order_id`),
  ADD KEY `fk_product` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `fk_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
