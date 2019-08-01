-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-08-2019 a las 02:36:52
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sealboxdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_app_config`
--

DROP TABLE IF EXISTS `ospos_app_config`;
CREATE TABLE `ospos_app_config` (
  `key` varchar(50) NOT NULL,
  `value` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_app_config`
--

INSERT INTO `ospos_app_config` (`key`, `value`) VALUES
('address', 'CC Buenaventura, Local E9, Araure Edo. Portuguesa, VE'),
('allow_duplicate_barcodes', '0'),
('barcode_content', 'number'),
('barcode_first_row', 'name'),
('barcode_font', '0'),
('barcode_font_size', '10'),
('barcode_formats', 'null'),
('barcode_generate_if_empty', '1'),
('barcode_height', '50'),
('barcode_num_in_row', '2'),
('barcode_page_cellspacing', '20'),
('barcode_page_width', '100'),
('barcode_second_row', 'item_code'),
('barcode_third_row', 'unit_price'),
('barcode_type', 'Ean13'),
('barcode_width', '250'),
('cash_decimals', '2'),
('cash_rounding_code', '1'),
('company', 'SEAL BOX 316 C.A'),
('company_logo', ''),
('country_codes', 've'),
('currency_code', 'VEF'),
('currency_decimals', '2'),
('currency_symbol', 'Bs.'),
('currency_to_convert', ''),
('customer_reward_enable', '0'),
('dateformat', 'd/m/Y'),
('date_or_time_format', ''),
('default_receivings_discount', '0'),
('default_receivings_discount_type', '0'),
('default_register_mode', 'sale'),
('default_sales_discount', '0'),
('default_sales_discount_type', '0'),
('default_tax_1_name', 'IVA 16%'),
('default_tax_1_rate', '16'),
('default_tax_2_name', ''),
('default_tax_2_rate', ''),
('default_tax_category', ''),
('default_tax_code', ''),
('default_tax_jurisdiction', ''),
('default_tax_rate', '8'),
('derive_sale_quantity', '0'),
('dinner_table_enable', '0'),
('email', 'SEALBOX316C.A@GMAIL.COM'),
('email_receipt_check_behaviour', 'last'),
('enforce_privacy', ''),
('fax', ''),
('financial_year', '1'),
('fiscal_invoice_enable', '1'),
('gcaptcha_enable', '0'),
('gcaptcha_secret_key', ''),
('gcaptcha_site_key', ''),
('giftcard_number', 'series'),
('include_hsn', '0'),
('invoice_default_comments', 'This is a default comment'),
('invoice_email_message', 'Dear {CU}, In attachment the receipt for sale {ISEQ}'),
('invoice_enable', '1'),
('invoice_type', 'custom_invoice'),
('language', 'spanish'),
('language_code', 'es'),
('last_used_invoice_number', '0'),
('last_used_quote_number', '0'),
('last_used_work_order_number', '0'),
('lines_per_page', '25'),
('line_sequence', '0'),
('mailpath', '/usr/sbin/sendmail'),
('mandatory_password', '0'),
('msg_msg', ''),
('msg_pwd', ''),
('msg_src', ''),
('msg_uid', ''),
('multi_pack_enabled', '0'),
('notify_horizontal_position', 'center'),
('notify_vertical_position', 'bottom'),
('number_locale', 'es_VE'),
('password_discipline', '636563'),
('payment_options_order', 'cashdebitcredit'),
('phone', '04120505065'),
('print_bottom_margin', '0'),
('print_delay_autoreturn', '0'),
('print_footer', '0'),
('print_header', '0'),
('print_left_margin', '0'),
('print_receipt_check_behaviour', 'last'),
('print_right_margin', '0'),
('print_silently', '1'),
('print_top_margin', '0'),
('protocol', 'mail'),
('quantity_decimals', '0'),
('quote_default_comments', 'This is a default quote comment'),
('receipt_font_size', '12'),
('receipt_show_company_name', '1'),
('receipt_show_description', '1'),
('receipt_show_serialnumber', '1'),
('receipt_show_taxes', '0'),
('receipt_show_total_discount', '1'),
('receipt_template', 'receipt_default'),
('receiving_calculate_average_price', '0'),
('recv_invoice_format', '{CO}'),
('remote_fiscal_printer_serial', 'ZZH0003887'),
('remote_ip_address', '192.168.0.118'),
('remote_port_service', '8090'),
('return_policy', 'Test'),
('sales_invoice_format', '{CO}'),
('sales_quote_format', 'Q%y{QSEQ:6}'),
('smtp_crypto', 'ssl'),
('smtp_host', ''),
('smtp_pass', ''),
('smtp_port', '465'),
('smtp_timeout', '5'),
('smtp_user', ''),
('suggestions_first_column', 'name'),
('suggestions_second_column', 'item_number'),
('suggestions_third_column', 'unit_price'),
('tax_decimals', '2'),
('tax_id', ''),
('tax_included', '1'),
('theme', 'flatly'),
('thousands_separator', 'thousands_separator'),
('timeformat', 'h:i:s A'),
('timezone', 'America/Caracas'),
('use_destination_based_tax', '0'),
('use_price_conversion', ''),
('website', ''),
('work_order_enable', '0'),
('work_order_format', 'W%y{WSEQ:6}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_attribute_definitions`
--

DROP TABLE IF EXISTS `ospos_attribute_definitions`;
CREATE TABLE `ospos_attribute_definitions` (
  `definition_id` int(10) NOT NULL,
  `definition_name` varchar(255) NOT NULL,
  `definition_type` varchar(45) NOT NULL,
  `definition_unit` varchar(16) DEFAULT NULL,
  `definition_flags` tinyint(4) NOT NULL,
  `definition_fk` int(10) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_attribute_definitions`
--

INSERT INTO `ospos_attribute_definitions` (`definition_id`, `definition_name`, `definition_type`, `definition_unit`, `definition_flags`, `definition_fk`, `deleted`) VALUES
(1, 'Color', 'TEXT', NULL, 7, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_attribute_links`
--

DROP TABLE IF EXISTS `ospos_attribute_links`;
CREATE TABLE `ospos_attribute_links` (
  `attribute_id` int(11) DEFAULT NULL,
  `definition_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `receiving_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_attribute_links`
--

INSERT INTO `ospos_attribute_links` (`attribute_id`, `definition_id`, `item_id`, `sale_id`, `receiving_id`) VALUES
(1, 1, 4, NULL, NULL),
(1, 1, 4, 10, NULL),
(1, 1, 8, NULL, NULL),
(1, 1, 9, NULL, NULL),
(1, 1, 9, 12, NULL),
(1, 1, 46, NULL, NULL),
(1, 1, 49, NULL, NULL),
(1, 1, 52, NULL, NULL),
(1, 1, 56, NULL, NULL),
(1, 1, 57, NULL, NULL),
(1, 1, 64, NULL, NULL),
(1, 1, 69, NULL, NULL),
(1, 1, 70, NULL, NULL),
(1, 1, 76, NULL, NULL),
(2, 1, 10, NULL, NULL),
(2, 1, 13, NULL, NULL),
(2, 1, 40, NULL, NULL),
(3, 1, 11, NULL, NULL),
(3, 1, 11, 11, NULL),
(3, 1, 32, NULL, NULL),
(3, 1, 34, NULL, NULL),
(3, 1, 37, NULL, NULL),
(3, 1, 41, NULL, NULL),
(3, 1, 42, NULL, NULL),
(3, 1, 53, NULL, NULL),
(3, 1, 66, NULL, NULL),
(3, 1, 67, NULL, NULL),
(3, 1, 68, NULL, NULL),
(3, 1, 71, NULL, NULL),
(3, 1, 72, NULL, NULL),
(4, 1, 12, NULL, NULL),
(4, 1, 31, NULL, NULL),
(4, 1, 39, NULL, NULL),
(4, 1, 43, NULL, NULL),
(4, 1, 43, 14, NULL),
(4, 1, 44, NULL, NULL),
(4, 1, 48, NULL, NULL),
(4, 1, 51, NULL, NULL),
(4, 1, 54, NULL, NULL),
(4, 1, 59, NULL, NULL),
(5, 1, 14, NULL, NULL),
(5, 1, 15, NULL, NULL),
(5, 1, 16, NULL, NULL),
(5, 1, 17, NULL, NULL),
(5, 1, 18, NULL, NULL),
(5, 1, 19, NULL, NULL),
(5, 1, 20, NULL, NULL),
(6, 1, 21, NULL, NULL),
(6, 1, 30, NULL, NULL),
(6, 1, 33, NULL, NULL),
(6, 1, 36, NULL, NULL),
(6, 1, 47, NULL, NULL),
(6, 1, 50, NULL, NULL),
(6, 1, 55, NULL, NULL),
(6, 1, 58, NULL, NULL),
(6, 1, 60, NULL, NULL),
(6, 1, 65, NULL, NULL),
(7, 1, 22, NULL, NULL),
(7, 1, 35, NULL, NULL),
(8, 1, 23, NULL, NULL),
(9, 1, 24, NULL, NULL),
(10, 1, 25, NULL, NULL),
(10, 1, 29, NULL, NULL),
(11, 1, 26, NULL, NULL),
(11, 1, 27, NULL, NULL),
(11, 1, 28, NULL, NULL),
(12, 1, 38, NULL, NULL),
(13, 1, 45, NULL, NULL),
(14, 1, 73, NULL, NULL),
(15, 1, 74, NULL, NULL),
(16, 1, 75, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_attribute_values`
--

DROP TABLE IF EXISTS `ospos_attribute_values`;
CREATE TABLE `ospos_attribute_values` (
  `attribute_id` int(11) NOT NULL,
  `attribute_value` varchar(255) DEFAULT NULL,
  `attribute_date` date DEFAULT NULL,
  `attribute_decimal` decimal(7,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_attribute_values`
--

INSERT INTO `ospos_attribute_values` (`attribute_id`, `attribute_value`, `attribute_date`, `attribute_decimal`) VALUES
(1, 'Verde', NULL, NULL),
(2, 'ROSADO', NULL, NULL),
(3, 'MORADO', NULL, NULL),
(4, 'NEGRO', NULL, NULL),
(5, '', NULL, NULL),
(6, 'AZUL', NULL, NULL),
(7, 'BLANCO', NULL, NULL),
(8, 'ROJO', NULL, NULL),
(9, 'NARANJA', NULL, NULL),
(10, 'ROSADA', NULL, NULL),
(11, 'MORADA', NULL, NULL),
(12, 'NEGRO +', NULL, NULL),
(13, 'NEGRO CON BLANCO', NULL, NULL),
(14, 'FUCSIA', NULL, NULL),
(15, 'VINOTINTO', NULL, NULL),
(16, 'AZUL METÁLICO', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_cash_up`
--

DROP TABLE IF EXISTS `ospos_cash_up`;
CREATE TABLE `ospos_cash_up` (
  `cashup_id` int(10) NOT NULL,
  `open_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `close_date` timestamp NULL DEFAULT NULL,
  `open_amount_cash` decimal(15,2) NOT NULL,
  `transfer_amount_cash` decimal(15,2) NOT NULL,
  `note` int(1) NOT NULL,
  `closed_amount_cash` decimal(15,2) NOT NULL,
  `closed_amount_card` decimal(15,2) NOT NULL,
  `closed_amount_check` decimal(15,2) NOT NULL,
  `closed_amount_total` decimal(15,2) NOT NULL,
  `description` varchar(255) NOT NULL,
  `open_employee_id` int(10) NOT NULL,
  `close_employee_id` int(10) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `closed_amount_due` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_customers`
--

DROP TABLE IF EXISTS `ospos_customers`;
CREATE TABLE `ospos_customers` (
  `person_id` int(10) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `taxable` int(1) NOT NULL DEFAULT '1',
  `tax_id` varchar(32) NOT NULL DEFAULT '',
  `sales_tax_code_id` int(11) DEFAULT NULL,
  `discount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `discount_type` tinyint(2) NOT NULL DEFAULT '0',
  `package_id` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `employee_id` int(10) NOT NULL,
  `consent` int(1) NOT NULL DEFAULT '0',
  `pic_filename` varchar(255) DEFAULT NULL,
  `customer_number` varchar(255) DEFAULT NULL,
  `service_duedate` date DEFAULT NULL,
  `is_exhonerated` tinyint(1) DEFAULT '0',
  `discipline_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_customers`
--

INSERT INTO `ospos_customers` (`person_id`, `company_name`, `account_number`, `taxable`, `tax_id`, `sales_tax_code_id`, `discount`, `discount_type`, `package_id`, `points`, `deleted`, `date`, `employee_id`, `consent`, `pic_filename`, `customer_number`, `service_duedate`, `is_exhonerated`, `discipline_id`) VALUES
(2, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-31 17:17:43', 5, 1, 'WIN_20190702_11_16_54_Pro.jpg', NULL, '2019-08-05', 0, 1),
(3, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-02 18:54:30', 1, 1, NULL, '2003000000009', NULL, 0, NULL),
(4, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-02 19:00:28', 1, 1, NULL, NULL, NULL, 0, NULL),
(6, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-02 19:23:48', 5, 1, NULL, NULL, NULL, 0, NULL),
(7, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-02 19:25:34', 5, 1, NULL, NULL, NULL, 0, NULL),
(8, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-02 19:28:07', 5, 1, NULL, '9843714', NULL, 0, NULL),
(9, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-11 15:56:55', 1, 1, NULL, '2009000000001', '2019-08-03', 0, 2),
(10, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-11 16:15:41', 1, 1, NULL, '2001000000005', '2019-07-31', 0, 85),
(13, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-12 15:22:08', 11, 1, NULL, '28005600', '2019-08-28', 0, 1),
(14, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-12 15:33:57', 5, 1, NULL, 'CLUB FERGYM', NULL, 0, NULL),
(15, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-12 20:29:26', 11, 1, NULL, '26674698', NULL, 0, NULL),
(16, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-12 20:37:25', 11, 1, NULL, 'CLUB ROSELOZ', NULL, 0, 61),
(17, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-12 21:02:55', 11, 1, NULL, '25791386', '2019-08-07', 0, 1),
(18, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-12 21:05:57', 11, 1, NULL, '27132160', '2019-08-03', 0, 62),
(19, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-12 21:08:26', 11, 1, NULL, '10144702', NULL, 0, NULL),
(20, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-12 21:11:21', 11, 1, NULL, '17002682', '2019-08-01', 0, 1),
(21, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-12 21:12:19', 11, 1, NULL, '21059508', '2019-08-04', 0, 1),
(22, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-12 21:14:34', 11, 1, NULL, '33084483', '2019-08-02', 0, 63),
(23, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-12 21:14:58', 11, 1, NULL, '33084483', NULL, 0, NULL),
(24, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-12 21:15:41', 11, 1, NULL, '25761550', '2019-08-03', 0, 2),
(25, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 1, '2019-07-12 21:16:05', 11, 1, NULL, '29629606', '2019-08-03', 0, 1),
(26, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-12 21:16:28', 11, 1, NULL, '14271761', NULL, 0, NULL),
(27, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-12 21:17:02', 11, 1, NULL, '32042636', '2019-08-09', 0, 63),
(28, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 1, '2019-07-12 21:17:37', 11, 1, NULL, '31914710', '2019-08-26', 0, 1),
(29, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-12 21:17:37', 11, 1, NULL, '31914710', '2019-08-26', 0, 2),
(30, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 1, '2019-07-12 21:17:37', 11, 1, NULL, '31914710', NULL, 0, NULL),
(31, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 1, '2019-07-12 21:17:37', 11, 1, NULL, '31914710', NULL, 0, NULL),
(32, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 1, '2019-07-12 21:18:47', 11, 1, NULL, '31914710', NULL, 0, NULL),
(33, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-12 21:19:33', 11, 1, NULL, '24145669', '2019-08-07', 0, 1),
(34, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-12 21:25:41', 11, 1, NULL, 'CLUB ROSELOZ', NULL, 0, NULL),
(35, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-15 17:36:53', 11, 1, NULL, '10142853', '2019-08-06', 0, 62),
(36, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-15 17:39:04', 11, 1, NULL, 'CLUB FERGYIN', NULL, 0, NULL),
(37, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-15 17:52:42', 11, 1, NULL, '25422413', NULL, 0, NULL),
(38, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-15 17:53:36', 11, 1, NULL, '26442218', '2019-08-08', 0, 2),
(39, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-15 17:54:07', 11, 1, NULL, '25163388', '2019-08-09', 0, 1),
(40, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-15 17:54:40', 11, 1, NULL, '22096982', '2019-07-09', 0, 1),
(41, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-15 17:55:12', 11, 1, NULL, '22106153', '2019-08-15', 0, 1),
(42, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-15 17:55:42', 11, 1, NULL, '24145980', '2019-08-26', 0, 2),
(43, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-15 17:56:15', 11, 1, NULL, '1779637', '2019-08-17', 0, 2),
(44, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-15 17:58:57', 11, 1, NULL, '19170078', '2019-08-17', 0, 2),
(45, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-15 18:00:59', 11, 1, NULL, '27215951', '2019-08-01', 0, 1),
(46, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-15 18:08:12', 11, 1, NULL, '20272159', '2019-08-21', 0, 61),
(47, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-15 18:10:56', 11, 1, NULL, 'CLUB ROSELOZ', '2019-08-09', 0, 61),
(48, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-15 18:11:58', 11, 1, NULL, 'CLUB ROSELOZ', NULL, 0, NULL),
(49, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-15 18:14:25', 11, 1, NULL, 'CLUB ROSELOZ', NULL, 0, NULL),
(50, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-15 18:15:31', 11, 1, NULL, '24587013', '2019-08-07', 0, 62),
(51, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-15 18:30:02', 11, 1, NULL, '28156469', '2019-08-28', 0, 62),
(52, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-15 18:32:38', 11, 1, NULL, '41610567', NULL, 0, NULL),
(53, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-15 18:49:50', 11, 1, NULL, '15237954', '2019-08-21', 0, 61),
(54, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-15 19:40:01', 11, 1, NULL, '26903110', '2019-08-17', 0, 2),
(55, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-15 19:45:37', 11, 1, NULL, '30323439', '2019-08-09', 0, 2),
(56, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-15 19:47:02', 11, 1, NULL, '12446582', '2019-08-07', 0, 61),
(57, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-15 19:49:04', 11, 1, NULL, '21393317', NULL, 0, NULL),
(58, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 10:48:21', 12, 1, NULL, '4603723', '2019-08-14', 0, 62),
(59, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 10:48:59', 12, 1, NULL, '20039664', NULL, 0, NULL),
(60, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 10:50:25', 12, 1, NULL, '26379622', '2019-08-22', 0, 62),
(61, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 10:51:11', 12, 1, NULL, '24146127', '2019-08-22', 0, 62),
(62, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 10:52:33', 12, 1, NULL, '18103991', '2019-08-26', 0, 62),
(63, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 10:53:14', 12, 1, NULL, '18977146', '2019-08-07', 0, 1),
(64, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 10:54:44', 12, 1, NULL, '12494082', '2019-08-07', 0, 1),
(65, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 10:57:02', 12, 1, NULL, '27054297', '2019-08-05', 0, 2),
(66, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 10:57:30', 12, 1, NULL, '17600105', NULL, 0, NULL),
(67, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 10:58:25', 12, 1, NULL, '16871487', '2019-08-18', 0, 1),
(68, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-31 15:37:38', 12, 1, NULL, '16565879', '2019-08-07', 0, 1),
(69, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 11:00:33', 12, 1, NULL, '20643077', '2019-08-01', 0, 2),
(70, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 11:02:08', 12, 1, NULL, '19727839', '2019-08-01', 0, 2),
(71, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 11:03:06', 12, 1, NULL, '16192826', NULL, 0, NULL),
(72, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 11:04:55', 12, 1, NULL, '11460500', '2019-08-18', 0, 1),
(73, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 11:05:47', 12, 1, NULL, '17797479', '2019-08-07', 0, 1),
(74, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 11:06:32', 12, 1, NULL, '19798880', '2019-08-11', 0, 2),
(75, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 11:07:53', 12, 1, NULL, '20543307', '2019-08-10', 0, 1),
(76, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 11:08:54', 12, 1, NULL, '15493143', '2019-08-09', 0, 62),
(77, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 11:10:21', 12, 1, NULL, '20390879', '2019-08-08', 0, 2),
(78, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 11:11:58', 12, 1, NULL, '28200350', '2019-08-06', 0, 2),
(79, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 11:12:50', 12, 1, NULL, '10636739', '2019-08-07', 0, 1),
(80, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 11:13:51', 12, 1, NULL, '15493354', '2019-08-15', 0, 1),
(81, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 11:19:24', 12, 1, NULL, '19714108', '2019-08-19', 0, 1),
(82, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 11:20:16', 12, 1, NULL, '13354095', '2019-08-16', 0, 1),
(83, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 11:21:02', 12, 1, NULL, '24145247', '2019-08-07', 0, 62),
(84, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 11:22:03', 12, 1, NULL, '16565665', '2019-08-10', 0, 2),
(85, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 11:23:43', 12, 1, NULL, '15867007', '2019-08-11', 0, 2),
(86, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 11:24:57', 12, 1, NULL, '27575996', '2019-08-01', 0, 2),
(87, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 11:25:47', 12, 1, NULL, '19172462', '2019-08-01', 0, 2),
(88, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 11:26:32', 12, 1, NULL, '18929785', '2019-08-22', 0, 2),
(89, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 14:58:21', 12, 1, NULL, '14887741', '2019-08-28', 0, 1),
(90, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 17:17:57', 11, 1, NULL, '27054297', '2019-08-05', 0, 2),
(91, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 17:42:10', 11, 1, NULL, '18288309', '2019-08-25', 0, 61),
(92, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 18:02:03', 11, 1, NULL, '14426958', NULL, 0, NULL),
(93, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-16 19:19:20', 11, 1, NULL, '30128108', '2019-08-17', 0, 1),
(94, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 11:45:04', 12, 1, NULL, '11432436', '2019-08-22', 0, 2),
(95, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 11:46:18', 12, 1, NULL, '15621292', '2019-08-02', 0, 2),
(96, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 12:00:22', 12, 1, NULL, '25606544', NULL, 0, NULL),
(97, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 12:01:14', 12, 1, NULL, '16126591', '2019-08-21', 0, 1),
(98, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 12:02:17', 12, 1, NULL, '14466548', '2019-08-08', 0, 62),
(99, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 12:02:56', 12, 1, NULL, '16566443', '2019-08-19', 0, 1),
(100, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 12:03:38', 12, 1, NULL, '15298028', '2019-08-02', 0, 1),
(101, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 12:04:23', 12, 1, NULL, '17003681', '2019-08-07', 0, 1),
(102, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 12:05:02', 12, 1, NULL, '13486266', '2019-08-06', 0, 1),
(103, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 12:06:26', 12, 1, NULL, '14425051', '2019-08-07', 0, 1),
(104, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 13:12:19', 12, 1, NULL, '14676572', '2019-08-17', 0, 2),
(105, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 13:14:08', 12, 1, NULL, '13584645', '2019-08-07', 0, 1),
(106, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 13:15:23', 12, 1, NULL, '24684281', '2019-08-03', 0, 2),
(107, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 13:52:41', 12, 1, NULL, '26442721', NULL, 0, NULL),
(108, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 15:29:23', 12, 1, NULL, '27419713', NULL, 0, NULL),
(109, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 15:30:35', 12, 1, NULL, '31541065', '2019-08-01', 0, 62),
(110, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 15:32:07', 12, 1, NULL, '22101002', NULL, 0, NULL),
(111, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 15:32:55', 12, 1, NULL, '24587814', NULL, 0, NULL),
(112, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 1, '2019-07-17 16:51:43', 11, 1, NULL, '22101002', NULL, 0, NULL),
(113, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 16:52:08', 11, 1, NULL, '24587814', NULL, 0, NULL),
(114, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 16:53:34', 11, 1, NULL, '15298028', '2019-08-02', 0, 1),
(115, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 16:55:06', 11, 1, NULL, '25606544', NULL, 0, NULL),
(116, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 17:43:20', 11, 1, NULL, '20389249', '2019-08-26', 0, 62),
(117, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 17:44:36', 11, 1, NULL, '15493143', '2019-08-09', 0, 62),
(118, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 18:14:36', 11, 1, NULL, '17599973', '2019-08-07', 0, 1),
(119, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 18:31:18', 11, 1, NULL, '26972620', '2019-08-18', 0, 62),
(120, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 18:33:05', 11, 1, NULL, 'CLUB FERGYN', NULL, 0, NULL),
(121, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 18:52:19', 11, 1, NULL, '19790179', '2019-08-09', 0, 63),
(122, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 19:07:14', 11, 1, NULL, '25761550', '2019-08-03', 0, 2),
(123, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 19:11:18', 11, 1, NULL, '16956844', '2019-08-19', 0, 61),
(124, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 19:13:11', 11, 1, NULL, '16965844', '2019-08-03', 0, 1),
(125, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 19:15:52', 11, 1, NULL, '16965844', '2019-08-18', 0, 63),
(126, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 19:28:20', 11, 1, NULL, '32042325', NULL, 0, NULL),
(127, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 19:45:07', 11, 1, NULL, '30208511', NULL, 0, NULL),
(128, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 20:12:19', 11, 1, NULL, '16566443', '2019-08-12', 0, 61),
(129, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 20:19:31', 11, 1, NULL, '31757731', '2019-08-17', 0, 63),
(130, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 20:20:44', 11, 1, NULL, '32735501', '2019-08-17', 0, 63),
(131, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 20:23:13', 11, 1, NULL, '28258819', '2019-08-18', 0, 1),
(132, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 20:52:40', 11, 1, NULL, '26759710', '2019-08-07', 0, 1),
(133, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 20:56:02', 11, 1, NULL, '31165042', NULL, 0, NULL),
(134, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 20:58:31', 11, 1, NULL, '17278101', '2019-08-07', 0, 1),
(135, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 20:59:16', 11, 1, NULL, '30133121', NULL, 0, NULL),
(136, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 21:19:02', 11, 1, NULL, '22106154', '2019-08-29', 0, 2),
(137, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 21:22:01', 11, 1, NULL, '14425410', '2019-08-24', 0, 2),
(138, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 21:23:32', 11, 1, NULL, '22098719', '2019-08-15', 0, 1),
(139, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 21:26:19', 11, 1, NULL, 'CLUB FERYGIN', NULL, 0, NULL),
(140, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 21:30:33', 11, 1, NULL, '30822510', '2019-08-03', 0, 2),
(141, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 21:33:13', 11, 1, NULL, '16965844', '2019-08-03', 0, 2),
(142, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 21:34:37', 11, 1, NULL, '29800400', '2019-08-15', 0, 1),
(143, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 21:36:12', 11, 1, NULL, '18871058', '2019-08-03', 0, 62),
(144, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 21:49:00', 11, 1, NULL, '25791840', '2019-08-13', 0, 1),
(145, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 21:50:00', 11, 1, NULL, '17362260', '2019-08-04', 0, 2),
(146, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 21:52:05', 11, 1, NULL, '18332502', NULL, 0, NULL),
(147, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 21:53:17', 11, 1, NULL, '16751951', '2019-08-10', 0, 61),
(148, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 22:27:18', 11, 1, NULL, '30766772', '2019-08-09', 0, 2),
(149, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 22:28:02', 11, 1, NULL, '24587842', '2020-03-07', 0, 1),
(150, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 22:29:18', 11, 1, NULL, '13555086', '2019-08-15', 0, 2),
(151, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 22:29:55', 11, 1, NULL, '29847107', '2019-08-22', 0, 1),
(152, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 22:30:41', 11, 1, NULL, '29889721', NULL, 0, NULL),
(153, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 22:32:04', 11, 1, NULL, '21561902', '2019-08-15', 0, 62),
(154, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 22:33:07', 11, 1, NULL, '17944896', '2019-08-03', 0, 2),
(155, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 22:34:00', 11, 1, NULL, '20271564', '2019-08-08', 0, 2),
(156, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 22:34:49', 11, 1, NULL, '12859606', '2019-08-18', 0, 1),
(157, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 22:35:34', 11, 1, NULL, '28004653', NULL, 0, NULL),
(158, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 22:36:05', 11, 1, NULL, '17303575', '2019-08-19', 0, 1),
(159, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 22:36:47', 11, 1, NULL, '17303576', '2019-08-19', 0, 1),
(160, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 23:43:18', 11, 1, NULL, '16292714', '2019-08-07', 0, 2),
(161, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 23:43:54', 11, 1, NULL, '15413694', '2019-08-15', 0, 1),
(162, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 23:44:21', 11, 1, NULL, '15690491', NULL, 0, NULL),
(163, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 23:44:55', 11, 1, NULL, '26167404', '2019-08-04', 0, 1),
(164, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 23:45:28', 11, 1, NULL, '26301438', '2019-08-06', 0, 1),
(165, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 23:45:58', 11, 1, NULL, '13352463', '2019-08-03', 0, 1),
(166, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 23:46:42', 11, 1, NULL, '31057627', '2019-08-20', 0, 1),
(167, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 23:47:21', 11, 1, NULL, '20025279', '2019-08-07', 0, 62),
(168, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 23:48:10', 11, 1, NULL, '21393067', '2019-08-17', 0, 2),
(169, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 23:48:51', 11, 1, NULL, '13485249', '2019-08-03', 0, 1),
(170, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 23:53:19', 11, 1, NULL, '29968910', '2019-08-27', 0, 2),
(171, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 23:56:03', 11, 1, NULL, '27546419', '2019-08-13', 0, 2),
(172, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 23:57:20', 11, 1, NULL, '30637762', '2019-08-16', 0, 1),
(173, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 23:58:12', 11, 1, NULL, '21560440', '2019-08-15', 0, 2),
(174, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 23:58:44', 11, 1, NULL, '23577452', '2019-08-15', 0, 2),
(175, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 23:59:13', 11, 1, NULL, '12090389', '2019-08-13', 0, 2),
(176, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-17 23:59:47', 11, 1, NULL, '17364524', NULL, 0, NULL),
(177, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-18 00:00:25', 11, 1, NULL, '11544390', '2019-08-17', 0, 2),
(178, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-18 14:19:41', 12, 1, NULL, '14964538', '2019-08-17', 0, 62),
(179, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-18 14:20:43', 12, 1, NULL, '6184692', '2019-08-26', 0, 62),
(180, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-18 14:21:49', 12, 1, NULL, '8657167', '2019-08-26', 0, 62),
(181, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-18 16:30:57', 11, 1, NULL, '13226124', NULL, 0, NULL),
(182, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-18 16:32:29', 11, 1, NULL, '32651520', NULL, 0, NULL),
(183, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-18 21:25:21', 11, 1, NULL, '28478287', NULL, 0, NULL),
(184, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-19 20:18:55', 11, 1, NULL, '28478508', '2019-08-24', 0, 1),
(185, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-19 22:11:12', 11, 1, NULL, 'CLUB ROSELOZ', NULL, 0, NULL),
(186, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-19 22:20:54', 11, 1, NULL, '32273632', '2019-08-15', 0, 2),
(187, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-19 22:21:44', 11, 1, NULL, '11084116', '2019-08-01', 0, 1),
(188, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-19 22:22:42', 11, 1, NULL, '12526306', '2019-08-15', 0, 2),
(189, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-22 11:48:27', 12, 1, NULL, '26572339', '2019-08-22', 0, 2),
(190, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-22 11:49:57', 12, 1, NULL, '26836520', '2019-08-22', 0, 2),
(191, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-22 12:23:08', 12, 1, NULL, '25508606', '2019-08-22', 0, 2),
(192, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-22 13:09:32', 12, 1, NULL, '9835655', '2019-08-22', 0, 2),
(193, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-22 14:31:51', 12, 1, NULL, '27814322', '2019-08-22', 0, 2),
(194, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-22 14:32:37', 12, 1, NULL, '19053814', '2019-08-22', 0, 2),
(195, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-22 18:43:21', 11, 1, NULL, '32652069', '2019-08-22', 0, 2),
(196, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-22 19:01:31', 11, 1, NULL, '255085975', '2019-08-22', 0, 2),
(197, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-22 19:14:12', 11, 1, NULL, '32103873', '2019-08-22', 0, 2),
(198, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-23 19:41:35', 11, 1, NULL, '32218950', '2019-08-23', 0, 2),
(199, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-23 21:04:38', 11, 1, NULL, '29540728', '2019-08-23', 0, 2),
(200, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-23 23:57:22', 12, 1, NULL, '16862124', NULL, 0, NULL),
(201, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-23 23:58:00', 12, 1, NULL, '26836010', '2019-08-23', 0, 1),
(202, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-23 23:59:12', 12, 1, NULL, '31758350', '2010-01-23', 0, 1),
(203, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-23 23:59:37', 12, 1, NULL, '26504816', '2019-08-23', 0, 1),
(204, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-24 20:09:23', 11, 1, NULL, '16899854', '2019-08-10', 0, 61),
(205, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-24 20:12:08', 11, 1, NULL, '16899854', '2019-08-10', 0, 61),
(206, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-25 23:38:28', 11, 1, NULL, '27575164', '2019-08-22', 0, 1),
(207, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-29 14:31:15', 12, 1, NULL, '26273264', NULL, 0, NULL),
(208, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-29 14:33:38', 12, 1, NULL, '15070153', '2019-08-29', 0, 62),
(209, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-29 20:16:56', 11, 1, NULL, '15929283', '2019-08-25', 0, 2),
(210, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-29 21:25:45', 11, 1, NULL, '24026513', '2010-08-29', 0, 2),
(211, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-29 21:57:08', 11, 1, NULL, '23479809', '2019-08-29', 0, 1),
(212, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-29 21:58:04', 11, 1, NULL, '24320101', '2019-08-29', 0, 1),
(213, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-29 23:01:16', 11, 1, NULL, '18929330', '2019-08-29', 0, 2),
(214, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 11:59:24', 12, 1, NULL, '12527184', '2019-08-01', 0, 1),
(215, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 12:01:10', 12, 1, NULL, '16739893', '2019-08-07', 0, 2),
(216, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 12:08:28', 12, 1, NULL, '24020853', '2019-08-29', 0, 2),
(217, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 15:10:31', 12, 1, NULL, '16414521', '2019-08-01', 0, 61),
(218, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 15:15:02', 12, 1, NULL, '15690878', '2019-08-13', 0, 61),
(219, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 18:37:41', 11, 1, NULL, '30536921', '2019-08-08', 0, 62),
(220, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 18:48:25', 11, 1, NULL, '29775188', NULL, 0, NULL),
(221, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 18:53:28', 11, 1, NULL, '32103304', '2019-08-19', 0, 63),
(222, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 19:23:07', 11, 1, NULL, '32922579', '2019-08-02', 0, 63),
(223, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 20:28:54', 11, 1, NULL, '16643882', '2019-08-01', 0, 61),
(224, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 21:01:21', 11, 1, NULL, '16861639', '2019-08-15', 0, 1),
(225, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 21:11:12', 11, 1, NULL, '24020981', '2019-08-30', 0, 2),
(226, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 21:12:13', 11, 1, NULL, '22096864', NULL, 0, NULL),
(227, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 21:29:45', 11, 1, NULL, '30323696', '2019-08-10', 0, 2),
(228, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 21:31:09', 11, 1, NULL, '30966609', NULL, 0, NULL),
(229, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 21:31:39', 11, 1, NULL, '24683582', '2019-08-08', 0, 62),
(230, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 21:35:36', 11, 1, NULL, '32849937', NULL, 0, NULL),
(231, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 21:36:43', 11, 1, NULL, '25520787', NULL, 0, NULL),
(232, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 22:05:57', 11, 1, NULL, '24019905', NULL, 0, NULL),
(233, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 22:07:04', 11, 1, NULL, '14177694', '2019-08-21', 0, 2),
(234, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 22:07:54', 11, 1, NULL, '21394232', NULL, 0, NULL),
(235, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 22:09:09', 11, 1, NULL, '27898327', '2019-08-03', 0, 1),
(236, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 22:09:53', 11, 1, NULL, '23577226', '2019-08-22', 0, 2),
(237, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 22:12:04', 11, 1, NULL, '31710792', '2019-08-20', 0, 62),
(238, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 22:24:37', 11, 1, NULL, '16414986', '2019-08-20', 0, 62),
(239, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 22:25:03', 11, 1, NULL, '24813040', '2019-08-01', 0, 62),
(240, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 22:25:38', 11, 1, NULL, '2025279', NULL, 0, NULL),
(241, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 22:28:51', 11, 1, NULL, '20640935', '2019-08-10', 0, 62),
(242, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 22:29:37', 11, 1, NULL, '31427597', NULL, 0, NULL),
(243, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 22:30:28', 11, 1, NULL, '17945753', NULL, 0, NULL),
(244, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 22:31:29', 11, 1, NULL, '6866226', NULL, 0, NULL),
(245, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 22:53:26', 11, 1, NULL, '84495322', '2019-08-23', 0, 1),
(246, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 22:54:18', 11, 1, NULL, '16872624', '2019-08-09', 0, 62),
(247, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 23:06:23', 11, 1, NULL, '27132600', NULL, 0, NULL),
(248, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 23:08:10', 11, 1, NULL, '11082884', NULL, 0, NULL),
(249, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 23:14:48', 11, 1, NULL, '19171615', '2019-08-30', 0, 1),
(250, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 23:22:18', 11, 1, NULL, '32387050', '2019-08-22', 0, 2),
(251, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 23:23:12', 11, 1, NULL, '28106694', '2019-08-30', 0, 1),
(252, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 23:50:10', 11, 1, NULL, '21058776', '2019-08-15', 0, 2),
(253, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 23:50:49', 11, 1, NULL, '17277952', '2019-08-15', 0, 1),
(254, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 23:51:34', 11, 1, NULL, '17945910', '2019-08-15', 0, 1),
(255, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-30 23:52:28', 11, 1, NULL, '22104634', '2019-08-15', 0, 1),
(256, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-31 12:59:09', 12, 1, NULL, '17944240', '2019-08-31', 0, 2),
(257, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-31 13:12:18', 12, 1, NULL, '16292114', '2019-08-22', 0, 2),
(258, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-31 13:17:30', 12, 1, NULL, '16416892', '2019-08-29', 0, 1),
(259, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-31 14:29:15', 12, 1, NULL, '23033853', '2019-08-10', 0, 62),
(260, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-31 15:26:04', 12, 1, NULL, '16860266', '2010-08-29', 0, 62),
(261, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-31 15:29:59', 12, 1, NULL, '17795572', '2019-09-21', 0, 61),
(262, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-31 15:47:41', 12, 1, NULL, '32511829', NULL, 0, NULL),
(263, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-31 16:02:50', 12, 1, NULL, '9540097', '2019-08-23', 0, 63),
(264, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-31 16:03:53', 12, 1, NULL, '10136268', '2019-08-09', 0, 61),
(265, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-31 18:45:49', 11, 1, NULL, '31164454', '2019-08-07', 0, 63),
(266, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-31 18:50:18', 11, 1, NULL, '31164454-1', '2019-08-07', 0, 63),
(267, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-31 19:16:58', 11, 1, NULL, '31914753', '2019-08-07', 0, 63),
(268, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-31 20:37:25', 1, 1, NULL, '26856520', NULL, 0, NULL),
(269, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-31 20:39:11', 1, 1, NULL, '19172904', NULL, 0, NULL),
(270, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-31 20:52:48', 1, 1, NULL, '30236190', '2019-08-15', 0, 2),
(271, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-31 22:40:33', 11, 1, NULL, '13486232', '2019-07-31', 0, 2),
(272, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-31 23:03:42', 11, 1, NULL, '30177479', '2019-07-08', 0, 2),
(273, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-31 23:19:28', 11, 1, NULL, '106136315', NULL, 0, NULL),
(274, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-31 23:30:24', 11, 1, NULL, '1034314764', '2019-08-31', 0, 2),
(275, NULL, NULL, 1, '', NULL, '0.00', 0, NULL, NULL, 0, '2019-07-31 23:46:11', 5, 1, NULL, NULL, '2019-08-31', 0, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_customers_packages`
--

DROP TABLE IF EXISTS `ospos_customers_packages`;
CREATE TABLE `ospos_customers_packages` (
  `package_id` int(11) NOT NULL,
  `package_name` varchar(255) DEFAULT NULL,
  `points_percent` float NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_customers_packages`
--

INSERT INTO `ospos_customers_packages` (`package_id`, `package_name`, `points_percent`, `deleted`) VALUES
(1, 'Default', 0, 0),
(2, 'Bronze', 10, 0),
(3, 'Silver', 20, 0),
(4, 'Gold', 30, 0),
(5, 'Premium', 50, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_customers_points`
--

DROP TABLE IF EXISTS `ospos_customers_points`;
CREATE TABLE `ospos_customers_points` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `points_earned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_customer_access_control`
--

DROP TABLE IF EXISTS `ospos_customer_access_control`;
CREATE TABLE `ospos_customer_access_control` (
  `access_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `datein` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateout` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_customer_access_control`
--

INSERT INTO `ospos_customer_access_control` (`access_id`, `item_id`, `customer_id`, `datein`, `dateout`, `status`) VALUES
(1, 1, 2, '2019-07-02 15:11:33', '2019-07-02 19:04:58', 1),
(2, 2, 7, '2019-07-02 20:55:03', NULL, 1),
(3, 1, 2, '0000-00-00 00:00:00', NULL, 1),
(4, 1, 2, '0000-00-00 00:00:00', NULL, 1),
(5, 0, 16, '0000-00-00 00:00:00', NULL, 2),
(6, 0, 13, '0000-00-00 00:00:00', NULL, 1),
(7, 0, 13, '0000-00-00 00:00:00', NULL, 1),
(8, 0, 10, '0000-00-00 00:00:00', NULL, 0),
(9, 1, 2, '2019-07-31 20:35:27', NULL, 2),
(10, 2, 10, '2019-07-31 20:55:01', NULL, 1),
(11, 1, 13, '2019-07-31 21:06:08', NULL, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_dinner_tables`
--

DROP TABLE IF EXISTS `ospos_dinner_tables`;
CREATE TABLE `ospos_dinner_tables` (
  `dinner_table_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_dinner_tables`
--

INSERT INTO `ospos_dinner_tables` (`dinner_table_id`, `name`, `status`, `deleted`) VALUES
(1, 'Delivery', 0, 0),
(2, 'Take Away', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_employees`
--

DROP TABLE IF EXISTS `ospos_employees`;
CREATE TABLE `ospos_employees` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `hash_version` int(1) NOT NULL DEFAULT '2',
  `language` varchar(48) DEFAULT NULL,
  `language_code` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_employees`
--

INSERT INTO `ospos_employees` (`username`, `password`, `person_id`, `deleted`, `hash_version`, `language`, `language_code`) VALUES
('admin', '$2y$10$FbLS9ebsHN/QsousyvqwE.ii8ElA/DsHJXKxlkOPeSFYzIY1e4/tO', 1, 0, 2, 'spanish', 'es'),
('cGoyo', '$2y$10$GfW0ieV/VAPJdxPzqf3vEunNl2UU9dKuqHIoGilHxHIC4GrDemjCO', 11, 0, 2, '', ''),
('mAlvarado', '$2y$10$3Pddf0N1.QzDg64svr5e2OQIcUcnfmbDo3hZxO/JRVTJ9CVgWMrO6', 12, 0, 2, '', ''),
('yGutierrez', '$2y$10$mRVJkPbHOIt7ZQVP9v9VvuEjvbtT/BoQNB/m/M86wgOaqRUQtkAcu', 5, 0, 2, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_expenses`
--

DROP TABLE IF EXISTS `ospos_expenses`;
CREATE TABLE `ospos_expenses` (
  `expense_id` int(10) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` decimal(15,2) NOT NULL,
  `payment_type` varchar(40) NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `employee_id` int(10) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `supplier_tax_code` varchar(255) DEFAULT NULL,
  `tax_amount` decimal(15,2) DEFAULT NULL,
  `supplier_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_expense_categories`
--

DROP TABLE IF EXISTS `ospos_expense_categories`;
CREATE TABLE `ospos_expense_categories` (
  `expense_category_id` int(10) NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `category_description` varchar(255) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_giftcards`
--

DROP TABLE IF EXISTS `ospos_giftcards`;
CREATE TABLE `ospos_giftcards` (
  `record_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `giftcard_id` int(11) NOT NULL,
  `giftcard_number` varchar(255) DEFAULT NULL,
  `value` decimal(15,2) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `person_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_giftcards`
--

INSERT INTO `ospos_giftcards` (`record_time`, `giftcard_id`, `giftcard_number`, `value`, `deleted`, `person_id`) VALUES
('2019-07-31 17:12:40', 1, '636363', '999919999.00', 0, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_grants`
--

DROP TABLE IF EXISTS `ospos_grants`;
CREATE TABLE `ospos_grants` (
  `permission_id` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  `menu_group` varchar(32) DEFAULT 'home'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_grants`
--

INSERT INTO `ospos_grants` (`permission_id`, `person_id`, `menu_group`) VALUES
('access_control', 1, 'home'),
('access_control', 5, 'home'),
('access_control', 11, 'home'),
('access_control', 12, 'home'),
('attributes', 1, 'office'),
('attributes', 5, 'home'),
('cashups', 1, 'home'),
('cashups', 5, 'home'),
('config', 1, 'office'),
('config', 5, 'office'),
('customers', 1, 'home'),
('customers', 5, 'home'),
('customers', 11, 'home'),
('customers', 12, 'home'),
('employees', 1, 'office'),
('employees', 5, 'office'),
('expenses', 1, 'home'),
('expenses', 5, 'home'),
('expenses_categories', 1, 'home'),
('expenses_categories', 5, 'home'),
('giftcards', 1, 'home'),
('giftcards', 5, 'home'),
('home', 1, 'office'),
('home', 5, 'home'),
('home', 11, 'home'),
('home', 12, 'home'),
('items', 1, 'home'),
('items', 5, 'home'),
('items_stock', 1, '--'),
('items_stock', 5, '--'),
('item_kits', 1, 'home'),
('item_kits', 5, 'home'),
('messages', 1, 'home'),
('messages', 5, 'office'),
('office', 1, 'home'),
('office', 5, 'both'),
('price_conversions', 1, 'office'),
('price_conversions', 5, 'office'),
('receivings', 1, 'home'),
('receivings', 5, 'home'),
('receivings_stock', 1, '--'),
('receivings_stock', 5, '--'),
('reports', 1, 'home'),
('reports', 5, 'home'),
('reports_access_customers', 1, '--'),
('reports_access_customers', 5, '--'),
('reports_categories', 1, '--'),
('reports_categories', 5, '--'),
('reports_customers', 1, '--'),
('reports_customers', 5, '--'),
('reports_discounts', 1, '--'),
('reports_discounts', 5, '--'),
('reports_employees', 1, '--'),
('reports_employees', 5, '--'),
('reports_expenses_categories', 1, '--'),
('reports_expenses_categories', 5, '--'),
('reports_fiscalprinters', 1, '--'),
('reports_fiscalprinters', 5, '--'),
('reports_inventory', 1, '--'),
('reports_inventory', 5, '--'),
('reports_items', 1, '--'),
('reports_items', 5, '--'),
('reports_payments', 1, '--'),
('reports_payments', 5, '--'),
('reports_receivings', 1, '--'),
('reports_receivings', 5, '--'),
('reports_sales', 1, '--'),
('reports_sales', 5, '--'),
('reports_sales_taxes', 1, '--'),
('reports_sales_taxes', 5, '--'),
('reports_suppliers', 1, '--'),
('reports_suppliers', 5, '--'),
('reports_taxes', 1, '--'),
('reports_taxes', 5, '--'),
('sales', 1, 'home'),
('sales', 5, 'home'),
('sales', 11, 'home'),
('sales', 12, 'home'),
('sales_delete', 1, '--'),
('sales_delete', 5, '--'),
('sales_stock', 1, '--'),
('sales_stock', 5, '--'),
('sales_stock', 11, '--'),
('sales_stock', 12, '--'),
('suppliers', 1, 'home'),
('suppliers', 5, 'home'),
('taxes', 1, 'office'),
('taxes', 5, 'home');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_inventory`
--

DROP TABLE IF EXISTS `ospos_inventory`;
CREATE TABLE `ospos_inventory` (
  `trans_id` int(11) NOT NULL,
  `trans_items` int(11) NOT NULL DEFAULT '0',
  `trans_user` int(11) NOT NULL DEFAULT '0',
  `trans_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trans_comment` text NOT NULL,
  `trans_location` int(11) NOT NULL,
  `trans_inventory` decimal(15,3) NOT NULL DEFAULT '0.000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_inventory`
--

INSERT INTO `ospos_inventory` (`trans_id`, `trans_items`, `trans_user`, `trans_date`, `trans_comment`, `trans_location`, `trans_inventory`) VALUES
(1, 1, 1, '2019-07-02 15:08:50', 'Edición Manual de Cantidad', 1, '0.000'),
(2, 2, 5, '2019-07-02 19:23:27', 'Edición Manual de Cantidad', 1, '0.000'),
(3, 3, 5, '2019-07-02 19:27:27', 'Edición Manual de Cantidad', 1, '0.000'),
(4, 4, 5, '2019-07-11 16:33:40', 'Edición Manual de Cantidad', 1, '1.000'),
(11, 8, 11, '2019-07-11 17:11:31', 'Edición Manual de Cantidad', 1, '1.000'),
(12, 9, 11, '2019-07-11 17:15:17', 'Edición Manual de Cantidad', 1, '1.000'),
(13, 10, 11, '2019-07-11 17:15:46', 'Edición Manual de Cantidad', 1, '1.000'),
(14, 11, 11, '2019-07-11 17:16:31', 'Edición Manual de Cantidad', 1, '1.000'),
(15, 12, 11, '2019-07-11 17:16:46', 'Edición Manual de Cantidad', 1, '1.000'),
(16, 13, 11, '2019-07-11 17:17:25', 'Edición Manual de Cantidad', 1, '1.000'),
(17, 14, 11, '2019-07-11 17:18:39', 'Edición Manual de Cantidad', 1, '1.000'),
(18, 15, 11, '2019-07-11 17:18:50', 'Edición Manual de Cantidad', 1, '1.000'),
(19, 16, 11, '2019-07-11 17:18:57', 'Edición Manual de Cantidad', 1, '1.000'),
(20, 17, 11, '2019-07-11 17:19:05', 'Edición Manual de Cantidad', 1, '1.000'),
(21, 18, 11, '2019-07-11 17:19:13', 'Edición Manual de Cantidad', 1, '1.000'),
(22, 19, 11, '2019-07-11 17:19:19', 'Edición Manual de Cantidad', 1, '1.000'),
(23, 20, 11, '2019-07-11 17:19:26', 'Edición Manual de Cantidad', 1, '1.000'),
(24, 11, 11, '2019-07-11 17:22:53', 'POS 11', 1, '-1.000'),
(25, 11, 5, '2019-07-11 17:25:51', 'Edición Manual de Cantidad', 1, '1.000'),
(26, 21, 11, '2019-07-11 17:28:17', 'Edición Manual de Cantidad', 1, '1.000'),
(27, 9, 11, '2019-07-11 17:29:06', 'POS 12', 1, '-1.000'),
(28, 22, 11, '2019-07-11 17:36:27', 'Edición Manual de Cantidad', 1, '1.000'),
(29, 23, 11, '2019-07-11 17:37:17', 'Edición Manual de Cantidad', 1, '1.000'),
(30, 24, 11, '2019-07-11 17:37:39', 'Edición Manual de Cantidad', 1, '1.000'),
(31, 25, 11, '2019-07-11 17:39:27', 'Edición Manual de Cantidad', 1, '1.000'),
(32, 26, 11, '2019-07-11 17:39:44', 'Edición Manual de Cantidad', 1, '1.000'),
(33, 27, 11, '2019-07-11 17:40:57', 'Edición Manual de Cantidad', 1, '1.000'),
(34, 28, 11, '2019-07-11 17:41:36', 'Edición Manual de Cantidad', 1, '1.000'),
(35, 29, 11, '2019-07-11 17:42:02', 'Edición Manual de Cantidad', 1, '1.000'),
(36, 30, 11, '2019-07-11 17:42:28', 'Edición Manual de Cantidad', 1, '1.000'),
(37, 31, 11, '2019-07-11 17:42:45', 'Edición Manual de Cantidad', 1, '1.000'),
(38, 32, 11, '2019-07-11 17:43:07', 'Edición Manual de Cantidad', 1, '1.000'),
(39, 33, 11, '2019-07-11 17:43:43', 'Edición Manual de Cantidad', 1, '1.000'),
(40, 34, 11, '2019-07-11 17:44:25', 'Edición Manual de Cantidad', 1, '1.000'),
(41, 35, 11, '2019-07-11 17:47:26', 'Edición Manual de Cantidad', 1, '1.000'),
(42, 36, 11, '2019-07-11 17:49:15', 'Edición Manual de Cantidad', 1, '1.000'),
(43, 37, 11, '2019-07-11 17:49:47', 'Edición Manual de Cantidad', 1, '1.000'),
(44, 38, 11, '2019-07-11 17:52:21', 'Edición Manual de Cantidad', 1, '1.000'),
(45, 39, 11, '2019-07-11 18:06:16', 'Edición Manual de Cantidad', 1, '1.000'),
(46, 40, 11, '2019-07-11 18:07:02', 'Edición Manual de Cantidad', 1, '1.000'),
(47, 41, 11, '2019-07-11 18:07:32', 'Edición Manual de Cantidad', 1, '1.000'),
(48, 42, 11, '2019-07-11 18:08:42', 'Edición Manual de Cantidad', 1, '1.000'),
(49, 40, 11, '2019-07-11 18:10:32', 'Eliminado', 1, '-1.000'),
(50, 43, 11, '2019-07-11 18:55:59', 'Edición Manual de Cantidad', 1, '1.000'),
(51, 44, 11, '2019-07-11 18:56:13', 'Edición Manual de Cantidad', 1, '1.000'),
(52, 45, 11, '2019-07-11 18:56:47', 'Edición Manual de Cantidad', 1, '1.000'),
(53, 46, 11, '2019-07-11 18:58:51', 'Edición Manual de Cantidad', 1, '1.000'),
(54, 47, 11, '2019-07-11 19:15:06', 'Edición Manual de Cantidad', 1, '1.000'),
(55, 48, 11, '2019-07-11 19:15:37', 'Edición Manual de Cantidad', 1, '1.000'),
(56, 49, 11, '2019-07-11 19:15:49', 'Edición Manual de Cantidad', 1, '1.000'),
(57, 50, 11, '2019-07-11 19:16:09', 'Edición Manual de Cantidad', 1, '1.000'),
(58, 51, 11, '2019-07-11 19:16:24', 'Edición Manual de Cantidad', 1, '1.000'),
(59, 52, 11, '2019-07-11 19:16:38', 'Edición Manual de Cantidad', 1, '1.000'),
(60, 53, 11, '2019-07-11 19:16:51', 'Edición Manual de Cantidad', 1, '1.000'),
(61, 54, 11, '2019-07-11 19:17:03', 'Edición Manual de Cantidad', 1, '1.000'),
(62, 55, 11, '2019-07-11 19:17:14', 'Edición Manual de Cantidad', 1, '1.000'),
(63, 56, 11, '2019-07-11 19:17:54', 'Edición Manual de Cantidad', 1, '1.000'),
(64, 57, 11, '2019-07-11 19:19:41', 'Edición Manual de Cantidad', 1, '1.000'),
(65, 58, 11, '2019-07-11 19:20:19', 'Edición Manual de Cantidad', 1, '1.000'),
(66, 40, 11, '2019-07-11 19:26:05', '', 1, '1.000'),
(67, 59, 11, '2019-07-11 19:34:42', 'Edición Manual de Cantidad', 1, '1.000'),
(68, 60, 11, '2019-07-11 19:35:30', 'Edición Manual de Cantidad', 1, '1.000'),
(69, 61, 11, '2019-07-12 20:47:38', 'Edición Manual de Cantidad', 1, '0.000'),
(70, 62, 5, '2019-07-31 14:40:07', 'Edición Manual de Cantidad', 1, '0.000'),
(71, 63, 5, '2019-07-31 14:41:21', 'Edición Manual de Cantidad', 1, '0.000'),
(72, 64, 5, '2019-07-31 17:35:35', 'Edición Manual de Cantidad', 1, '1.000'),
(73, 65, 5, '2019-07-31 17:36:36', 'Edición Manual de Cantidad', 1, '1.000'),
(74, 66, 5, '2019-07-31 17:36:59', 'Edición Manual de Cantidad', 1, '1.000'),
(75, 67, 5, '2019-07-31 17:37:13', 'Edición Manual de Cantidad', 1, '1.000'),
(76, 68, 5, '2019-07-31 17:38:21', 'Edición Manual de Cantidad', 1, '1.000'),
(77, 69, 5, '2019-07-31 17:39:37', 'Edición Manual de Cantidad', 1, '1.000'),
(78, 70, 5, '2019-07-31 17:39:59', 'Edición Manual de Cantidad', 1, '1.000'),
(79, 71, 5, '2019-07-31 17:40:16', 'Edición Manual de Cantidad', 1, '1.000'),
(80, 72, 5, '2019-07-31 17:40:33', 'Edición Manual de Cantidad', 1, '1.000'),
(81, 73, 5, '2019-07-31 17:41:17', 'Edición Manual de Cantidad', 1, '1.000'),
(82, 74, 5, '2019-07-31 17:43:26', 'Edición Manual de Cantidad', 1, '1.000'),
(83, 75, 5, '2019-07-31 17:44:24', 'Edición Manual de Cantidad', 1, '1.000'),
(84, 76, 5, '2019-07-31 17:44:45', 'Edición Manual de Cantidad', 1, '1.000'),
(85, 77, 5, '2019-07-31 17:47:50', 'Edición Manual de Cantidad', 1, '1.000'),
(86, 78, 5, '2019-07-31 17:48:02', 'Edición Manual de Cantidad', 1, '1.000'),
(87, 79, 5, '2019-07-31 17:48:07', 'Edición Manual de Cantidad', 1, '1.000'),
(88, 80, 5, '2019-07-31 17:48:15', 'Edición Manual de Cantidad', 1, '1.000'),
(89, 81, 5, '2019-07-31 17:48:23', 'Edición Manual de Cantidad', 1, '1.000'),
(90, 82, 5, '2019-07-31 17:48:28', 'Edición Manual de Cantidad', 1, '1.000'),
(91, 83, 5, '2019-07-31 17:48:36', 'Edición Manual de Cantidad', 1, '1.000'),
(92, 84, 5, '2019-07-31 17:48:44', 'Edición Manual de Cantidad', 1, '1.000'),
(93, 85, 1, '2019-07-31 21:08:15', 'Edición Manual de Cantidad', 1, '0.000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_items`
--

DROP TABLE IF EXISTS `ospos_items`;
CREATE TABLE `ospos_items` (
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `item_number` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `cost_price` decimal(15,2) NOT NULL,
  `unit_price` decimal(15,2) NOT NULL,
  `reorder_level` decimal(15,3) NOT NULL DEFAULT '0.000',
  `receiving_quantity` decimal(15,3) NOT NULL DEFAULT '1.000',
  `item_id` int(10) NOT NULL,
  `pic_filename` varchar(255) DEFAULT NULL,
  `allow_alt_description` tinyint(1) NOT NULL,
  `is_serialized` tinyint(1) NOT NULL,
  `stock_type` tinyint(2) NOT NULL DEFAULT '0',
  `item_type` tinyint(2) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `tax_category_id` int(10) DEFAULT NULL,
  `qty_per_pack` decimal(15,3) NOT NULL DEFAULT '1.000',
  `pack_name` varchar(8) DEFAULT 'Each',
  `low_sell_item_id` int(10) DEFAULT '0',
  `hsn_code` varchar(32) NOT NULL DEFAULT '',
  `is_membership` tinyint(1) NOT NULL DEFAULT '0',
  `frequency` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_items`
--

INSERT INTO `ospos_items` (`name`, `category`, `supplier_id`, `item_number`, `description`, `cost_price`, `unit_price`, `reorder_level`, `receiving_quantity`, `item_id`, `pic_filename`, `allow_alt_description`, `is_serialized`, `stock_type`, `item_type`, `deleted`, `tax_category_id`, `qty_per_pack`, `pack_name`, `low_sell_item_id`, `hsn_code`, `is_membership`, `frequency`) VALUES
('Crossfit', 'Servicios', NULL, '2001000000005', '', '0.00', '120000.00', '1.000', '1.000', 1, NULL, 0, 0, 1, 0, 0, 0, '1.000', 'Unidad', 1, '', 1, 3),
('Funcional', 'Servicios', NULL, '2002000000002', '', '0.00', '80000.00', '1.000', '1.000', 2, NULL, 0, 0, 1, 0, 0, 0, '1.000', 'Unidad', 2, '', 1, 3),
('Inscripción', 'Servicios', NULL, '2003000000009', '', '0.00', '8000.00', '1.000', '1.000', 3, NULL, 0, 0, 1, 0, 0, 0, '1.000', 'Unidad', 3, '', 0, 0),
('Franela', 'Store', NULL, 'D-08', '', '70000.00', '140000.00', '1.000', '1.000', 4, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 4, '', 0, 0),
('FRANELILLA (DAMA)', 'Store', NULL, 'D-23', '', '0.00', '0.00', '1.000', '1.000', 8, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 8, '', 0, 0),
('FRANELILLA (DAMA)', 'STORE', NULL, 'D-24', '', '0.00', '0.00', '1.000', '1.000', 9, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 9, '', 0, 0),
('FRANELILLA (DAMA)', 'STORE', NULL, 'D-22', '', '0.00', '0.00', '1.000', '1.000', 10, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 10, '', 0, 0),
('FRANELILLA (DAMA)', 'STORE', NULL, 'D-19', '', '0.00', '0.00', '1.000', '1.000', 11, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 11, '', 0, 0),
('FRANELILLA (DAMA)', 'STORE', NULL, 'D-18', '', '0.00', '0.00', '1.000', '1.000', 12, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 12, '', 0, 0),
('FRANELILLA (DAMA)', 'STORE', NULL, 'D-20', '', '0.00', '0.00', '1.000', '1.000', 13, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 13, '', 0, 0),
('CHALK ROGUE', 'STORE', NULL, 'C-32', '', '0.00', '0.00', '1.000', '1.000', 14, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 14, '', 0, 0),
('CHALK ROGUE', 'STORE', NULL, 'C-31', '', '0.00', '0.00', '1.000', '1.000', 15, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 15, '', 0, 0),
('CHALK ROGUE', 'STORE', NULL, 'C-30', '', '0.00', '0.00', '1.000', '1.000', 16, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 16, '', 0, 0),
('CHALK ROGUE', 'STORE', NULL, 'C-29', '', '0.00', '0.00', '1.000', '1.000', 17, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 17, '', 0, 0),
('CHALK ROGUE', 'STORE', NULL, 'C-28', '', '0.00', '0.00', '1.000', '1.000', 18, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 18, '', 0, 0),
('CHALK ROGUE', 'STORE', NULL, 'C-27', '', '0.00', '0.00', '1.000', '1.000', 19, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 19, '', 0, 0),
('CHALK ROGUE', 'STORE', NULL, 'C-26', '', '0.00', '0.00', '1.000', '1.000', 20, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 20, '', 0, 0),
('FRANELA (CABALLERO)', 'STORE', NULL, 'B-07', '', '0.00', '0.00', '1.000', '1.000', 21, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 21, '', 0, 0),
('FRANELA (CABALLERO)', 'STORE', NULL, 'B-04', '', '0.00', '0.00', '1.000', '1.000', 22, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 22, '', 0, 0),
('FRANELA (CABALLERO)', 'STORE', NULL, 'D-07', '', '0.00', '0.00', '1.000', '1.000', 23, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 23, '', 0, 0),
('FRANELA (CABALLERO)', 'STORE', NULL, 'D-03', '', '0.00', '0.00', '1.000', '1.000', 24, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 24, '', 0, 0),
('FRANELA (CABALLERO)', 'STORE', NULL, 'D-06', '', '0.00', '0.00', '1.000', '1.000', 25, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 25, '', 0, 0),
('FRANELA (CABALLERO)', 'STORE', NULL, 'D-02', '', '0.00', '0.00', '1.000', '1.000', 26, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 26, '', 0, 0),
('FRANELA (DAMA)', 'STORE', NULL, 'D-21', '', '0.00', '0.00', '1.000', '1.000', 27, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 27, '', 0, 0),
('FRANELA (DAMA)', 'STORE', NULL, 'D-14', '', '0.00', '0.00', '1.000', '1.000', 28, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 28, '', 0, 0),
('FRANELA (DAMA)', 'STORE', NULL, 'D-11', '', '0.00', '0.00', '1.000', '1.000', 29, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 29, '', 0, 0),
('FRANELA (DAMA)', 'STORE', NULL, 'D-10', '', '0.00', '0.00', '1.000', '1.000', 30, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 30, '', 0, 0),
('FRANELA (DAMA)', 'STORE', NULL, 'D-17', '', '0.00', '0.00', '1.000', '1.000', 31, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 31, '', 0, 0),
('FRANELA (DAMA)', 'STORE', NULL, 'D-15', '', '0.00', '0.00', '1.000', '1.000', 32, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 32, '', 0, 0),
('FRANELA (DAMA)', 'STORE', NULL, 'D-16', '', '0.00', '0.00', '1.000', '1.000', 33, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 33, '', 0, 0),
('FRANELA (DAMA)', 'STORE', NULL, 'D-13', '', '0.00', '0.00', '1.000', '1.000', 34, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 34, '', 0, 0),
('FRANELILLA(DAMA)', 'STORE', NULL, 'D-25', '', '0.00', '0.00', '1.000', '1.000', 35, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 35, '', 0, 0),
('LEGGINGS', 'STORE', NULL, 'D-32', '', '0.00', '0.00', '1.000', '1.000', 36, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 36, '', 0, 0),
('LEGGINGS', 'STORE', NULL, 'D-28', '', '0.00', '0.00', '1.000', '1.000', 37, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 37, '', 0, 0),
('LEGGINGS', 'STORE', NULL, 'B-22', '', '0.00', '0.00', '1.000', '1.000', 38, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 38, '', 0, 0),
('LEGGINGS', 'STORE', NULL, 'D-29', '', '0.00', '0.00', '1.000', '1.000', 39, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 39, '', 0, 0),
('TOP (F)', 'STORE', NULL, 'A-26', '', '0.00', '0.00', '1.000', '1.000', 40, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 40, '', 0, 0),
('TOP (F)', 'STORE', NULL, 'A-20', '', '0.00', '0.00', '1.000', '1.000', 41, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 41, '', 0, 0),
('TOP (F)', 'STORE', NULL, 'A-28', '', '0.00', '0.00', '1.000', '1.000', 42, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 42, '', 0, 0),
('SHORT (DAMA)', 'STORE', NULL, 'D-27', '', '0.00', '0.00', '1.000', '1.000', 43, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 43, '', 0, 0),
('SHORT (DAMA)', 'STORE', NULL, 'A-19', '', '0.00', '0.00', '1.000', '1.000', 44, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 44, '', 0, 0),
('SHORT (DAMA)', 'STORE', NULL, 'A-16', '', '0.00', '0.00', '1.000', '1.000', 45, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 45, '', 0, 0),
('SHORT (CABALLERO)', 'STORE', NULL, 'B-14', '', '0.00', '0.00', '1.000', '1.000', 46, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 46, '', 0, 0),
('SPEEED ROPE', 'STORE', NULL, 'X-10', '', '0.00', '0.00', '1.000', '1.000', 47, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 47, '', 0, 0),
('SPEEED ROPE', 'STORE', NULL, 'X-09', '', '0.00', '0.00', '1.000', '1.000', 48, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 48, '', 0, 0),
('SPEEED ROPE', 'STORE', NULL, 'X-12', '', '0.00', '0.00', '1.000', '1.000', 49, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 49, '', 0, 0),
('SPEEED ROPE', 'STORE', NULL, 'X-06', '', '0.00', '0.00', '1.000', '1.000', 50, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 50, '', 0, 0),
('SPEEED ROPE', 'STORE', NULL, 'X-01', '', '0.00', '0.00', '1.000', '1.000', 51, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 51, '', 0, 0),
('SPEEED ROPE', 'STORE', NULL, 'X-05', '', '0.00', '0.00', '1.000', '1.000', 52, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 52, '', 0, 0),
('SPEEED ROPE', 'STORE', NULL, 'X-11', '', '0.00', '0.00', '1.000', '1.000', 53, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 53, '', 0, 0),
('SPEEED ROPE', 'STORE', NULL, 'X-08', '', '0.00', '0.00', '1.000', '1.000', 54, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 54, '', 0, 0),
('SPEEED ROPE', 'STORE', NULL, 'X-04', '', '0.00', '0.00', '1.000', '1.000', 55, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 55, '', 0, 0),
('TERMO REEBOK', 'STORE', NULL, 'B-35', '', '0.00', '0.00', '1.000', '1.000', 56, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 56, '', 0, 0),
('TERMO REEBOK', 'STORE', NULL, 'A-48', '', '0.00', '0.00', '1.000', '1.000', 57, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 57, '', 0, 0),
('TERMO REEBOK', 'STORE', NULL, 'B-32', '', '0.00', '0.00', '1.000', '1.000', 58, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 58, '', 0, 0),
('BOLSO ', 'STORE', NULL, 'D-36', '', '0.00', '0.00', '1.000', '1.000', 59, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 59, '', 0, 0),
('GORRA', 'STORE', NULL, 'B-30', '', '0.00', '0.00', '1.000', '1.000', 60, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 60, '', 0, 0),
('Gimnasia Artistica', 'Servicios', NULL, NULL, '', '0.00', '60000.00', '1.000', '1.000', 61, NULL, 0, 0, 1, 0, 0, 0, '1.000', 'Unidad', 61, '', 1, 3),
('Personalizado', 'Servicios', NULL, NULL, '', '0.00', '0.00', '0.000', '1.000', 62, NULL, 0, 0, 1, 0, 0, 0, '1.000', 'Unidad', 62, '', 1, 3),
('Crossfit Kids', 'Servicios', NULL, NULL, '', '0.00', '0.00', '1.000', '1.000', 63, NULL, 0, 0, 1, 0, 0, 0, '1.000', 'Unidad', 63, '', 1, 3),
('TERMO', 'STORE', NULL, 'T-50', '', '0.00', '0.00', '1.000', '1.000', 64, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 64, '', 0, 0),
('TERMO', 'STORE', NULL, 'T-54', '', '0.00', '0.00', '1.000', '1.000', 65, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 65, '', 0, 0),
('TERMO', 'STORE', NULL, 'T-55', '', '0.00', '0.00', '1.000', '1.000', 66, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 66, '', 0, 0),
('TERMO', 'STORE', NULL, 'T-58', '', '0.00', '0.00', '1.000', '1.000', 67, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 67, '', 0, 0),
('TERMO', 'STORE', NULL, 'T-51', '', '0.00', '0.00', '1.000', '1.000', 68, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 68, '', 0, 0),
('TERMO', 'STORE', NULL, 'T-57', '', '0.00', '0.00', '1.000', '1.000', 69, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 69, '', 0, 0),
('TERMO', 'STORE', NULL, 'T-52', '', '0.00', '0.00', '1.000', '1.000', 70, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 70, '', 0, 0),
('TERMO', 'STORE', NULL, 'T-53', '', '0.00', '0.00', '1.000', '1.000', 71, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 71, '', 0, 0),
('TERMO', 'STORE', NULL, 'T-56', '', '0.00', '0.00', '1.000', '1.000', 72, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 72, '', 0, 0),
('TERMO', 'STORE', NULL, 'T-49', '', '0.00', '0.00', '1.000', '1.000', 73, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 73, '', 0, 0),
('TERMO', 'STORE', NULL, 't-61', '', '0.00', '0.00', '1.000', '1.000', 74, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 74, '', 0, 0),
('TERMO', 'STORE', NULL, 'T-60', '', '0.00', '0.00', '1.000', '1.000', 75, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 75, '', 0, 0),
('TERMO', 'STORE', NULL, 'T-62', '', '0.00', '0.00', '1.000', '1.000', 76, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 76, '', 0, 0),
('CHALK', 'STORE', NULL, 'C-33', '', '0.00', '0.00', '1.000', '1.000', 77, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 77, '', 0, 0),
('CHALK', 'STORE', NULL, 'C-34', '', '0.00', '0.00', '1.000', '1.000', 78, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 78, '', 0, 0),
('CHALK', 'STORE', NULL, 'C-35', '', '0.00', '0.00', '1.000', '1.000', 79, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 79, '', 0, 0),
('CHALK', 'STORE', NULL, 'C-36', '', '0.00', '0.00', '1.000', '1.000', 80, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 80, '', 0, 0),
('CHALK', 'STORE', NULL, 'C-37', '', '0.00', '0.00', '1.000', '1.000', 81, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 81, '', 0, 0),
('CHALK', 'STORE', NULL, 'C-38', '', '0.00', '0.00', '1.000', '1.000', 82, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 82, '', 0, 0),
('CHALK', 'STORE', NULL, 'C-40', '', '0.00', '0.00', '1.000', '1.000', 83, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 83, '', 0, 0),
('CHALK', 'STORE', NULL, 'C-39', '', '0.00', '0.00', '1.000', '1.000', 84, NULL, 0, 0, 0, 0, 0, 0, '1.000', 'Unidad', 84, '', 0, 0),
('DIA CROSSFIT', 'Servicios', NULL, NULL, '', '0.00', '12000.00', '1.000', '1.000', 85, NULL, 0, 0, 1, 0, 0, 0, '1.000', 'Unidad', 85, '', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_items_taxes`
--

DROP TABLE IF EXISTS `ospos_items_taxes`;
CREATE TABLE `ospos_items_taxes` (
  `item_id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_items_taxes`
--

INSERT INTO `ospos_items_taxes` (`item_id`, `name`, `percent`) VALUES
(1, 'IVA 16', '16.000'),
(2, 'IVA 16%', '16.000'),
(3, 'IVA 16%', '16.000'),
(4, 'IVA 16%', '16.000'),
(8, 'IVA 16%', '16.000'),
(9, 'IVA 16%', '16.000'),
(10, 'IVA 16%', '16.000'),
(11, 'IVA 16%', '16.000'),
(12, 'IVA 16%', '16.000'),
(13, 'IVA 16%', '16.000'),
(14, 'IVA 16%', '16.000'),
(15, 'IVA 16%', '16.000'),
(16, 'IVA 16%', '16.000'),
(17, 'IVA 16%', '16.000'),
(18, 'IVA 16%', '16.000'),
(19, 'IVA 16%', '16.000'),
(20, 'IVA 16%', '16.000'),
(21, 'IVA 16%', '16.000'),
(22, 'IVA 16%', '16.000'),
(23, 'IVA 16%', '16.000'),
(24, 'IVA 16%', '16.000'),
(25, 'IVA 16%', '16.000'),
(26, 'IVA 16%', '16.000'),
(27, 'IVA 16%', '16.000'),
(28, 'IVA 16%', '16.000'),
(29, 'IVA 16%', '16.000'),
(30, 'IVA 16%', '16.000'),
(31, 'IVA 16%', '16.000'),
(32, 'IVA 16%', '16.000'),
(33, 'IVA 16%', '16.000'),
(34, 'IVA 16%', '16.000'),
(35, 'IVA 16%', '16.000'),
(36, 'IVA 16%', '16.000'),
(37, 'IVA 16%', '16.000'),
(38, 'IVA 16%', '16.000'),
(39, 'IVA 16%', '16.000'),
(40, 'IVA 16%', '16.000'),
(41, 'IVA 16%', '16.000'),
(42, 'IVA 16%', '16.000'),
(43, 'IVA 16%', '16.000'),
(44, 'IVA 16%', '16.000'),
(45, 'IVA 16%', '16.000'),
(46, 'IVA 16%', '16.000'),
(47, 'IVA 16%', '16.000'),
(48, 'IVA 16%', '16.000'),
(49, 'IVA 16%', '16.000'),
(50, 'IVA 16%', '16.000'),
(51, 'IVA 16%', '16.000'),
(52, 'IVA 16%', '16.000'),
(53, 'IVA 16%', '16.000'),
(54, 'IVA 16%', '16.000'),
(55, 'IVA 16%', '16.000'),
(56, 'IVA 16%', '16.000'),
(57, 'IVA 16%', '16.000'),
(58, 'IVA 16%', '16.000'),
(59, 'IVA 16%', '16.000'),
(60, 'IVA 16%', '16.000'),
(61, 'IVA 16%', '16.000'),
(62, 'IVA 16%', '16.000'),
(63, 'IVA 16%', '16.000'),
(64, 'IVA 16%', '16.000'),
(65, 'IVA 16%', '16.000'),
(66, 'IVA 16%', '16.000'),
(67, 'IVA 16%', '16.000'),
(68, 'IVA 16%', '16.000'),
(69, 'IVA 16%', '16.000'),
(70, 'IVA 16%', '16.000'),
(71, 'IVA 16%', '16.000'),
(72, 'IVA 16%', '16.000'),
(73, 'IVA 16%', '16.000'),
(74, 'IVA 16%', '16.000'),
(75, 'IVA 16%', '16.000'),
(76, 'IVA 16%', '16.000'),
(77, 'IVA 16%', '16.000'),
(78, 'IVA 16%', '16.000'),
(79, 'IVA 16%', '16.000'),
(80, 'IVA 16%', '16.000'),
(81, 'IVA 16%', '16.000'),
(82, 'IVA 16%', '16.000'),
(83, 'IVA 16%', '16.000'),
(84, 'IVA 16%', '16.000'),
(85, 'IVA 16%', '16.000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_item_kits`
--

DROP TABLE IF EXISTS `ospos_item_kits`;
CREATE TABLE `ospos_item_kits` (
  `item_kit_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `item_id` int(10) NOT NULL DEFAULT '0',
  `kit_discount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `kit_discount_type` tinyint(2) NOT NULL DEFAULT '0',
  `price_option` tinyint(2) NOT NULL DEFAULT '0',
  `print_option` tinyint(2) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_item_kit_items`
--

DROP TABLE IF EXISTS `ospos_item_kit_items`;
CREATE TABLE `ospos_item_kit_items` (
  `item_kit_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` decimal(15,3) NOT NULL,
  `kit_sequence` int(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_item_quantities`
--

DROP TABLE IF EXISTS `ospos_item_quantities`;
CREATE TABLE `ospos_item_quantities` (
  `item_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `quantity` decimal(15,3) NOT NULL DEFAULT '0.000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_item_quantities`
--

INSERT INTO `ospos_item_quantities` (`item_id`, `location_id`, `quantity`) VALUES
(1, 1, '0.000'),
(2, 1, '0.000'),
(3, 1, '0.000'),
(4, 1, '1.000'),
(8, 1, '1.000'),
(9, 1, '0.000'),
(10, 1, '1.000'),
(11, 1, '1.000'),
(12, 1, '1.000'),
(13, 1, '1.000'),
(14, 1, '1.000'),
(15, 1, '1.000'),
(16, 1, '1.000'),
(17, 1, '1.000'),
(18, 1, '1.000'),
(19, 1, '1.000'),
(20, 1, '1.000'),
(21, 1, '1.000'),
(22, 1, '1.000'),
(23, 1, '1.000'),
(24, 1, '1.000'),
(25, 1, '1.000'),
(26, 1, '1.000'),
(27, 1, '1.000'),
(28, 1, '1.000'),
(29, 1, '1.000'),
(30, 1, '1.000'),
(31, 1, '1.000'),
(32, 1, '1.000'),
(33, 1, '1.000'),
(34, 1, '1.000'),
(35, 1, '1.000'),
(36, 1, '1.000'),
(37, 1, '1.000'),
(38, 1, '1.000'),
(39, 1, '1.000'),
(40, 1, '1.000'),
(41, 1, '1.000'),
(42, 1, '1.000'),
(43, 1, '1.000'),
(44, 1, '1.000'),
(45, 1, '1.000'),
(46, 1, '1.000'),
(47, 1, '1.000'),
(48, 1, '1.000'),
(49, 1, '1.000'),
(50, 1, '1.000'),
(51, 1, '1.000'),
(52, 1, '1.000'),
(53, 1, '1.000'),
(54, 1, '1.000'),
(55, 1, '1.000'),
(56, 1, '1.000'),
(57, 1, '1.000'),
(58, 1, '1.000'),
(59, 1, '1.000'),
(60, 1, '1.000'),
(61, 1, '0.000'),
(62, 1, '0.000'),
(63, 1, '0.000'),
(64, 1, '1.000'),
(65, 1, '1.000'),
(66, 1, '1.000'),
(67, 1, '1.000'),
(68, 1, '1.000'),
(69, 1, '1.000'),
(70, 1, '1.000'),
(71, 1, '1.000'),
(72, 1, '1.000'),
(73, 1, '1.000'),
(74, 1, '1.000'),
(75, 1, '1.000'),
(76, 1, '1.000'),
(77, 1, '1.000'),
(78, 1, '1.000'),
(79, 1, '1.000'),
(80, 1, '1.000'),
(81, 1, '1.000'),
(82, 1, '1.000'),
(83, 1, '1.000'),
(84, 1, '1.000'),
(85, 1, '0.000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_migrations`
--

DROP TABLE IF EXISTS `ospos_migrations`;
CREATE TABLE `ospos_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_migrations`
--

INSERT INTO `ospos_migrations` (`version`) VALUES
(20190615100000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_modules`
--

DROP TABLE IF EXISTS `ospos_modules`;
CREATE TABLE `ospos_modules` (
  `name_lang_key` varchar(255) NOT NULL,
  `desc_lang_key` varchar(255) NOT NULL,
  `sort` int(10) NOT NULL,
  `module_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_modules`
--

INSERT INTO `ospos_modules` (`name_lang_key`, `desc_lang_key`, `sort`, `module_id`) VALUES
('module_access_control', 'module_access_control_desc', 20, 'access_control'),
('module_attributes', 'module_attributes_desc', 107, 'attributes'),
('module_cashups', 'module_cashups_desc', 110, 'cashups'),
('module_config', 'module_config_desc', 900, 'config'),
('module_customers', 'module_customers_desc', 10, 'customers'),
('module_employees', 'module_employees_desc', 80, 'employees'),
('module_expenses', 'module_expenses_desc', 108, 'expenses'),
('module_expenses_categories', 'module_expenses_categories_desc', 109, 'expenses_categories'),
('module_giftcards', 'module_giftcards_desc', 90, 'giftcards'),
('module_home', 'module_home_desc', 1, 'home'),
('module_items', 'module_items_desc', 20, 'items'),
('module_item_kits', 'module_item_kits_desc', 30, 'item_kits'),
('module_messages', 'module_messages_desc', 98, 'messages'),
('module_office', 'module_office_desc', 999, 'office'),
('module_price_conversions', 'module_price_conversions_desc', 55, 'price_conversions'),
('module_receivings', 'module_receivings_desc', 60, 'receivings'),
('module_reports', 'module_reports_desc', 50, 'reports'),
('module_sales', 'module_sales_desc', 70, 'sales'),
('module_suppliers', 'module_suppliers_desc', 40, 'suppliers'),
('module_taxes', 'module_taxes_desc', 105, 'taxes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_people`
--

DROP TABLE IF EXISTS `ospos_people`;
CREATE TABLE `ospos_people` (
  `dni` varchar(20) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` int(1) DEFAULT NULL,
  `phone_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address_1` varchar(255) NOT NULL,
  `address_2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `comments` text NOT NULL,
  `person_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_people`
--

INSERT INTO `ospos_people` (`dni`, `first_name`, `last_name`, `gender`, `phone_number`, `email`, `address_1`, `address_2`, `city`, `state`, `zip`, `country`, `comments`, `person_id`) VALUES
(NULL, 'Jorge', 'Colmenarez', 1, '+584149739547', 'jlct.master@gmail.com', 'Urb. Llano Lindo II Casa H-08', '', 'Araure', 'Portuguesa', '3303', 'Venezuela', '', 1),
('20389586', 'Jorge', 'Colmenarez', 1, '', 'jlct.master@gmail.com', '', '', '', '', '', '', '', 2),
('', 'Luigi', 'Luciani', 1, '', '', '', '', '', '', '', '', '', 3),
('', 'Winder', 'Colmenarez', 1, '', '', '', '', '', '', '', '', '', 4),
('', 'Yohan', 'Gutierrez', 1, '', '', '', '', '', '', '', '', '', 5),
('', 'Fernando', 'Aguilera', 1, '', '', '', '', '', '', '', '', '', 6),
('', 'Nelson', 'Colmenarez', 1, '', '', '', '', '', '', '', '', '', 7),
('9843714', 'Ana', 'Escalona', 0, '04245153465', '', '', '', '', '', '', '', '', 8),
('21536920', 'Melitza', 'Mora', 0, '', '', '', '', '', '', '', '', '', 9),
('19172597', 'Yohan', 'Gutierrez', 1, '', '', '', '', '', '', '', '', '', 10),
('', 'Catherine', 'Goyo', 0, '', '', '', '', '', '', '', '', '', 11),
(NULL, 'Maria', 'Alvarado', 0, '', '', '', '', '', '', '', '', '', 12),
('28005600', 'Maria', 'Alvarado', 0, '', '', '', '', '', '', '', '', '', 13),
('27841225', 'Silvia ', 'Mazzone', 0, '', '', '', '', '', '', '', '', '', 14),
('26674698', 'Giusseppe ', 'Cristofano', 1, '04245918686', '', '', '', '', '', '', '', '', 15),
('17368501', 'Francis ', 'Diaz', 0, '', '', '', '', '', '', '', '', '', 16),
('25791386', 'Pascual  ', 'Parrillo ', 1, '04148033877', '', '', '', '', '', '', '', '', 17),
('27132160', 'Zuly', 'Alvarado', 0, '04245304933', '', '', '', '', '', '', '', '', 18),
('10144702', 'Giovanni', ' Colmenarez', 1, '04140544991', '', '', '', '', '', '', '', '', 19),
('17002682', 'Pedro ', 'Aguilar ', 1, '04120528144', '', '', '', '', '', '', '', '', 20),
('21059508', 'Yelixza', 'Ortiz', 0, '', '', '', '', '', '', '', '', '', 21),
('33084483', 'Agnes', 'Urdaneta', 0, '', '', '', '', '', '', '', '', '', 22),
('33084483', 'Chantal', 'Herrera', 0, '04245448174', '', '', '', '', '', '', '', '', 23),
('25761550', 'Manuela', 'Lopez', 0, '', '', '', '', '', '', '', '', '', 24),
('29629606', 'Alexandra', 'Ortiz', 0, '', '', '', '', '', '', '', '', '', 25),
('14271761', 'Gessika', 'Ramones', 0, '04145575153', '', '', '', '', '', '', '', '', 26),
('32042636', 'Anthony', 'Rey', 1, '', '', '', '', '', '', '', '', '', 27),
('31914710', 'Mirela ', 'Martos', 0, '', '', '', '', '', '', '', '', '', 28),
('31914710', 'Mirela ', 'Martos', 0, '', '', '', '', '', '', '', '', '', 29),
('31914710', 'Mirela ', 'Martos', 0, '', '', '', '', '', '', '', '', '', 30),
('31914710', 'Mirela ', 'Martos', 0, '', '', '', '', '', '', '', '', '', 31),
('31914710', 'Mirela', 'Martos', 0, '', '', '', '', '', '', '', '', '', 32),
('24145669', 'Marisbeth', 'Vargas', 0, '04145486221', '', '', '', '', '', '', '', '', 33),
('13703345', 'Hanna', 'Mosquera', 0, '', '', '', '', '', '', '', '', '', 34),
('10142853', 'Cornelia', 'Miraglia', 0, '', '', '', '', '', '', '', '', '', 35),
('12860007', 'Alessa ', 'Blanca', 0, '04245863445', '', '', '', '', '', '', '', '', 36),
('25422413', 'Keiber ', 'Chirino', 1, '', '', '', '', '', '', '', '', '', 37),
('26442218', 'Rebeca', 'Ortega', 0, '04143738570', '', '', '', '', '', '', '', '', 38),
('25163388', 'Andrea ', 'Cerrutti', 0, '', '', '', '', '', '', '', '', '', 39),
('22096982', 'Jesus', 'Diaz', 1, '', '', '', '', '', '', '', '', '', 40),
('22106153', 'Juan', 'Reyes', 1, '04245832030', '', '', '', '', '', '', '', '', 41),
('24145980', 'Rosnel ', 'Montes', 0, '', '', '', '', '', '', '', '', '', 42),
('1779637', 'Isabel', 'Algoneda ', 0, '04264000488', '', '', '', '', '', '', '', '', 43),
('19170078', 'Jose', 'Gwellen', 1, '04122661535', '', '', '', '', '', '', '', '', 44),
('27215951', 'Alexis ', 'Rodriguez', 1, '04245529327', '', '', '', '', '', '', '', '', 45),
('20272159', 'Antonella', 'Canelon', 0, '04245289260', '', '', '', '', '', '', '', 'CAROLINA MORAN', 46),
('31426915', 'Karoline', ' Weyss', 1, '04145567101', '', '', '', '', '', '', '', '', 47),
('16040188', 'Estefany', 'Vargas', 0, '04145771597', '', '', '', '', '', '', '', '', 48),
('14772949', 'Oriana ', 'Rodriguez', 0, '04127742825', '', '', '', '', '', '', '', '', 49),
('24587013', 'Karla', 'Vasquez', 0, '04120510208', '', '', '', '', '', '', '', '', 50),
('28156469', 'Manel ', 'Silva ', 1, '04145096830', '', '', '', '', '', '', '', '', 51),
('41610567', 'Gina', 'Perlaez', 0, '04145561511', '', '', '', '', '', '', '', '', 52),
('15237954', 'Tamara', 'Mizher', 0, '04143554837', '', '', '', '', '', '', '', '', 53),
('26903110', 'Eddilimar', 'Cordero', 0, '04245352862', '', '', '', '', '', '', '', '', 54),
('30323439', 'Daniela', 'Jaimes', 0, '04145374117', '', '', '', '', '', '', '', '', 55),
('12446582', 'Joaquina', 'Duin', 0, '04125245582', '', '', '', '', '', '', '', '', 56),
('21393317', 'Rafael', 'Torrealba', 1, '04127730261', '', '', '', '', '', '', '', '', 57),
('4603723', 'Carmen', 'Camacaro ', 0, '', '', '', '', '', '', '', '', '', 58),
('20039664', 'Carlos ', 'Briceño', 1, '', '', '', '', '', '', '', '', '', 59),
('26379622', 'Ronald ', 'Alvarado', 1, '', '', '', '', '', '', '', '', '', 60),
('24146127', 'Karla ', 'Alvarado', 0, '', '', '', '', '', '', '', '', '', 61),
('18103991', 'Samira ', 'Yunis', 0, '', '', '', '', '', '', '', '', '', 62),
('18977146', 'Ana ', 'Sierralta', 0, '', '', '', '', '', '', '', '', '', 63),
('12494082', 'Okarina', 'Molina', 0, '', '', '', '', '', '', '', '', '', 64),
('27054297', 'Nicole', 'Serrano', 0, '', '', '', '', '', '', '', '', '', 65),
('17600105', 'Vanessa ', 'Martinez', 0, '', '', '', '', '', '', '', '', '', 66),
('16871487', 'Yury ', 'De Abreu', 0, '', '', '', '', '', '', '', '', '', 67),
('16565879', 'Martha', 'Meza', 0, '', '', '', '', '', '', '', '', '', 68),
('20643077', 'Rosa', 'Suarez', 0, '04245666610', '', '', '', '', '', '', '', '', 69),
('19727839', 'Maria', 'Robles', 0, '04245098351', '', '', '', '', '', '', '', '', 70),
('16192826', 'Yoselyn', 'Dakkar', 0, '', '', '', '', '', '', '', '', '', 71),
('11460500', 'Yanire', 'Suarez', 0, '', '', '', '', '', '', '', '', '', 72),
('17797479', 'Patricia', 'Mollo', 0, '', '', '', '', '', '', '', '', '', 73),
('19798880', 'Ariana ', 'Almeida', 0, '', '', '', '', '', '', '', '', '', 74),
('20543307', 'Adriana ', 'Camacaro', 0, '', '', '', '', '', '', '', '', '', 75),
('15493143', 'Alejandra', 'Filardo', 0, '04145217807', '', '', '', '', '', '', '', '', 76),
('20390879', 'Beatriz Adriana ', 'Muñoz', 0, '', '', '', '', '', '', '', '', '', 77),
('28200350', 'Jovanna', 'Cibelli', 0, '', '', '', '', '', '', '', '', '', 78),
('10636739', 'Claudia', 'Diaz', 0, '', '', '', '', '', '', '', '', '', 79),
('15493354', 'Daniela ', 'Barbiero', 0, '', '', '', '', '', '', '', '', '', 80),
('19714108', 'Yirbania ', 'Dakkar', 0, '', '', '', '', '', '', '', '', '', 81),
('13354095', 'Dalia', 'Carmona', 0, '', '', '', '', '', '', '', '', '', 82),
('24145247', 'Maryelis', 'Ramirez', 0, '', '', '', '', '', '', '', '', '', 83),
('16565665', 'Angelica', 'Guanipa', 0, '', '', '', '', '', '', '', '', '', 84),
('15867007', 'Wister ', 'Cañas', 1, '', '', '', '', '', '', '', '', '', 85),
('27575996', 'Steffany', 'Churfane', 0, '', '', '', '', '', '', '', '', '', 86),
('19172462', 'Orlandy', 'Carrillo ', 0, '', '', '', '', '', '', '', '', '', 87),
('18929785', 'Amarilis', 'Castillo', 0, '', '', '', '', '', '', '', '', '', 88),
('14887741', 'Carlos', 'Rodriguez Tato', 1, '', '', '', '', '', '', '', '', '', 89),
('27054297', 'Nicole', 'Serrano', 0, '', '', '', '', '', '', '', '', '', 90),
('18288309', 'Egarlys', 'De la cruz', 0, '04245905701', '', '', '', '', '', '', '', '', 91),
('14426958', 'Ana Isabella', 'Hernandez', 0, '0414352905', '', '', '', '', '', '', '', '', 92),
('30128108', 'Andrea ', 'Urdaneta', NULL, '04264570251', '', '', '', '', '', '', '', '', 93),
('11432436', 'Henry', 'Elcure', 1, '', '', '', '', '', '', '', '', '', 94),
('15621292', 'Liliana', 'Muñoz', 0, '', '', '', '', '', '', '', '', '', 95),
('25606544', 'Jorge ', 'Chacon', 1, '', '', '', '', '', '', '', '', '', 96),
('16126591', 'Enyitza', 'Romoli', 0, '', '', '', '', '', '', '', '', '', 97),
('14466548', 'Elizabeth', 'Perez', 0, '', '', '', '', '', '', '', '', '', 98),
('16566443', 'Marco', 'Do Carmo', 1, '', '', '', '', '', '', '', '', '', 99),
('15298028', 'Nisrin', 'Kanabani', 0, '', '', '', '', '', '', '', '', '', 100),
('17003681', 'Maryuri', 'Roa', 0, '', '', '', '', '', '', '', '', '', 101),
('13486266', 'Richard', 'Garcia', 1, '', '', '', '', '', '', '', '', '', 102),
('14425051', 'Naysbeth', 'Diaz', 0, '', '', '', '', '', '', '', '', '', 103),
('14676572', 'Maria del Valle', 'Diaz', 0, '', '', '', '', '', '', '', '', '', 104),
('13584645', 'Ana ', 'Mendoza', 0, '', '', '', '', '', '', '', '', '', 105),
('24684281', 'Monica', 'Urdaneta', 0, '04140565416', '', '', '', '', '', '', '', '', 106),
('26772721', 'Dorianny', 'Iaboni', 0, '', '', '', '', '', '', '', '', '', 107),
('27419713', 'Isis ', 'Arias', 0, '', '', '', '', '', '', '', '', '', 108),
('31541065', 'Jesus ', 'Timaure', 1, '04266126808', '', '', '', '', '', '', '', '', 109),
('22101002', 'Nathaly', 'Torrealba', 0, '', '', '', '', '', '', '', '', '', 110),
('24587814', 'Erasmo', 'Viscaya', 1, '', '', '', '', '', '', '', '', '', 111),
('22101002', 'Nathaly ', 'Torrealba', 0, '', '', '', '', '', '', '', '', '', 112),
('24587814', 'Erasmo', 'Viscaya', 1, '', '', '', '', '', '', '', '', '', 113),
('15298028', 'Nisrin', 'Kanobani', 0, '', '', '', '', '', '', '', '', '', 114),
('25606544', 'Jorge', 'Chacon', 1, '', '', '', '', '', '', '', '', '', 115),
('20389249', 'Erika', 'Orellana', 0, '04140567252', '', '', '', '', '', '', '', '', 116),
('15493143', 'Alejandra', 'Filardo', 0, '04145217807', '', '', '', '', '', '', '', '', 117),
('17599973', 'Gloria', 'Paredes', 0, '04125185625', '', '', '', '', '', '', '', '', 118),
('26972620', 'Arianna', 'Tovar', 0, '04120581251', '', '', '', '', '', '', '', '', 119),
('17276708', 'Andrea ', 'Mogollon', 0, '04245451468', '', '', '', '', '', '', '', '', 120),
('19790179', 'Andres', 'Khuffash', 1, '04120562094', '', '', '', '', '', '', '', '', 121),
('25761550', 'Manuela', 'Lopez', 0, '', '', '', '', '', '', '', '', '', 122),
('16956844-2', 'Victoria ', 'Torres', 0, '04245931163', '', '', '', '', '', '', '', '', 123),
('16965844', 'Alexandra', 'Ortiz', 0, '04245931163', '', '', '', '', '', '', '', '', 124),
('16965844-1', 'Victor Julio', 'Torres', 1, '04245931163', '', '', '', '', '', '', '', '', 125),
('32042325', 'Perla', 'Fusco', 0, '04140577731', '', '', '', '', '', '', '', '', 126),
('30208511', 'Veronica', 'Dorante', 0, '04121540345', '', '', '', '', '', '', '', '', 127),
('16566443', 'Camila', 'Camacho', 0, '04145577950', '', '', '', '', '', '', '', '', 128),
('31757731', 'Veronica', 'Villegas', 0, '04145446528', '', '', '', '', '', '', '', '', 129),
('32735501', 'Victoria', 'Villegas', 0, '04145446528', '', '', '', '', '', '', '', '', 130),
('28258819', 'Jesus', 'Villasmil', 1, '04245016396', '', '', '', '', '', '', '', '', 131),
('26759710', 'Angel', 'Fernandez', 1, '04145068665', '', '', '', '', '', '', '', '', 132),
('31165042', 'Sofia ', 'Soto', 0, '', '', '', '', '', '', '', '', '', 133),
('17278101', 'Eliana ', 'Barrios', 0, '', '', '', '', '', '', '', '', '', 134),
('30133121', 'Francisco', 'Espinoza', 1, '', '', '', '', '', '', '', '', '', 135),
('22106154', 'Maria ', 'Reyes', 0, '04143511180', '', '', '', '', '', '', '', '', 136),
('14425410', 'Carle ', 'Ortega', 0, '04145446528', '', '', '', '', '', '', '', '', 137),
('22098719', 'Alejandro ', 'Sandoval', 1, '04145060441', '', '', '', '', '', '', '', '', 138),
('19867028', 'Thaidelys', 'Serrano', 0, '0414517723', '', '', '', '', '', '', '', '', 139),
('30822510', 'Daniela ', 'Quintero', 0, '04125239757', '', '', '', '', '', '', '', '', 140),
('16965844', 'Victor ', 'Torres', 0, '04245931163', '', '', '', '', '', '', '', '', 141),
('29800400', 'Claudis', 'Del Castillo', 0, '', '', '', '', '', '', '', '', '', 142),
('18871058', 'Lelimar', 'Mantilla', 0, '04245074481', '', '', '', '', '', '', '', '', 143),
('25791840', 'Fabiana ', 'Perez', 0, '', '', '', '', '', '', '', '', '', 144),
('17362260', 'Maria G', 'Acosta ', 0, '0424570549', '', '', '', '', '', '', '', '', 145),
('18332502', 'Katherine', 'Moreno', 0, '04145784606', '', '', '', '', '', '', '', '', 146),
('16751951', 'Irma', 'Silva', 0, '04264552798', '', '', '', '', '', '', '', '', 147),
('30766772', 'Oriana ', 'Valdes', 0, '04245126323', '', '', '', '', '', '', '', '', 148),
('24587842', 'Teresa', 'Zoghbi', 0, '04245345738', '', '', '', '', '', '', '', '', 149),
('13555086', 'Dignora', 'Moreno', 0, '04149730317', '', '', '', '', '', '', '', '', 150),
('29847107', 'Freddy', 'Carrillo', 1, '', '', '', '', '', '', '', '', '', 151),
('29889721', 'Henyerly', 'Pacheco', 0, '04124287727', '', '', '', '', '', '', '', '', 152),
('21561902', 'Wistohor', 'Chourio', 1, '04126703908', '', '', '', '', '', '', '', '', 153),
('17944896', 'Ricardo', 'Alvarez', 1, '04245030852', '', '', '', '', '', '', '', '', 154),
('20271564', 'Maria', 'Cibelli', 0, '04145694766', '', '', '', '', '', '', '', '', 155),
('12859606', 'Johannes', 'Cibelli', NULL, '04245009417', '', '', '', '', '', '', '', '', 156),
('28004653', 'Luis ', 'Hernandez', 1, '', '', '', '', '', '', '', '', '', 157),
('17303575', 'Adrianny ', 'Rodriguez', 0, '04143555874', '', '', '', '', '', '', '', '', 158),
('17303576', 'Andreina', 'Rodriguez', 0, '04141577746', '', '', '', '', '', '', '', '', 159),
('16292714', 'Jose ', 'Garcia', 1, '04165029727', '', '', '', '', '', '', '', '', 160),
('15413694', 'Lenny', 'Romero', 0, '04145597607', '', '', '', '', '', '', '', '', 161),
('15690491', 'Leonardo', 'Caceres', 1, '04143558247', '', '', '', '', '', '', '', '', 162),
('26167404', 'Nelson', 'Colmenarez', 1, '04245005738', '', '', '', '', '', '', '', '', 163),
('26301438', 'Gabriela', 'Valera', 0, '04245936611', '', '', '', '', '', '', '', '', 164),
('13352463', 'Jose Ramon', 'Mejias', 1, '04145262414', '', '', '', '', '', '', '', '', 165),
('31057627', 'Rosangela', 'De Gouveia', 0, '04245714094', '', '', '', '', '', '', '', '', 166),
('20025279', 'Luis ', 'Bastidas', 1, '04245102461', '', '', '', '', '', '', '', '', 167),
('21393067', 'Maria Fernanda', 'Anzelmo', 0, '04145421151', '', '', '', '', '', '', '', '', 168),
('13485249', 'Victor ', 'Rey', 1, '04145595263', '', '', '', '', '', '', '', '', 169),
('29968910', 'Yessireth', 'Peña', 0, '04145398594', '', '', '', '', '', '', '', '', 170),
('27546419', 'Yessica', 'Peña', 0, '04245379582', '', '', '', '', '', '', '', '', 171),
('30637762', 'Stefany', 'Ruiz', 0, '04149518320', '', '', '', '', '', '', '', '', 172),
('21560440', 'Daniela', 'Madrid', 0, '04145440020', '', '', '', '', '', '', '', '', 173),
('23577452', 'Katherine', 'Wassouf', 0, '04245208490', '', '', '', '', '', '', '', '', 174),
('12090389', 'Gloria', 'Maldonado', 0, '04145574491', '', '', '', '', '', '', '', '', 175),
('17364524', 'Renny', 'Ceballo', 1, '04145548529', '', '', '', '', '', '', '', '', 176),
('11544390', 'Yajaira', 'Alvarez', 0, '04143559890', '', '', '', '', '', '', '', '', 177),
('14964538', 'Julian', 'Soto', 1, '04141198498', '', '', '', '', '', '', '', '', 178),
('6184692', 'Flor', 'Dugarte', 0, '04245331197', '', '', '', '', '', '', '', '', 179),
('8657167', 'Audrelys', 'Rico', 0, '04145644099', '', '', '', '', '', '', '', '', 180),
('13226124', 'Marilyn', 'Castillo', 0, '04145587888', '', '', '', '', '', '', '', '', 181),
('32651520', 'Gloria', 'Hernandez', 0, '04245201455', '', '', '', '', '', '', '', '', 182),
('28478287', 'Paola ', 'Villegas', 0, '04245191752', '', '', '', '', '', '', '', '', 183),
('28478508', 'Monica', 'Peña', 0, '04245039652', '', '', '', '', '', '', '', '', 184),
('12262751', 'Rosa', 'Mendez', 0, '04145777733', '', '', '', '', '', '', '', '', 185),
('32273632', 'Vanessa', 'Casamayor', 0, '04245513780', '', '', '', '', '', '', '', '', 186),
('11084116', 'Jorge', 'Casamayor', 1, '04245513780', '', '', '', '', '', '', '', '', 187),
('12526306', 'Indira', 'Parra', 0, '04145184158', '', '', '', '', '', '', '', '', 188),
('26572339', 'Julio', 'Colmenarez', 1, '04245020020', '', '', '', '', '', '', '', '', 189),
('26836520', 'Maria Daniela', 'Silva', 0, '04262556610', '', '', '', '', '', '', '', '', 190),
('25508606', 'Eloy Andres', 'Berroteran ', 1, '04266572744', '', '', '', '', '', '', '', '', 191),
('9835655', 'Linny', 'Sivira', 0, '04141575228', '', '', '', '', '', '', '', '', 192),
('27814322', 'Liscar', 'Sanchez', 0, '04245275390', '', '', '', '', '', '', '', '', 193),
('19053814', 'Waner', 'Perez', 1, '04145751666', '', '', '', '', '', '', '', '', 194),
('32652069', 'Mariana', 'Sulbaran', 0, '04245934578', '', '', '', '', '', '', '', '', 195),
('255085975', 'Victor Manuel', 'Rey', 1, '04143575000', '', '', '', '', '', '', '', '', 196),
('32103873', 'Maria Paulina ', 'Rivas ', 0, '04145573470', '', '', '', '', '', '', '', '', 197),
('32218950', 'Sophia', 'Guaithero', 0, '04145568627', '', '', '', '', '', '', '', '', 198),
('29540728', 'Veronica', 'Serrano', 0, '04247357768', '', '', '', '', '', '', '', '', 199),
('16862124', 'Edgar', 'Rumbos', 1, '04120530808', '', '', '', '', '', '', '', '', 200),
('26836010', 'Dante', 'Fidileo', 1, '04245002317', '', '', '', '', '', '', '', '', 201),
('31758350', 'Carlos', 'Fideleo', 1, '04245850398', '', '', '', '', '', '', '', '', 202),
('26504816', 'Jose ', 'Marcano', 1, '04125451323', '', '', '', '', '', '', '', '', 203),
('16899854', 'Luisa', 'Mendez', 0, '04245158509', '', '', '', '', '', '', '', '', 204),
('16899854', 'Juliandri', 'Mendez', 0, '04245158509', '', '', '', '', '', '', '', '', 205),
('27575164', 'Domingo', 'Reis', 1, '04145513631', '', '', '', '', '', '', '', '', 206),
('26273264', 'Betania', 'Villafañe', 0, '04145129440', '', '', '', '', '', '', '', '', 207),
('15070153', 'Jose Manuel', 'Ramones', 1, '04126067309', '', '', '', '', '', '', '', '', 208),
('15929283', 'Carolina', 'Lezama', 0, '04147729201', '', '', '', '', '', '', '', '', 209),
('24026513', 'Daniela', 'Villalobos', 0, '04145596144', '', '', '', '', '', '', '', '', 210),
('23479809', 'Jorge', 'Lopez', 1, '04146200181', '', '', '', '', '', '', '', '', 211),
('24320101', 'Jesus', 'Montecino', 1, '04120524816', '', '', '', '', '', '', '', '', 212),
('18929330', 'George', 'Giacalore', 1, '04128307804', '', '', '', '', '', '', '', '', 213),
('12527184', 'Leonardo', 'Riera', 1, '', '', '', '', '', '', '', '', '', 214),
('16739893', 'Ivonne', 'Mendoza', 0, '04168691876', '', '', '', '', '', '', '', '', 215),
('24020853', 'Jorge', 'Alvarez', 1, '04127737401', '', '', '', '', '', '', '', '', 216),
('16414521', 'Jimena ', 'Anaya ', 0, '04245767183', '', '', '', '', '', '', '', '', 217),
('15690878', 'Danna ', 'Uribe ', 0, '04149508667', '', '', '', '', '', '', '', '', 218),
('30536921', 'Pascual ', 'Parrillo (menor)', 1, '', '', '', '', '', '', '', '', '', 219),
('29775188', 'Fabiana', 'De Vecchis', 0, '04145224810', '', '', '', '', '', '', '', '', 220),
('32103304', 'Maiiar', 'Yassin', 0, '04245286401', '', '', '', '', '', '', '', '', 221),
('32922579', 'Sofia', 'Tascon', 0, '04245910864', '', '', '', '', '', '', '', '', 222),
('16643882', 'Mirage ', 'Diaz', NULL, '04145001079', '', '', '', '', '', '', '', '', 223),
('16861639', 'Hender ', 'Jaimes', NULL, '04121534226', '', '', '', '', '', '', '', '', 224),
('24020981', 'Angelo', 'Leo', 1, '04265578050', '', '', '', '', '', '', '', '', 225),
('22096864', 'Manuelis', 'Alvarez', 0, '04127615374', '', '', '', '', '', '', '', '', 226),
('30323696', 'Cristina ', 'Mujica', 0, '04245858730', '', '', '', '', '', '', '', '', 227),
('30966609', 'Mariana', 'Rivera', 0, '04245322509', '', '', '', '', '', '', '', '', 228),
('24683582', 'Pascual ', 'Parrillo', 1, '', '', '', '', '', '', '', '', '', 229),
('32849937', 'Diego ', 'Ruiz', 1, '04145459180', '', '', '', '', '', '', '', '', 230),
('25520787', 'Sonia ', 'Delgado ', 0, '04125179206', '', '', '', '', '', '', '', '', 231),
('24019905', 'Maria', 'Osta', 0, '041252263048', '', '', '', '', '', '', '', '', 232),
('14177694', 'Adrian', 'Barrios', 1, '04143558847', '', '', '', '', '', '', '', '', 233),
('21394232', 'Jose ', 'Mazzei', 1, '04166140606', '', '', '', '', '', '', '', '', 234),
('27898327', 'Oriana', 'Daza', 0, '04244999112', '', '', '', '', '', '', '', '', 235),
('23577226', 'Maria Jose', 'Perez', 0, '04141570790', '', '', '', '', '', '', '', '', 236),
('31710792', 'Carlos Luis', 'Gomez', 0, '04245869090', '', '', '', '', '', '', '', '', 237),
('16414986', 'Alhidys', 'Duin', 0, '', '', '', '', '', '', '', '', '', 238),
('24813040', 'Daniela', 'Sequera', 0, '04145225628', '', '', '', '', '', '', '', '', 239),
('2025279', 'Luis ', 'Bastidas', 0, '04245102461', '', '', '', '', '', '', '', '', 240),
('20640935', 'Carmary', 'Pelayo', 0, '04149560385', '', '', '', '', '', '', '', '', 241),
('31427597', 'Adriana', 'Barrios', 1, '04145757027', '', '', '', '', '', '', '', '', 242),
('17945753', 'Maria Jose', 'Hernandez', 0, '04245560653', '', '', '', '', '', '', '', '', 243),
('6866226', 'Amira', 'Matson', 0, '04142542277', '', '', '', '', '', '', '', '', 244),
('84495322', 'Samuel', 'Farachi', 1, '04245306295', '', '', '', '', '', '', '', '', 245),
('16872624', 'Mary', 'Briceño', 0, '04245568717', '', '', '', '', '', '', '', '', 246),
('27132600', 'Estefany', 'Russa', 0, '04145300910', '', '', '', '', '', '', '', '', 247),
('11082884', 'Fernanda', 'Perozo', 1, '04145237616', '', '', '', '', '', '', '', '', 248),
('19171615', 'Maria Alexandra', 'Ñeri', 0, '04245765638', '', '', '', '', '', '', '', '', 249),
('32387050', 'Adrian Francisco', 'Barrios ', 1, '04143534995', '', '', '', '', '', '', '', '', 250),
('28106694', 'Maria Gabriela', 'Arias ', 0, '04125276457', '', '', '', '', '', '', '', '', 251),
('21058776', 'Reynaldo', 'Villegas ', 1, '04149515299', '', '', '', '', '', '', '', '', 252),
('17277952', 'Robert ', 'Diaz', 1, '04125355399', '', '', '', '', '', '', '', '', 253),
('17945910', 'Yormary ', 'Valera', 0, '04140719691', '', '', '', '', '', '', '', '', 254),
('22104634', 'Miguel Angel', 'Rodriguez', 1, '04245682066', '', '', '', '', '', '', '', '', 255),
('17944240', 'Rafael', 'Bello', 1, '', '', '', '', '', '', '', '', '', 256),
('16292114', 'Ana Graciela', 'Monsalve ', 0, '', '', '', '', '', '', '', '', '', 257),
('16416892', 'Meriangel ', 'Barreto', 0, '', '', '', '', '', '', '', '', '', 258),
('23033853', 'Yassmin ', 'El Fakih ', 0, '04245521542', '', '', '', '', '', '', '', '', 259),
('16860266', 'Isi', 'Quiñones', 0, '', '', '', '', '', '', '', '', '', 260),
('17795572', 'Camila', 'Lopez', 0, '04143238533', '', '', '', '', '', '', '', '', 261),
('32511829', 'Alessandra ', 'Alzuru', 0, '', '', '', '', '', '', '', '', '', 262),
('9540097', 'Venus', 'Viera', 0, '', '', '', '', '', '', '', '', '', 263),
('10136268', 'Alessandra', 'Rodriguez', 0, '04145579768', '', '', '', '', '', '', '', '', 264),
('31164454', 'Laila', 'Abo Chdid', 0, '04245547536', '', '', '', '', '', '', '', '', 265),
('31164454-1', 'Randa', 'Abo Chdid', 0, '04245547536', '', '', '', '', '', '', '', '', 266),
('31914753', 'Amin', 'Hatem', 1, '04145576130', '', '', '', '', '', '', '', '', 267),
('26856520', 'Maria', 'Silva', 0, '04262556610', '', '', '', '', '', '', '', '', 268),
('19172904', 'Mia', 'Sulbaran', 0, '04265506354', '', '', '', '', '', '', '', '', 269),
('30236190', 'Paolo', 'Parrillo', 0, '04145016650', '', '', '', '', '', '', '', '', 270),
('13486232', 'Jose Angel', 'Rivas', 1, '04144815878', '', '', '', '', '', '', '', '', 271),
('30177479', 'Ferle ', 'Ortega', 0, '04121542254', '', '', '', '', '', '', '', '', 272),
('106136315', 'Hernan', 'Escalona', 1, '04145645532', '', '', '', '', '', '', '', '', 273),
('1034314764', 'Jonathan ', 'Perozp', 1, '04149565739', '', '', '', '', '', '', '', '', 274),
('20024762', 'Pablo', 'Moncada', 1, '', '', '', '', '', '', '', '', '', 275);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_permissions`
--

DROP TABLE IF EXISTS `ospos_permissions`;
CREATE TABLE `ospos_permissions` (
  `permission_id` varchar(255) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  `location_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_permissions`
--

INSERT INTO `ospos_permissions` (`permission_id`, `module_id`, `location_id`) VALUES
('access_control', 'access_control', NULL),
('attributes', 'attributes', NULL),
('cashups', 'cashups', NULL),
('config', 'config', NULL),
('customers', 'customers', NULL),
('employees', 'employees', NULL),
('expenses', 'expenses', NULL),
('expenses_categories', 'expenses_categories', NULL),
('giftcards', 'giftcards', NULL),
('home', 'home', NULL),
('items', 'items', NULL),
('items_stock', 'items', 1),
('item_kits', 'item_kits', NULL),
('messages', 'messages', NULL),
('office', 'office', NULL),
('price_conversions', 'price_conversions', NULL),
('receivings', 'receivings', NULL),
('receivings_stock', 'receivings', 1),
('reports', 'reports', NULL),
('reports_access_customers', 'reports', NULL),
('reports_categories', 'reports', NULL),
('reports_customers', 'reports', NULL),
('reports_discounts', 'reports', NULL),
('reports_employees', 'reports', NULL),
('reports_expenses_categories', 'reports', NULL),
('reports_fiscalprinters', 'reports', NULL),
('reports_inventory', 'reports', NULL),
('reports_items', 'reports', NULL),
('reports_payments', 'reports', NULL),
('reports_receivings', 'reports', NULL),
('reports_sales', 'reports', NULL),
('reports_sales_taxes', 'reports', NULL),
('reports_suppliers', 'reports', NULL),
('reports_taxes', 'reports', NULL),
('sales', 'sales', NULL),
('sales_delete', 'sales', NULL),
('sales_stock', 'sales', 1),
('suppliers', 'suppliers', NULL),
('taxes', 'taxes', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_price_conversions`
--

DROP TABLE IF EXISTS `ospos_price_conversions`;
CREATE TABLE `ospos_price_conversions` (
  `price_id` int(10) NOT NULL,
  `valid_from` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `currency_code` char(3) NOT NULL DEFAULT 'VES',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_price_conversions`
--

INSERT INTO `ospos_price_conversions` (`price_id`, `valid_from`, `price`, `currency_code`, `deleted`) VALUES
(1, '2019-07-11 13:30:58', '8100.00', 'VEF', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_receivings`
--

DROP TABLE IF EXISTS `ospos_receivings`;
CREATE TABLE `ospos_receivings` (
  `receiving_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text,
  `receiving_id` int(10) NOT NULL,
  `payment_type` varchar(20) DEFAULT NULL,
  `reference` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_receivings_items`
--

DROP TABLE IF EXISTS `ospos_receivings_items`;
CREATE TABLE `ospos_receivings_items` (
  `receiving_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL,
  `quantity_purchased` decimal(15,3) NOT NULL DEFAULT '0.000',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `discount_type` tinyint(2) NOT NULL DEFAULT '0',
  `item_location` int(11) NOT NULL,
  `receiving_quantity` decimal(15,3) NOT NULL DEFAULT '1.000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_sales`
--

DROP TABLE IF EXISTS `ospos_sales`;
CREATE TABLE `ospos_sales` (
  `sale_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text,
  `invoice_number` varchar(32) DEFAULT NULL,
  `quote_number` varchar(32) DEFAULT NULL,
  `sale_id` int(10) NOT NULL,
  `sale_status` tinyint(2) NOT NULL DEFAULT '0',
  `dinner_table_id` int(11) DEFAULT NULL,
  `work_order_number` varchar(32) DEFAULT NULL,
  `sale_type` tinyint(2) NOT NULL DEFAULT '0',
  `sale_fiscalprinter_status` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_sales`
--

INSERT INTO `ospos_sales` (`sale_time`, `customer_id`, `employee_id`, `comment`, `invoice_number`, `quote_number`, `sale_id`, `sale_status`, `dinner_table_id`, `work_order_number`, `sale_type`, `sale_fiscalprinter_status`) VALUES
('2019-07-02 15:09:54', 2, 1, '', NULL, NULL, 1, 0, NULL, NULL, 0, NULL),
('2019-07-02 18:55:36', 3, 1, '', NULL, NULL, 2, 0, NULL, NULL, 0, NULL),
('2019-07-02 19:24:12', 6, 5, '', NULL, NULL, 3, 0, NULL, NULL, 0, NULL),
('2019-07-02 19:26:36', 7, 5, '', NULL, NULL, 4, 0, NULL, NULL, 0, NULL),
('2019-07-02 19:28:22', 8, 5, '', NULL, NULL, 5, 0, NULL, NULL, 0, NULL),
('2019-07-02 20:08:30', 2, 5, 'ABONO 80.00', NULL, NULL, 6, 0, NULL, NULL, 0, NULL),
('2019-07-11 15:50:46', 2, 1, '', NULL, NULL, 7, 0, NULL, NULL, 0, NULL),
('2019-07-11 16:12:21', 9, 1, '', NULL, NULL, 8, 0, NULL, NULL, 0, NULL),
('2019-07-11 16:13:47', 9, 1, '', NULL, NULL, 9, 0, NULL, NULL, 0, NULL),
('2019-07-11 16:37:29', 2, 11, '', NULL, NULL, 10, 2, NULL, NULL, 0, NULL),
('2019-07-11 17:22:53', NULL, 11, '', NULL, NULL, 11, 0, NULL, NULL, 0, NULL),
('2019-07-11 17:29:06', 10, 11, '', NULL, NULL, 12, 0, NULL, NULL, 0, NULL),
('2019-07-12 15:24:27', 13, 11, '', NULL, NULL, 13, 0, NULL, NULL, 0, NULL),
('2019-07-12 15:26:02', 10, 11, '', NULL, NULL, 14, 2, NULL, NULL, 0, NULL),
('2019-07-12 20:49:33', 16, 11, '', NULL, NULL, 15, 0, NULL, NULL, 0, NULL),
('2019-07-31 16:10:54', 261, 12, '', NULL, NULL, 16, 0, NULL, NULL, 0, NULL),
('2019-07-31 16:18:50', 13, 5, '', NULL, NULL, 17, 0, NULL, NULL, 0, NULL),
('2019-07-31 17:04:07', 13, 5, '', NULL, NULL, 18, 0, NULL, NULL, 0, NULL),
('2019-07-31 17:06:24', 10, 5, '', NULL, NULL, 19, 0, NULL, NULL, 0, NULL),
('2019-07-31 17:13:11', 10, 5, '', NULL, NULL, 20, 0, NULL, NULL, 0, NULL),
('2019-07-31 21:03:32', 13, 1, '', NULL, NULL, 21, 0, NULL, NULL, 0, NULL),
('2019-07-31 21:10:21', 10, 1, '', NULL, NULL, 22, 0, NULL, NULL, 0, NULL),
('2019-07-31 21:13:01', 10, 1, '', NULL, NULL, 23, 0, NULL, NULL, 0, NULL),
('2019-07-31 22:50:05', 136, 11, '', NULL, NULL, 24, 0, NULL, NULL, 0, NULL),
('2019-07-31 23:50:02', 275, 5, '', NULL, NULL, 25, 2, NULL, NULL, 0, NULL),
('2019-07-31 23:54:14', 275, 5, '', NULL, NULL, 26, 2, NULL, NULL, 0, NULL),
('2019-07-31 23:57:02', 275, 5, '', NULL, NULL, 27, 2, NULL, NULL, 0, NULL),
('2019-07-31 23:58:52', 275, 5, '', NULL, NULL, 28, 2, NULL, NULL, 0, NULL),
('2019-08-01 00:03:41', 275, 5, '', NULL, NULL, 29, 0, NULL, NULL, 0, NULL),
('2019-08-01 00:23:12', 274, 5, '', NULL, NULL, 30, 0, NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_sales_items`
--

DROP TABLE IF EXISTS `ospos_sales_items`;
CREATE TABLE `ospos_sales_items` (
  `sale_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `quantity_purchased` decimal(15,3) NOT NULL DEFAULT '0.000',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `discount_type` tinyint(2) NOT NULL DEFAULT '0',
  `item_location` int(11) NOT NULL,
  `print_option` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_sales_items`
--

INSERT INTO `ospos_sales_items` (`sale_id`, `item_id`, `description`, `serialnumber`, `line`, `quantity_purchased`, `item_cost_price`, `item_unit_price`, `discount`, `discount_type`, `item_location`, `print_option`) VALUES
(1, 1, '', '', 1, '1.000', '0.00', '120000.00', '0.00', 0, 1, 0),
(2, 1, '', '', 1, '1.000', '0.00', '120000.00', '0.00', 0, 1, 0),
(3, 2, '', '', 1, '1.000', '0.00', '80000.00', '0.00', 0, 1, 0),
(4, 2, '', '', 1, '1.000', '0.00', '80000.00', '0.00', 0, 1, 0),
(5, 2, '', '', 1, '1.000', '0.00', '80000.00', '0.00', 0, 1, 0),
(5, 3, '', '', 2, '1.000', '0.00', '8000.00', '0.00', 0, 1, 0),
(6, 1, '', '', 1, '1.000', '0.00', '120000.00', '0.00', 0, 1, 0),
(7, 1, '', '', 1, '1.000', '0.00', '121500.00', '0.00', 0, 1, 0),
(8, 2, '', '', 1, '1.000', '0.00', '10.00', '0.00', 0, 1, 0),
(9, 2, '', '', 1, '1.000', '0.00', '80000.00', '0.00', 0, 1, 0),
(10, 4, '', '', 1, '1.000', '70000.00', '140000.00', '0.00', 0, 1, 0),
(11, 11, '', '', 1, '1.000', '0.00', '0.00', '0.00', 0, 1, 0),
(12, 9, '', '', 1, '1.000', '0.00', '0.00', '0.00', 0, 1, 0),
(13, 2, '', '', 1, '1.000', '0.00', '80000.00', '0.00', 0, 1, 0),
(14, 43, '', '', 1, '1.000', '0.00', '0.00', '0.00', 0, 1, 0),
(15, 61, '', '', 1, '1.000', '0.00', '60000.00', '0.00', 0, 1, 0),
(16, 61, '', '', 1, '1.000', '0.00', '60000.00', '0.00', 0, 1, 0),
(17, 2, '', '', 1, '1.000', '0.00', '80000.00', '0.00', 0, 1, 0),
(18, 1, '', '', 1, '1.000', '0.00', '120000.00', '0.00', 0, 1, 0),
(19, 1, '', '', 1, '1.000', '0.00', '120000.00', '0.00', 0, 1, 0),
(20, 2, '', '', 1, '1.000', '0.00', '80000.00', '0.00', 0, 1, 0),
(21, 1, '', '', 1, '1.000', '0.00', '120000.00', '0.00', 0, 1, 0),
(22, 85, '', '', 1, '1.000', '0.00', '12000.00', '0.00', 0, 1, 0),
(23, 85, '', '', 1, '1.000', '0.00', '12000.00', '0.00', 0, 1, 0),
(24, 2, '', '', 1, '1.000', '0.00', '80000.00', '0.00', 0, 1, 0),
(25, 2, '', '', 1, '1.000', '0.00', '80000.00', '0.00', 0, 1, 0),
(26, 2, '', '', 1, '1.000', '0.00', '80000.00', '0.00', 0, 1, 0),
(27, 2, '', '', 1, '1.000', '0.00', '80000.00', '0.00', 0, 1, 0),
(28, 2, '', '', 1, '1.000', '0.00', '80000.00', '0.00', 0, 1, 0),
(29, 2, '', '', 1, '1.000', '0.00', '80000.00', '0.00', 0, 1, 0),
(30, 2, '', '', 1, '1.000', '0.00', '80000.00', '0.00', 0, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_sales_items_taxes`
--

DROP TABLE IF EXISTS `ospos_sales_items_taxes`;
CREATE TABLE `ospos_sales_items_taxes` (
  `sale_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax_type` tinyint(2) NOT NULL DEFAULT '0',
  `rounding_code` tinyint(2) NOT NULL DEFAULT '0',
  `cascade_sequence` tinyint(2) NOT NULL DEFAULT '0',
  `item_tax_amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sales_tax_code_id` int(11) DEFAULT NULL,
  `jurisdiction_id` int(11) DEFAULT NULL,
  `tax_category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_sales_items_taxes`
--

INSERT INTO `ospos_sales_items_taxes` (`sale_id`, `item_id`, `line`, `name`, `percent`, `tax_type`, `rounding_code`, `cascade_sequence`, `item_tax_amount`, `sales_tax_code_id`, `jurisdiction_id`, `tax_category_id`) VALUES
(1, 1, 1, 'IVA 16', '16.0000', 1, 1, 0, '19200.0000', NULL, NULL, NULL),
(2, 1, 1, 'IVA 16', '16.0000', 0, 1, 0, '16551.7200', NULL, NULL, NULL),
(3, 2, 1, 'IVA 16%', '16.0000', 0, 1, 0, '11034.4800', NULL, NULL, NULL),
(4, 2, 1, 'IVA 16%', '16.0000', 0, 1, 0, '11034.4800', NULL, NULL, NULL),
(5, 2, 1, 'IVA 16%', '16.0000', 0, 1, 0, '11034.4800', NULL, NULL, NULL),
(5, 3, 2, 'IVA 16%', '16.0000', 0, 1, 0, '1103.4500', NULL, NULL, NULL),
(6, 1, 1, 'IVA 16', '16.0000', 0, 1, 0, '16551.7200', NULL, NULL, NULL),
(7, 1, 1, 'IVA 16', '16.0000', 0, 1, 0, '16758.6200', NULL, NULL, NULL),
(8, 2, 1, 'IVA 16%', '16.0000', 0, 1, 0, '1.3800', NULL, NULL, NULL),
(9, 2, 1, 'IVA 16%', '16.0000', 0, 1, 0, '11034.4800', NULL, NULL, NULL),
(11, 11, 1, 'IVA 16%', '16.0000', 0, 1, 0, '0.0000', NULL, NULL, NULL),
(12, 9, 1, 'IVA 16%', '16.0000', 0, 1, 0, '0.0000', NULL, NULL, NULL),
(13, 2, 1, 'IVA 16%', '16.0000', 0, 1, 0, '11034.4800', NULL, NULL, NULL),
(15, 61, 1, 'IVA 16%', '16.0000', 0, 1, 0, '8275.8600', NULL, NULL, NULL),
(16, 61, 1, 'IVA 16%', '16.0000', 0, 1, 0, '8275.8600', NULL, NULL, NULL),
(17, 2, 1, 'IVA 16%', '16.0000', 0, 1, 0, '11034.4800', NULL, NULL, NULL),
(18, 1, 1, 'IVA 16', '16.0000', 0, 1, 0, '16551.7200', NULL, NULL, NULL),
(19, 1, 1, 'IVA 16', '16.0000', 0, 1, 0, '16551.7200', NULL, NULL, NULL),
(20, 2, 1, 'IVA 16%', '16.0000', 0, 1, 0, '11034.4800', NULL, NULL, NULL),
(21, 1, 1, 'IVA 16', '16.0000', 0, 1, 0, '16551.7200', NULL, NULL, NULL),
(22, 85, 1, 'IVA 16%', '16.0000', 0, 1, 0, '1655.1700', NULL, NULL, NULL),
(23, 85, 1, 'IVA 16%', '16.0000', 0, 1, 0, '1655.1700', NULL, NULL, NULL),
(24, 2, 1, 'IVA 16%', '16.0000', 0, 1, 0, '11034.4800', NULL, NULL, NULL),
(25, 2, 1, 'IVA 16%', '16.0000', 0, 1, 0, '11034.4800', NULL, NULL, NULL),
(26, 2, 1, 'IVA 16%', '16.0000', 0, 1, 0, '11034.4800', NULL, NULL, NULL),
(27, 2, 1, 'IVA 16%', '16.0000', 0, 1, 0, '11034.4800', NULL, NULL, NULL),
(28, 2, 1, 'IVA 16%', '16.0000', 0, 1, 0, '11034.4800', NULL, NULL, NULL),
(29, 2, 1, 'IVA 16%', '16.0000', 0, 1, 0, '11034.4800', NULL, NULL, NULL),
(30, 2, 1, 'IVA 16%', '16.0000', 0, 1, 0, '11034.4800', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_sales_payments`
--

DROP TABLE IF EXISTS `ospos_sales_payments`;
CREATE TABLE `ospos_sales_payments` (
  `payment_id` int(11) NOT NULL,
  `sale_id` int(10) NOT NULL,
  `payment_type` varchar(40) NOT NULL,
  `payment_amount` decimal(15,2) NOT NULL,
  `cash_refund` decimal(15,2) NOT NULL DEFAULT '0.00',
  `employee_id` int(11) DEFAULT NULL,
  `payment_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_code` varchar(40) NOT NULL DEFAULT '',
  `bankname` varchar(255) DEFAULT NULL,
  `bankreceptor` varchar(255) DEFAULT NULL,
  `referenceno` varchar(100) DEFAULT NULL,
  `transfer_status` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_sales_payments`
--

INSERT INTO `ospos_sales_payments` (`payment_id`, `sale_id`, `payment_type`, `payment_amount`, `cash_refund`, `employee_id`, `payment_time`, `reference_code`, `bankname`, `bankreceptor`, `referenceno`, `transfer_status`) VALUES
(1, 1, 'Tarjeta de Débito', '139200.00', '0.00', 1, '2019-07-02 15:09:54', '', NULL, NULL, NULL, 0),
(2, 2, 'Tarjeta de Débito', '120000.00', '0.00', 1, '2019-07-02 18:55:36', '', NULL, NULL, NULL, 0),
(3, 3, 'Tarjeta de Débito', '80000.00', '0.00', 5, '2019-07-02 19:24:12', '', NULL, NULL, NULL, 0),
(4, 4, 'Tarjeta de Débito', '80000.00', '0.00', 5, '2019-07-02 19:26:36', '', NULL, NULL, NULL, 0),
(5, 5, 'Tarjeta de Débito', '88000.00', '0.00', 5, '2019-07-02 19:28:22', '', NULL, NULL, NULL, 0),
(7, 6, 'Deudado', '120000.00', '0.00', 5, '2019-07-02 20:08:30', '', NULL, NULL, NULL, 0),
(8, 7, 'Transferencia', '121500.00', '0.00', 1, '2019-07-11 15:50:46', '', 'Mercantil', NULL, '123456', 0),
(9, 8, 'Transferencia', '10.00', '0.00', 1, '2019-07-11 16:12:21', '', 'Mercantil', NULL, '123456', 0),
(10, 9, 'Transferencia', '80000.00', '0.00', 1, '2019-07-11 16:13:47', '', 'Mercantil', NULL, '123456', 0),
(11, 13, 'Transferencia', '80000.00', '0.00', 11, '2019-07-12 15:24:27', '', 'Mercantil', NULL, '123456|', 0),
(13, 15, 'Transferencia', '60000.00', '0.00', 11, '2019-07-12 20:49:33', '', '0', NULL, '0', NULL),
(14, 16, 'Transferencia', '60000.00', '0.00', 12, '2019-07-31 16:10:54', '', 'Banesco', NULL, '96153710572', 0),
(15, 17, 'Transferencia', '80000.00', '0.00', 5, '2019-07-31 16:18:50', '', 'Mercantil', NULL, '252525', 1),
(16, 18, 'Transferencia', '120000.00', '0.00', 5, '2019-07-31 17:04:07', '', 'Mercantil', NULL, '96153710572', 1),
(17, 19, 'Transferencia', '120000.00', '0.00', 5, '2019-07-31 17:06:24', '', 'Banesco', NULL, '636363', 0),
(18, 20, 'Tarjeta de Regalo:636363', '80000.00', '0.00', 5, '2019-07-31 17:13:11', '', '0', NULL, '0', NULL),
(19, 21, 'Transferencia', '80000.00', '0.00', 1, '2019-07-31 21:03:32', '', 'Mercantil', NULL, '123456', 1),
(20, 21, 'Transferencia', '40000.00', '0.00', 1, '2019-07-31 21:03:32', '', 'Mercantil', NULL, '25252525', 1),
(21, 22, 'Pago Móvil', '12000.00', '0.00', 1, '2019-07-31 21:10:21', '', 'Banesco', NULL, '123456', 0),
(22, 23, 'Transferencia', '12000.00', '0.00', 1, '2019-07-31 21:13:01', '', 'Banesco', NULL, '364548', 2),
(23, 24, 'Transferencia', '300000.00', '0.00', 11, '2019-07-31 22:50:05', '', 'BOD', NULL, '11378688206', 0),
(24, 24, 'Efectivo', '0.00', '220000.00', 11, '2019-07-31 22:50:05', '', NULL, NULL, NULL, NULL),
(25, 25, 'Efectivo', '80000.00', '0.00', 5, '2019-07-31 23:50:02', '', '', NULL, '', NULL),
(26, 26, 'Efectivo', '80000.00', '0.00', 5, '2019-07-31 23:54:14', '', '', NULL, '', NULL),
(27, 27, 'Efectivo', '80000.00', '0.00', 5, '2019-07-31 23:57:02', '', '', NULL, '', NULL),
(28, 28, 'Efectivo', '80000.00', '0.00', 5, '2019-07-31 23:58:52', '', '', NULL, '', NULL),
(29, 29, 'Efectivo', '80000.00', '0.00', 5, '2019-08-01 00:03:41', '', '', NULL, '', NULL),
(30, 30, 'Pago Móvil', '80000.00', '0.00', 5, '2019-08-01 00:23:12', '', 'Banesco', 'Banesco', '1034314764', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_sales_reward_points`
--

DROP TABLE IF EXISTS `ospos_sales_reward_points`;
CREATE TABLE `ospos_sales_reward_points` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `earned` float NOT NULL,
  `used` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_sales_taxes`
--

DROP TABLE IF EXISTS `ospos_sales_taxes`;
CREATE TABLE `ospos_sales_taxes` (
  `sales_taxes_id` int(11) NOT NULL,
  `sale_id` int(10) NOT NULL,
  `jurisdiction_id` int(11) DEFAULT NULL,
  `tax_category_id` int(11) DEFAULT NULL,
  `tax_type` smallint(2) NOT NULL,
  `tax_group` varchar(32) NOT NULL,
  `sale_tax_basis` decimal(15,4) NOT NULL,
  `sale_tax_amount` decimal(15,4) NOT NULL,
  `print_sequence` tinyint(2) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `tax_rate` decimal(15,4) NOT NULL,
  `sales_tax_code_id` int(11) DEFAULT NULL,
  `rounding_code` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_sales_taxes`
--

INSERT INTO `ospos_sales_taxes` (`sales_taxes_id`, `sale_id`, `jurisdiction_id`, `tax_category_id`, `tax_type`, `tax_group`, `sale_tax_basis`, `sale_tax_amount`, `print_sequence`, `name`, `tax_rate`, `sales_tax_code_id`, `rounding_code`) VALUES
(1, 1, NULL, NULL, 1, 'IVA 16', '120000.0000', '19200.0000', 1, 'IVA 16', '16.0000', NULL, 1),
(2, 2, NULL, NULL, 0, 'IVA 16', '120000.0000', '16551.7200', 1, 'IVA 16', '16.0000', NULL, 1),
(3, 3, NULL, NULL, 0, 'IVA 16%', '80000.0000', '11034.4800', 1, 'IVA 16%', '16.0000', NULL, 1),
(4, 4, NULL, NULL, 0, 'IVA 16%', '80000.0000', '11034.4800', 1, 'IVA 16%', '16.0000', NULL, 1),
(5, 5, NULL, NULL, 0, 'IVA 16%', '88000.0000', '12137.9300', 1, 'IVA 16%', '16.0000', NULL, 1),
(6, 6, NULL, NULL, 0, 'IVA 16', '120000.0000', '16551.7200', 1, 'IVA 16', '16.0000', NULL, 1),
(7, 7, NULL, NULL, 0, 'IVA 16', '121500.0000', '16758.6200', 1, 'IVA 16', '16.0000', NULL, 1),
(8, 8, NULL, NULL, 0, 'IVA 16%', '10.0000', '1.3800', 1, 'IVA 16%', '16.0000', NULL, 1),
(9, 9, NULL, NULL, 0, 'IVA 16%', '80000.0000', '11034.4800', 1, 'IVA 16%', '16.0000', NULL, 1),
(10, 13, NULL, NULL, 0, 'IVA 16%', '80000.0000', '11034.4800', 1, 'IVA 16%', '16.0000', NULL, 1),
(11, 15, NULL, NULL, 0, 'IVA 16%', '60000.0000', '8275.8600', 1, 'IVA 16%', '16.0000', NULL, 1),
(12, 16, NULL, NULL, 0, 'IVA 16%', '60000.0000', '8275.8600', 1, 'IVA 16%', '16.0000', NULL, 1),
(13, 17, NULL, NULL, 0, 'IVA 16%', '80000.0000', '11034.4800', 1, 'IVA 16%', '16.0000', NULL, 1),
(14, 18, NULL, NULL, 0, 'IVA 16', '120000.0000', '16551.7200', 1, 'IVA 16', '16.0000', NULL, 1),
(15, 19, NULL, NULL, 0, 'IVA 16', '120000.0000', '16551.7200', 1, 'IVA 16', '16.0000', NULL, 1),
(16, 20, NULL, NULL, 0, 'IVA 16%', '80000.0000', '11034.4800', 1, 'IVA 16%', '16.0000', NULL, 1),
(17, 21, NULL, NULL, 0, 'IVA 16', '120000.0000', '16551.7200', 1, 'IVA 16', '16.0000', NULL, 1),
(18, 22, NULL, NULL, 0, 'IVA 16%', '12000.0000', '1655.1700', 1, 'IVA 16%', '16.0000', NULL, 1),
(19, 23, NULL, NULL, 0, 'IVA 16%', '12000.0000', '1655.1700', 1, 'IVA 16%', '16.0000', NULL, 1),
(20, 24, NULL, NULL, 0, 'IVA 16%', '80000.0000', '11034.4800', 1, 'IVA 16%', '16.0000', NULL, 1),
(21, 25, NULL, NULL, 0, 'IVA 16%', '80000.0000', '11034.4800', 1, 'IVA 16%', '16.0000', NULL, 1),
(22, 26, NULL, NULL, 0, 'IVA 16%', '80000.0000', '11034.4800', 1, 'IVA 16%', '16.0000', NULL, 1),
(23, 27, NULL, NULL, 0, 'IVA 16%', '80000.0000', '11034.4800', 1, 'IVA 16%', '16.0000', NULL, 1),
(24, 28, NULL, NULL, 0, 'IVA 16%', '80000.0000', '11034.4800', 1, 'IVA 16%', '16.0000', NULL, 1),
(25, 29, NULL, NULL, 0, 'IVA 16%', '80000.0000', '11034.4800', 1, 'IVA 16%', '16.0000', NULL, 1),
(26, 30, NULL, NULL, 0, 'IVA 16%', '80000.0000', '11034.4800', 1, 'IVA 16%', '16.0000', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_sessions`
--

DROP TABLE IF EXISTS `ospos_sessions`;
CREATE TABLE `ospos_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_sessions`
--

INSERT INTO `ospos_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('pbmgjsoh0fh7s67l2u5s0v57723jqgl5', '::1', 1564517479, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343531373437393b706572736f6e5f69647c733a323a223131223b6d656e755f67726f75707c733a343a22686f6d65223b),
('k8fa32p81gbp7cp4a6f6pn91v69i1vm0', '::1', 1564518527, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343531383532373b),
('jeu0b5at0md4vea91n45hnkcldr5e7fp', '::1', 1564529757, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343532393735373b706572736f6e5f69647c733a323a223131223b6d656e755f67726f75707c733a343a22686f6d65223b),
('vjur29l92njlahna1t6kcj2f8q2cq6kv', '::1', 1564519224, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343531393232333b706572736f6e5f69647c733a323a223131223b6d656e755f67726f75707c733a343a22686f6d65223b),
('271lrn5csq53i2ie7ito2r0ughqvc094', '::1', 1564520060, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343532303035393b706572736f6e5f69647c733a323a223131223b6d656e755f67726f75707c733a343a22686f6d65223b),
('nako47cl8pme9mqkur045220002ltuj4', '::1', 1564530645, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343533303634353b706572736f6e5f69647c733a323a223131223b6d656e755f67726f75707c733a343a22686f6d65223b),
('6s5680f6e4ak4jlsmigr5c31dhahh2bc', '::1', 1564531923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343533313932333b706572736f6e5f69647c733a323a223131223b6d656e755f67726f75707c733a343a22686f6d65223b),
('i4fntd10l8dalebohkvivc9fttpl9eec', '::1', 1564531924, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343533313932343b),
('fgvos45983n9qr7d82fds8409gq93qbe', '::1', 1564570369, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343537303336393b706572736f6e5f69647c733a323a223132223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f636172747c613a303a7b7d73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d636173685f6d6f64657c693a303b636173685f726f756e64696e677c693a303b73616c65735f637573746f6d65727c693a2d313b73616c65735f696e766f6963655f6e756d6265727c4e3b),
('u459v9nckoo4bmhq4jhpqrfnhmiif2u9', '::1', 1564570697, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343537303639373b706572736f6e5f69647c733a323a223132223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f636172747c613a303a7b7d73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d636173685f6d6f64657c693a303b636173685f726f756e64696e677c693a303b73616c65735f637573746f6d65727c693a2d313b73616c65735f696e766f6963655f6e756d6265727c4e3b),
('qfgjfi4rh0gbitfp20llm8l5ialgnes9', '::1', 1564571093, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343537313039333b706572736f6e5f69647c733a323a223132223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f636172747c613a303a7b7d73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d636173685f6d6f64657c693a303b636173685f726f756e64696e677c693a303b73616c65735f637573746f6d65727c693a2d313b73616c65735f696e766f6963655f6e756d6265727c4e3b),
('a04lkdaik5gdvj2e6t8libfnojhgj2e5', '::1', 1564574227, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343537343232373b706572736f6e5f69647c733a323a223132223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f636172747c613a303a7b7d73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d636173685f6d6f64657c693a303b636173685f726f756e64696e677c693a303b73616c65735f637573746f6d65727c693a2d313b73616c65735f696e766f6963655f6e756d6265727c4e3b),
('l0fn0oft86rv3fjrnvhmqf71mhag4sna', '::1', 1564572070, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343537323036393b706572736f6e5f69647c733a323a223132223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f636172747c613a303a7b7d73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d636173685f6d6f64657c693a303b636173685f726f756e64696e677c693a303b73616c65735f637573746f6d65727c693a2d313b73616c65735f696e766f6963655f6e756d6265727c4e3b),
('buicasogqvf15s22sgm3fthhpsb1esum', '::1', 1564577319, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343537373331393b706572736f6e5f69647c733a323a223132223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f636172747c613a303a7b7d73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d636173685f6d6f64657c693a303b636173685f726f756e64696e677c693a303b73616c65735f637573746f6d65727c693a2d313b73616c65735f696e766f6963655f6e756d6265727c4e3b),
('j9fo3mmsgv1vdabvk3saa4bufrjjf8g0', '::1', 1564578240, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343537383233393b706572736f6e5f69647c733a323a223132223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f636172747c613a303a7b7d73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d636173685f6d6f64657c693a303b636173685f726f756e64696e677c693a303b73616c65735f637573746f6d65727c693a2d313b73616c65735f696e766f6963655f6e756d6265727c4e3b),
('ao1g5tv9hdffnsqdbcrokjque20nvan4', '::1', 1564578728, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343537383732383b706572736f6e5f69647c733a323a223132223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f636172747c613a303a7b7d73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d636173685f6d6f64657c693a303b636173685f726f756e64696e677c693a303b73616c65735f637573746f6d65727c693a2d313b73616c65735f696e766f6963655f6e756d6265727c4e3b),
('gspuigdbchq7harhfl7hq5hhiqch8iuu', '::1', 1564579039, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343537393033393b706572736f6e5f69647c733a323a223132223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f636172747c613a303a7b7d73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d636173685f6d6f64657c693a303b636173685f726f756e64696e677c693a303b73616c65735f637573746f6d65727c693a2d313b73616c65735f696e766f6963655f6e756d6265727c4e3b),
('v7a0upg06ed8ocp5ftrp0gf106o81rp8', '::1', 1564579370, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343537393337303b706572736f6e5f69647c733a323a223132223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f636172747c613a303a7b7d73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d636173685f6d6f64657c693a303b636173685f726f756e64696e677c693a303b73616c65735f637573746f6d65727c693a2d313b73616c65735f696e766f6963655f6e756d6265727c4e3b),
('lflsf5dbughh8n4slsrvn1648h9hce7f', '::1', 1564580093, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343538303039333b706572736f6e5f69647c733a323a223132223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f636172747c613a303a7b7d73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d636173685f6d6f64657c693a303b636173685f726f756e64696e677c693a303b73616c65735f637573746f6d65727c693a2d313b73616c65735f696e766f6963655f6e756d6265727c4e3b),
('dbq6m7ilnfhbo7gd53484to728ms8ea0', '::1', 1564582956, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343538323935363b706572736f6e5f69647c733a323a223132223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f636172747c613a303a7b7d73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d636173685f6d6f64657c693a303b636173685f726f756e64696e677c693a303b73616c65735f637573746f6d65727c693a2d313b73616c65735f696e766f6963655f6e756d6265727c4e3b),
('1b2jtgjg7tkfag3r620lpo2o1jl3ivoo', '::1', 1564583391, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343538333339313b706572736f6e5f69647c733a323a223132223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f636172747c613a303a7b7d73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d636173685f6d6f64657c693a303b636173685f726f756e64696e677c693a303b73616c65735f637573746f6d65727c693a2d313b73616c65735f696e766f6963655f6e756d6265727c4e3b),
('1ddutakbtheunn68brp5be6r64ajlvl0', '::1', 1564583806, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343538333830363b706572736f6e5f69647c733a323a223132223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f636172747c613a303a7b7d73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d636173685f6d6f64657c693a303b636173685f726f756e64696e677c693a303b73616c65735f637573746f6d65727c693a2d313b73616c65735f696e766f6963655f6e756d6265727c4e3b),
('ah7cni1sqh6t2rm2pn32tnrjc6nv1dpc', '::1', 1564584238, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343538343233383b706572736f6e5f69647c733a313a2235223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a303b6974656d5f6c6f636174696f6e7c733a313a2231223b),
('1uk19a0o3ra13hjkpov2u1m44b4pm758', '::1', 1564584584, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343538343538343b706572736f6e5f69647c733a323a223132223b6d656e755f67726f75707c733a343a22686f6d65223b),
('n7csup274sn5k5r3bc1vh8q5u9hvsi1o', '::1', 1564585307, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343538353330373b706572736f6e5f69647c733a323a223132223b6d656e755f67726f75707c733a343a22686f6d65223b),
('7ul0t5tj978nrgfqdo8qh9f96i1e0s4r', '::1', 1564585773, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343538353737333b706572736f6e5f69647c733a323a223132223b6d656e755f67726f75707c733a343a22686f6d65223b),
('97pt3jmpqn336fvqkumphh98cpetrbgb', '::1', 1564586118, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343538363131383b706572736f6e5f69647c733a323a223132223b6d656e755f67726f75707c733a343a22686f6d65223b),
('qq17svvpqge3hok57j3mfg5a8d2n24ni', '::1', 1564586463, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343538363436333b706572736f6e5f69647c733a323a223132223b6d656e755f67726f75707c733a343a22686f6d65223b),
('hjfb0vc8peoqs6lkou9hcgqa4sm0isn7', '::1', 1564586840, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343538363834303b706572736f6e5f69647c733a323a223132223b6d656e755f67726f75707c733a343a22686f6d65223b),
('ad2e7j89ru2s57a2b59tdj76osm5t798', '::1', 1564587141, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343538373134313b706572736f6e5f69647c733a323a223132223b6d656e755f67726f75707c733a343a22686f6d65223b),
('gnhvf0o0a9qmm3bgom41etnsrekbod6c', '::1', 1564587451, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343538373435313b706572736f6e5f69647c733a323a223132223b6d656e755f67726f75707c733a343a22686f6d65223b),
('7p10t9omvo49qed3ldn9mu1ovj9vrh24', '::1', 1564588597, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343538383539373b706572736f6e5f69647c733a323a223132223b6d656e755f67726f75707c733a343a22686f6d65223b),
('2ct4tqlclb6uqufcqbbe39ni01nproii', '::1', 1564588930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343538383933303b706572736f6e5f69647c733a323a223132223b6d656e755f67726f75707c733a343a22686f6d65223b),
('c0reortrtff6glm76belhlaisdtc5vq7', '::1', 1564589353, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343538393335333b706572736f6e5f69647c733a323a223132223b6d656e755f67726f75707c733a343a22686f6d65223b),
('e7c5a0ehk1fd2rh6m2kusi74r0cs1v5l', '::1', 1564589821, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343538393832313b706572736f6e5f69647c733a313a2235223b6d656e755f67726f75707c733a343a22686f6d65223b73616c65735f6d6f64657c733a343a2273616c65223b),
('f2v65ejk9skajmdnd020nonieniu42ah', '::1', 1564592413, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343539323431333b706572736f6e5f69647c733a313a2235223b6d656e755f67726f75707c733a343a22686f6d65223b73616c65735f6d6f64657c733a343a2273616c65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b),
('5rs3g97m2vvl3pen2rlkmd6ecdslg3ef', '::1', 1564592728, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343539323732363b706572736f6e5f69647c733a313a2235223b6d656e755f67726f75707c733a343a22686f6d65223b73616c65735f6d6f64657c733a343a2273616c65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b),
('f1f4d3pokd3fkod52iu9758s2pivv15b', '::1', 1564593036, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343539333033363b706572736f6e5f69647c733a313a2235223b6d656e755f67726f75707c733a343a22686f6d65223b73616c65735f6d6f64657c733a343a2273616c65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f636172747c613a313a7b693a313b613a32353a7b733a373a226974656d5f6964223b733a313a2232223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a393a2246756e63696f6e616c223b733a31313a226974656d5f6e756d626572223b733a31333a2232303032303030303030303032223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a343a22302e3030223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a383a2238303030302e3030223b733a31303a22636f73745f7072696365223b733a343a22302e3030223b733a353a22746f74616c223b733a383a2238303030302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a31303a2238303030302e30303030223b733a31323a227072696e745f6f7074696f6e223b693a303b733a31303a2273746f636b5f74797065223b733a313a2231223b733a393a226974656d5f74797065223b733a313a2230223b733a383a2268736e5f636f6465223b733a303a22223b733a31353a227461785f63617465676f72795f6964223b733a313a2230223b7d7d73616c65735f637573746f6d65727c733a323a223130223b73616c65735f7061796d656e74737c613a303a7b7d636173685f6d6f64657c693a303b636173685f726f756e64696e677c693a303b73616c65735f696e766f6963655f6e756d6265727c4e3b),
('kli3gasilqb6c57nlkve8nc048so7565', '::1', 1564593383, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343539333338333b706572736f6e5f69647c733a313a2235223b6d656e755f67726f75707c733a343a22686f6d65223b73616c65735f6d6f64657c733a343a2273616c65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b6974656d5f6c6f636174696f6e7c733a313a2231223b),
('2ce9bu1pvr7ro6udvjik6tnt5b3utrtn', '::1', 1564593685, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343539333638353b706572736f6e5f69647c733a313a2235223b6d656e755f67726f75707c733a343a22686f6d65223b73616c65735f6d6f64657c733a343a2273616c65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b6974656d5f6c6f636174696f6e7c733a313a2231223b),
('uj12vo3ph14eennr7gnj6dicespamau4', '::1', 1564594434, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343539343433343b706572736f6e5f69647c733a313a2235223b6d656e755f67726f75707c733a343a22686f6d65223b73616c65735f6d6f64657c733a343a2273616c65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b6974656d5f6c6f636174696f6e7c733a313a2231223b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a303a7b7d636173685f6d6f64657c693a303b636173685f726f756e64696e677c693a303b73616c65735f696e766f6963655f6e756d6265727c4e3b),
('2kefg2drt1tm5mp42qa7n8g1jvr425m0', '192.168.0.118', 1564593985, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343539333938353b),
('spv2do4c70r6jprmpr88u9bjfrb0u2o4', '::1', 1564597328, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343539373332383b706572736f6e5f69647c733a313a2235223b6d656e755f67726f75707c733a343a22686f6d65223b73616c65735f6d6f64657c733a343a2273616c65223b616c6c6f775f74656d705f6974656d737c693a303b73616c655f69647c693a2d313b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b6974656d5f6c6f636174696f6e7c733a313a2231223b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a303a7b7d636173685f6d6f64657c693a303b636173685f726f756e64696e677c693a303b73616c65735f696e766f6963655f6e756d6265727c4e3b),
('tc63heje65ar5vtvtbsob2lmue9okcc5', '::1', 1564597987, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343539373938373b706572736f6e5f69647c733a313a2235223b6d656e755f67726f75707c733a343a22686f6d65223b73616c65735f6d6f64657c733a343a2273616c65223b616c6c6f775f74656d705f6974656d737c693a303b73616c655f69647c693a2d313b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b6974656d5f6c6f636174696f6e7c733a313a2231223b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a303a7b7d636173685f6d6f64657c693a303b636173685f726f756e64696e677c693a303b73616c65735f696e766f6963655f6e756d6265727c4e3b),
('fueslq288l035ldsbhs0or24k3inu52n', '::1', 1564598505, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343539383530353b706572736f6e5f69647c733a323a223131223b6d656e755f67726f75707c733a343a22686f6d65223b),
('ptni8f2929kblcjdpql84b486iffiqm1', '::1', 1564600461, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343630303436313b706572736f6e5f69647c733a323a223131223b6d656e755f67726f75707c733a343a22686f6d65223b),
('r00hp69t5fs9pl88g2n5lsufb5m783rn', '::1', 1564601586, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343630313538363b706572736f6e5f69647c733a323a223131223b6d656e755f67726f75707c733a343a22686f6d65223b),
('f0em5b4f0odfffm5uu4i0flekm6n6smj', '::1', 1564605192, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343630353139323b706572736f6e5f69647c733a323a223131223b6d656e755f67726f75707c733a343a22686f6d65223b),
('temeedm96kubkeqq99ikecn3i5bdgfj8', '::1', 1564605507, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343630353530373b706572736f6e5f69647c733a313a2231223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d636173685f6d6f64657c693a303b636173685f726f756e64696e677c693a303b73616c65735f696e766f6963655f6e756d6265727c4e3b),
('dtol8cl7k9a2qj31no2frn46ikbfcgjn', '::1', 1564606406, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343630363430363b706572736f6e5f69647c733a313a2231223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d636173685f6d6f64657c693a303b636173685f726f756e64696e677c693a303b73616c65735f696e766f6963655f6e756d6265727c4e3b),
('9u35vsloqnavane5kjfs70b4qsh5fv2a', '::1', 1564606712, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343630363731323b706572736f6e5f69647c733a313a2231223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d636173685f6d6f64657c693a303b636173685f726f756e64696e677c693a303b73616c65735f696e766f6963655f6e756d6265727c4e3b),
('6q6pmvvh08l2rn16cn1bq1ogc0s0plko', '::1', 1564607017, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343630373031373b706572736f6e5f69647c733a313a2231223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b),
('r41i2b2p6ppdje8cgup41cm17o065vnh', '::1', 1564607334, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343630373333343b706572736f6e5f69647c733a313a2231223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a303b73616c655f69647c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b6974656d5f6c6f636174696f6e7c733a313a2231223b),
('os64i64c8e7uijsbjnnsml94ofnj1f2i', '::1', 1564607661, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343630373636313b706572736f6e5f69647c733a313a2231223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b6974656d5f6c6f636174696f6e7c733a313a2231223b),
('l30de31mvoa6vres08l4mqthhrdn4ujv', '::1', 1564608136, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343630383133363b706572736f6e5f69647c733a313a2231223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b6974656d5f6c6f636174696f6e7c733a313a2231223b),
('1pkqoaf59audm3hfp6844juptq2va7mc', '::1', 1564608535, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343630383533353b706572736f6e5f69647c733a313a2231223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b6974656d5f6c6f636174696f6e7c733a313a2231223b),
('jci0rh05bod6ta2kn40rcka6t3jh4ams', '::1', 1564608948, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343630383934383b706572736f6e5f69647c733a313a2231223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b6974656d5f6c6f636174696f6e7c733a313a2231223b),
('j1paev6kntb0329d6nvfn7427nvjmhjn', '::1', 1564610183, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343631303138333b706572736f6e5f69647c733a313a2231223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b6974656d5f6c6f636174696f6e7c733a313a2231223b),
('n9ri2atrvovnuvfm0mqeq8r6p3uclo70', '::1', 1564610902, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343631303930323b706572736f6e5f69647c733a313a2231223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b6974656d5f6c6f636174696f6e7c733a313a2231223b),
('2el795orf6a8f4lt74bkvieeo6rdtcnb', '::1', 1564611425, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343631313432353b706572736f6e5f69647c733a323a223131223b6d656e755f67726f75707c733a343a22686f6d65223b),
('te0qrnntjsou7n8s0k85b7l9cbfo6a2c', '::1', 1564612761, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343631323736313b),
('ov1oldheptueoj35hm9boa19rb7c5r62', '::1', 1564613118, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343631333131383b706572736f6e5f69647c733a323a223131223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d636173685f6d6f64657c693a303b636173685f726f756e64696e677c693a303b73616c65735f696e766f6963655f6e756d6265727c4e3b),
('15rbbm1l03h3goolbiqnjjo4eccscvto', '::1', 1564613452, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343631333435323b706572736f6e5f69647c733a323a223131223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b),
('tmc2baeojmf0p95j0953hpbcqv17cl9p', '::1', 1564614040, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343631343034303b),
('hijic9as24j9nk0nutdia9v60coe3q8k', '::1', 1564615533, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343631353533333b706572736f6e5f69647c733a323a223131223b6d656e755f67726f75707c733a343a22686f6d65223b),
('olhfga5gvk22susbptitnkn49kj3fehg', '::1', 1564615854, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343631353835343b706572736f6e5f69647c733a323a223131223b6d656e755f67726f75707c733a343a22686f6d65223b),
('75376tbdonae9it7o3ecv8lqrtri5bkf', '::1', 1564616463, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343631363436333b),
('7pm4rjl993rkoqng5uardl6v3ljvmefl', '::1', 1564616767, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343631363736373b706572736f6e5f69647c733a313a2235223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d636173685f6d6f64657c693a303b636173685f726f756e64696e677c693a303b73616c65735f696e766f6963655f6e756d6265727c4e3b),
('ksb316oi5rj9d90osuo4cme2t6mnlo8o', '::1', 1564617219, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343631373231393b706572736f6e5f69647c733a313a2235223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b),
('lhi2n881h6sf25dbdf343ht1ota5bp01', '::1', 1564617523, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343631373532333b706572736f6e5f69647c733a313a2235223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a303a7b7d636173685f6d6f64657c693a303b636173685f726f756e64696e677c693a303b73616c65735f696e766f6963655f6e756d6265727c4e3b),
('d1n6dh72a5uroauj366lgu71gf1eao33', '::1', 1564617851, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343631373835313b706572736f6e5f69647c733a313a2235223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b),
('1valaabs2ra0chgie7df6gg2h1tj54c3', '::1', 1564618347, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343631383334373b706572736f6e5f69647c733a313a2235223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f636172747c613a313a7b693a313b613a32353a7b733a373a226974656d5f6964223b733a313a2232223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a393a2246756e63696f6e616c223b733a31313a226974656d5f6e756d626572223b733a31333a2232303032303030303030303032223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a343a22302e3030223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a383a2238303030302e3030223b733a31303a22636f73745f7072696365223b733a343a22302e3030223b733a353a22746f74616c223b733a383a2238303030302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a31303a2238303030302e30303030223b733a31323a227072696e745f6f7074696f6e223b693a303b733a31303a2273746f636b5f74797065223b733a313a2231223b733a393a226974656d5f74797065223b733a313a2230223b733a383a2268736e5f636f6465223b733a303a22223b733a31353a227461785f63617465676f72795f6964223b733a313a2230223b7d7d73616c65735f637573746f6d65727c733a333a22323734223b73616c65735f7061796d656e74737c613a303a7b7d636173685f6d6f64657c693a303b636173685f726f756e64696e677c693a303b73616c65735f696e766f6963655f6e756d6265727c4e3b),
('gs72kh8mqd05tuhnuq5pfmmv53a6mh98', '::1', 1564618792, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343631383739323b706572736f6e5f69647c733a313a2235223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f636172747c613a313a7b693a313b613a32353a7b733a373a226974656d5f6964223b733a313a2232223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a393a2246756e63696f6e616c223b733a31313a226974656d5f6e756d626572223b733a31333a2232303032303030303030303032223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a343a22302e3030223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a383a2238303030302e3030223b733a31303a22636f73745f7072696365223b733a343a22302e3030223b733a353a22746f74616c223b733a383a2238303030302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a31303a2238303030302e30303030223b733a31323a227072696e745f6f7074696f6e223b693a303b733a31303a2273746f636b5f74797065223b733a313a2231223b733a393a226974656d5f74797065223b733a313a2230223b733a383a2268736e5f636f6465223b733a303a22223b733a31353a227461785f63617465676f72795f6964223b733a313a2230223b7d7d73616c65735f637573746f6d65727c733a333a22323734223b73616c65735f7061796d656e74737c613a303a7b7d636173685f6d6f64657c693a303b636173685f726f756e64696e677c693a303b73616c65735f696e766f6963655f6e756d6265727c4e3b),
('7m81t417viusuid53nvdcc81mimkcmcg', '::1', 1564619207, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343631393230373b706572736f6e5f69647c733a313a2235223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b),
('nahe8p94jh0m1lbi6a15opo6hag5ljuk', '::1', 1564619715, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343631393731353b706572736f6e5f69647c733a313a2235223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b73616c655f69647c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b),
('5lrv46pu0lkp5efq3a0jhlrta9gprscf', '::1', 1564619764, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343631393736333b);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_stock_locations`
--

DROP TABLE IF EXISTS `ospos_stock_locations`;
CREATE TABLE `ospos_stock_locations` (
  `location_id` int(11) NOT NULL,
  `location_name` varchar(255) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ospos_stock_locations`
--

INSERT INTO `ospos_stock_locations` (`location_id`, `location_name`, `deleted`) VALUES
(1, 'stock', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_suppliers`
--

DROP TABLE IF EXISTS `ospos_suppliers`;
CREATE TABLE `ospos_suppliers` (
  `person_id` int(10) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `agency_name` varchar(255) NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `tax_id` varchar(32) NOT NULL DEFAULT '',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `category` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_tax_categories`
--

DROP TABLE IF EXISTS `ospos_tax_categories`;
CREATE TABLE `ospos_tax_categories` (
  `tax_category_id` int(10) NOT NULL,
  `tax_category` varchar(32) NOT NULL,
  `tax_group_sequence` tinyint(2) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_tax_codes`
--

DROP TABLE IF EXISTS `ospos_tax_codes`;
CREATE TABLE `ospos_tax_codes` (
  `tax_code_id` int(11) NOT NULL,
  `tax_code` varchar(32) NOT NULL,
  `tax_code_name` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(255) NOT NULL DEFAULT '',
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_tax_jurisdictions`
--

DROP TABLE IF EXISTS `ospos_tax_jurisdictions`;
CREATE TABLE `ospos_tax_jurisdictions` (
  `jurisdiction_id` int(11) NOT NULL,
  `jurisdiction_name` varchar(255) DEFAULT NULL,
  `tax_group` varchar(32) NOT NULL,
  `tax_type` smallint(2) NOT NULL,
  `reporting_authority` varchar(255) DEFAULT NULL,
  `tax_group_sequence` tinyint(2) NOT NULL DEFAULT '0',
  `cascade_sequence` tinyint(2) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ospos_tax_rates`
--

DROP TABLE IF EXISTS `ospos_tax_rates`;
CREATE TABLE `ospos_tax_rates` (
  `tax_rate_id` int(11) NOT NULL,
  `rate_tax_code_id` int(11) NOT NULL,
  `rate_tax_category_id` int(10) NOT NULL,
  `rate_jurisdiction_id` int(11) NOT NULL,
  `tax_rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax_rounding_code` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ospos_app_config`
--
ALTER TABLE `ospos_app_config`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `ospos_attribute_definitions`
--
ALTER TABLE `ospos_attribute_definitions`
  ADD PRIMARY KEY (`definition_id`),
  ADD KEY `definition_fk` (`definition_fk`);

--
-- Indices de la tabla `ospos_attribute_links`
--
ALTER TABLE `ospos_attribute_links`
  ADD UNIQUE KEY `attribute_links_uq1` (`attribute_id`,`definition_id`,`item_id`,`sale_id`,`receiving_id`),
  ADD KEY `attribute_id` (`attribute_id`),
  ADD KEY `definition_id` (`definition_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `receiving_id` (`receiving_id`);

--
-- Indices de la tabla `ospos_attribute_values`
--
ALTER TABLE `ospos_attribute_values`
  ADD PRIMARY KEY (`attribute_id`),
  ADD UNIQUE KEY `attribute_value` (`attribute_value`);

--
-- Indices de la tabla `ospos_cash_up`
--
ALTER TABLE `ospos_cash_up`
  ADD PRIMARY KEY (`cashup_id`),
  ADD KEY `open_employee_id` (`open_employee_id`),
  ADD KEY `close_employee_id` (`close_employee_id`);

--
-- Indices de la tabla `ospos_customers`
--
ALTER TABLE `ospos_customers`
  ADD UNIQUE KEY `account_number` (`account_number`),
  ADD KEY `person_id` (`person_id`),
  ADD KEY `package_id` (`package_id`),
  ADD KEY `sales_tax_code_id` (`sales_tax_code_id`),
  ADD KEY `discipline_id` (`discipline_id`);

--
-- Indices de la tabla `ospos_customers_packages`
--
ALTER TABLE `ospos_customers_packages`
  ADD PRIMARY KEY (`package_id`);

--
-- Indices de la tabla `ospos_customers_points`
--
ALTER TABLE `ospos_customers_points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `person_id` (`person_id`),
  ADD KEY `package_id` (`package_id`),
  ADD KEY `sale_id` (`sale_id`);

--
-- Indices de la tabla `ospos_customer_access_control`
--
ALTER TABLE `ospos_customer_access_control`
  ADD PRIMARY KEY (`access_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indices de la tabla `ospos_dinner_tables`
--
ALTER TABLE `ospos_dinner_tables`
  ADD PRIMARY KEY (`dinner_table_id`);

--
-- Indices de la tabla `ospos_employees`
--
ALTER TABLE `ospos_employees`
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `person_id` (`person_id`);

--
-- Indices de la tabla `ospos_expenses`
--
ALTER TABLE `ospos_expenses`
  ADD PRIMARY KEY (`expense_id`),
  ADD KEY `expense_category_id` (`expense_category_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `ospos_expenses_ibfk_3` (`supplier_id`),
  ADD KEY `date` (`date`);

--
-- Indices de la tabla `ospos_expense_categories`
--
ALTER TABLE `ospos_expense_categories`
  ADD PRIMARY KEY (`expense_category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indices de la tabla `ospos_giftcards`
--
ALTER TABLE `ospos_giftcards`
  ADD PRIMARY KEY (`giftcard_id`),
  ADD UNIQUE KEY `giftcard_number` (`giftcard_number`),
  ADD KEY `person_id` (`person_id`);

--
-- Indices de la tabla `ospos_grants`
--
ALTER TABLE `ospos_grants`
  ADD PRIMARY KEY (`permission_id`,`person_id`),
  ADD KEY `ospos_grants_ibfk_2` (`person_id`);

--
-- Indices de la tabla `ospos_inventory`
--
ALTER TABLE `ospos_inventory`
  ADD PRIMARY KEY (`trans_id`),
  ADD KEY `trans_items` (`trans_items`),
  ADD KEY `trans_user` (`trans_user`),
  ADD KEY `trans_location` (`trans_location`),
  ADD KEY `trans_date` (`trans_date`);

--
-- Indices de la tabla `ospos_items`
--
ALTER TABLE `ospos_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `item_number` (`item_number`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indices de la tabla `ospos_items_taxes`
--
ALTER TABLE `ospos_items_taxes`
  ADD PRIMARY KEY (`item_id`,`name`,`percent`);

--
-- Indices de la tabla `ospos_item_kits`
--
ALTER TABLE `ospos_item_kits`
  ADD PRIMARY KEY (`item_kit_id`);

--
-- Indices de la tabla `ospos_item_kit_items`
--
ALTER TABLE `ospos_item_kit_items`
  ADD PRIMARY KEY (`item_kit_id`,`item_id`,`quantity`),
  ADD KEY `ospos_item_kit_items_ibfk_2` (`item_id`);

--
-- Indices de la tabla `ospos_item_quantities`
--
ALTER TABLE `ospos_item_quantities`
  ADD PRIMARY KEY (`item_id`,`location_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indices de la tabla `ospos_modules`
--
ALTER TABLE `ospos_modules`
  ADD PRIMARY KEY (`module_id`),
  ADD UNIQUE KEY `desc_lang_key` (`desc_lang_key`),
  ADD UNIQUE KEY `name_lang_key` (`name_lang_key`);

--
-- Indices de la tabla `ospos_people`
--
ALTER TABLE `ospos_people`
  ADD PRIMARY KEY (`person_id`),
  ADD KEY `email` (`email`);

--
-- Indices de la tabla `ospos_permissions`
--
ALTER TABLE `ospos_permissions`
  ADD PRIMARY KEY (`permission_id`),
  ADD KEY `module_id` (`module_id`),
  ADD KEY `ospos_permissions_ibfk_2` (`location_id`);

--
-- Indices de la tabla `ospos_price_conversions`
--
ALTER TABLE `ospos_price_conversions`
  ADD PRIMARY KEY (`price_id`);

--
-- Indices de la tabla `ospos_receivings`
--
ALTER TABLE `ospos_receivings`
  ADD PRIMARY KEY (`receiving_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `reference` (`reference`),
  ADD KEY `receiving_time` (`receiving_time`);

--
-- Indices de la tabla `ospos_receivings_items`
--
ALTER TABLE `ospos_receivings_items`
  ADD PRIMARY KEY (`receiving_id`,`item_id`,`line`),
  ADD KEY `item_id` (`item_id`);

--
-- Indices de la tabla `ospos_sales`
--
ALTER TABLE `ospos_sales`
  ADD PRIMARY KEY (`sale_id`),
  ADD UNIQUE KEY `invoice_number` (`invoice_number`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `sale_time` (`sale_time`),
  ADD KEY `dinner_table_id` (`dinner_table_id`);

--
-- Indices de la tabla `ospos_sales_items`
--
ALTER TABLE `ospos_sales_items`
  ADD PRIMARY KEY (`sale_id`,`item_id`,`line`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `item_location` (`item_location`);

--
-- Indices de la tabla `ospos_sales_items_taxes`
--
ALTER TABLE `ospos_sales_items_taxes`
  ADD PRIMARY KEY (`sale_id`,`item_id`,`line`,`name`,`percent`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indices de la tabla `ospos_sales_payments`
--
ALTER TABLE `ospos_sales_payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `payment_sale` (`sale_id`,`payment_type`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `payment_time` (`payment_time`);

--
-- Indices de la tabla `ospos_sales_reward_points`
--
ALTER TABLE `ospos_sales_reward_points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`);

--
-- Indices de la tabla `ospos_sales_taxes`
--
ALTER TABLE `ospos_sales_taxes`
  ADD PRIMARY KEY (`sales_taxes_id`),
  ADD KEY `print_sequence` (`sale_id`,`print_sequence`,`tax_group`);

--
-- Indices de la tabla `ospos_sessions`
--
ALTER TABLE `ospos_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indices de la tabla `ospos_stock_locations`
--
ALTER TABLE `ospos_stock_locations`
  ADD PRIMARY KEY (`location_id`);

--
-- Indices de la tabla `ospos_suppliers`
--
ALTER TABLE `ospos_suppliers`
  ADD UNIQUE KEY `account_number` (`account_number`),
  ADD KEY `person_id` (`person_id`);

--
-- Indices de la tabla `ospos_tax_categories`
--
ALTER TABLE `ospos_tax_categories`
  ADD PRIMARY KEY (`tax_category_id`);

--
-- Indices de la tabla `ospos_tax_codes`
--
ALTER TABLE `ospos_tax_codes`
  ADD PRIMARY KEY (`tax_code_id`);

--
-- Indices de la tabla `ospos_tax_jurisdictions`
--
ALTER TABLE `ospos_tax_jurisdictions`
  ADD PRIMARY KEY (`jurisdiction_id`);

--
-- Indices de la tabla `ospos_tax_rates`
--
ALTER TABLE `ospos_tax_rates`
  ADD PRIMARY KEY (`tax_rate_id`),
  ADD KEY `rate_tax_category_id` (`rate_tax_category_id`),
  ADD KEY `rate_tax_code_id` (`rate_tax_code_id`),
  ADD KEY `rate_jurisdiction_id` (`rate_jurisdiction_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ospos_attribute_definitions`
--
ALTER TABLE `ospos_attribute_definitions`
  MODIFY `definition_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ospos_attribute_values`
--
ALTER TABLE `ospos_attribute_values`
  MODIFY `attribute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `ospos_cash_up`
--
ALTER TABLE `ospos_cash_up`
  MODIFY `cashup_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ospos_customers_packages`
--
ALTER TABLE `ospos_customers_packages`
  MODIFY `package_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ospos_customers_points`
--
ALTER TABLE `ospos_customers_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ospos_customer_access_control`
--
ALTER TABLE `ospos_customer_access_control`
  MODIFY `access_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `ospos_dinner_tables`
--
ALTER TABLE `ospos_dinner_tables`
  MODIFY `dinner_table_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ospos_expenses`
--
ALTER TABLE `ospos_expenses`
  MODIFY `expense_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ospos_expense_categories`
--
ALTER TABLE `ospos_expense_categories`
  MODIFY `expense_category_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ospos_giftcards`
--
ALTER TABLE `ospos_giftcards`
  MODIFY `giftcard_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ospos_inventory`
--
ALTER TABLE `ospos_inventory`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT de la tabla `ospos_items`
--
ALTER TABLE `ospos_items`
  MODIFY `item_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de la tabla `ospos_item_kits`
--
ALTER TABLE `ospos_item_kits`
  MODIFY `item_kit_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ospos_people`
--
ALTER TABLE `ospos_people`
  MODIFY `person_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=276;

--
-- AUTO_INCREMENT de la tabla `ospos_price_conversions`
--
ALTER TABLE `ospos_price_conversions`
  MODIFY `price_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ospos_receivings`
--
ALTER TABLE `ospos_receivings`
  MODIFY `receiving_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ospos_sales`
--
ALTER TABLE `ospos_sales`
  MODIFY `sale_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `ospos_sales_payments`
--
ALTER TABLE `ospos_sales_payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `ospos_sales_reward_points`
--
ALTER TABLE `ospos_sales_reward_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ospos_sales_taxes`
--
ALTER TABLE `ospos_sales_taxes`
  MODIFY `sales_taxes_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `ospos_stock_locations`
--
ALTER TABLE `ospos_stock_locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ospos_tax_categories`
--
ALTER TABLE `ospos_tax_categories`
  MODIFY `tax_category_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ospos_tax_codes`
--
ALTER TABLE `ospos_tax_codes`
  MODIFY `tax_code_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ospos_tax_jurisdictions`
--
ALTER TABLE `ospos_tax_jurisdictions`
  MODIFY `jurisdiction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ospos_tax_rates`
--
ALTER TABLE `ospos_tax_rates`
  MODIFY `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ospos_attribute_definitions`
--
ALTER TABLE `ospos_attribute_definitions`
  ADD CONSTRAINT `fk_ospos_attribute_definitions_ibfk_1` FOREIGN KEY (`definition_fk`) REFERENCES `ospos_attribute_definitions` (`definition_id`);

--
-- Filtros para la tabla `ospos_attribute_links`
--
ALTER TABLE `ospos_attribute_links`
  ADD CONSTRAINT `ospos_attribute_links_ibfk_1` FOREIGN KEY (`definition_id`) REFERENCES `ospos_attribute_definitions` (`definition_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ospos_attribute_links_ibfk_2` FOREIGN KEY (`attribute_id`) REFERENCES `ospos_attribute_values` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ospos_attribute_links_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
  ADD CONSTRAINT `ospos_attribute_links_ibfk_4` FOREIGN KEY (`receiving_id`) REFERENCES `ospos_receivings` (`receiving_id`),
  ADD CONSTRAINT `ospos_attribute_links_ibfk_5` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`);

--
-- Filtros para la tabla `ospos_cash_up`
--
ALTER TABLE `ospos_cash_up`
  ADD CONSTRAINT `ospos_cash_up_ibfk_1` FOREIGN KEY (`open_employee_id`) REFERENCES `ospos_employees` (`person_id`),
  ADD CONSTRAINT `ospos_cash_up_ibfk_2` FOREIGN KEY (`close_employee_id`) REFERENCES `ospos_employees` (`person_id`);

--
-- Filtros para la tabla `ospos_customers`
--
ALTER TABLE `ospos_customers`
  ADD CONSTRAINT `ospos_customers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`),
  ADD CONSTRAINT `ospos_customers_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `ospos_customers_packages` (`package_id`),
  ADD CONSTRAINT `ospos_customers_ibfk_3` FOREIGN KEY (`sales_tax_code_id`) REFERENCES `ospos_tax_codes` (`tax_code_id`),
  ADD CONSTRAINT `ospos_customers_ibfk_4` FOREIGN KEY (`discipline_id`) REFERENCES `ospos_items` (`item_id`);

--
-- Filtros para la tabla `ospos_customers_points`
--
ALTER TABLE `ospos_customers_points`
  ADD CONSTRAINT `ospos_customers_points_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_customers` (`person_id`),
  ADD CONSTRAINT `ospos_customers_points_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `ospos_customers_packages` (`package_id`),
  ADD CONSTRAINT `ospos_customers_points_ibfk_3` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`);

--
-- Filtros para la tabla `ospos_employees`
--
ALTER TABLE `ospos_employees`
  ADD CONSTRAINT `ospos_employees_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`);

--
-- Filtros para la tabla `ospos_expenses`
--
ALTER TABLE `ospos_expenses`
  ADD CONSTRAINT `ospos_expenses_ibfk_1` FOREIGN KEY (`expense_category_id`) REFERENCES `ospos_expense_categories` (`expense_category_id`),
  ADD CONSTRAINT `ospos_expenses_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
  ADD CONSTRAINT `ospos_expenses_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `ospos_suppliers` (`person_id`);

--
-- Filtros para la tabla `ospos_giftcards`
--
ALTER TABLE `ospos_giftcards`
  ADD CONSTRAINT `ospos_giftcards_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`);

--
-- Filtros para la tabla `ospos_grants`
--
ALTER TABLE `ospos_grants`
  ADD CONSTRAINT `ospos_grants_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `ospos_permissions` (`permission_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ospos_grants_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `ospos_employees` (`person_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `ospos_inventory`
--
ALTER TABLE `ospos_inventory`
  ADD CONSTRAINT `ospos_inventory_ibfk_1` FOREIGN KEY (`trans_items`) REFERENCES `ospos_items` (`item_id`),
  ADD CONSTRAINT `ospos_inventory_ibfk_2` FOREIGN KEY (`trans_user`) REFERENCES `ospos_employees` (`person_id`),
  ADD CONSTRAINT `ospos_inventory_ibfk_3` FOREIGN KEY (`trans_location`) REFERENCES `ospos_stock_locations` (`location_id`);

--
-- Filtros para la tabla `ospos_items`
--
ALTER TABLE `ospos_items`
  ADD CONSTRAINT `ospos_items_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `ospos_suppliers` (`person_id`);

--
-- Filtros para la tabla `ospos_items_taxes`
--
ALTER TABLE `ospos_items_taxes`
  ADD CONSTRAINT `ospos_items_taxes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `ospos_item_kit_items`
--
ALTER TABLE `ospos_item_kit_items`
  ADD CONSTRAINT `ospos_item_kit_items_ibfk_1` FOREIGN KEY (`item_kit_id`) REFERENCES `ospos_item_kits` (`item_kit_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ospos_item_kit_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `ospos_item_quantities`
--
ALTER TABLE `ospos_item_quantities`
  ADD CONSTRAINT `ospos_item_quantities_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
  ADD CONSTRAINT `ospos_item_quantities_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `ospos_stock_locations` (`location_id`);

--
-- Filtros para la tabla `ospos_permissions`
--
ALTER TABLE `ospos_permissions`
  ADD CONSTRAINT `ospos_permissions_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `ospos_modules` (`module_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ospos_permissions_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `ospos_stock_locations` (`location_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `ospos_receivings`
--
ALTER TABLE `ospos_receivings`
  ADD CONSTRAINT `ospos_receivings_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
  ADD CONSTRAINT `ospos_receivings_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `ospos_suppliers` (`person_id`);

--
-- Filtros para la tabla `ospos_receivings_items`
--
ALTER TABLE `ospos_receivings_items`
  ADD CONSTRAINT `ospos_receivings_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
  ADD CONSTRAINT `ospos_receivings_items_ibfk_2` FOREIGN KEY (`receiving_id`) REFERENCES `ospos_receivings` (`receiving_id`);

--
-- Filtros para la tabla `ospos_sales`
--
ALTER TABLE `ospos_sales`
  ADD CONSTRAINT `ospos_sales_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
  ADD CONSTRAINT `ospos_sales_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `ospos_customers` (`person_id`),
  ADD CONSTRAINT `ospos_sales_ibfk_3` FOREIGN KEY (`dinner_table_id`) REFERENCES `ospos_dinner_tables` (`dinner_table_id`);

--
-- Filtros para la tabla `ospos_sales_items`
--
ALTER TABLE `ospos_sales_items`
  ADD CONSTRAINT `ospos_sales_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
  ADD CONSTRAINT `ospos_sales_items_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`),
  ADD CONSTRAINT `ospos_sales_items_ibfk_3` FOREIGN KEY (`item_location`) REFERENCES `ospos_stock_locations` (`location_id`);

--
-- Filtros para la tabla `ospos_sales_items_taxes`
--
ALTER TABLE `ospos_sales_items_taxes`
  ADD CONSTRAINT `ospos_sales_items_taxes_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales_items` (`sale_id`),
  ADD CONSTRAINT `ospos_sales_items_taxes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`);

--
-- Filtros para la tabla `ospos_sales_payments`
--
ALTER TABLE `ospos_sales_payments`
  ADD CONSTRAINT `ospos_sales_payments_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`),
  ADD CONSTRAINT `ospos_sales_payments_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`);

--
-- Filtros para la tabla `ospos_sales_reward_points`
--
ALTER TABLE `ospos_sales_reward_points`
  ADD CONSTRAINT `ospos_sales_reward_points_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`);

--
-- Filtros para la tabla `ospos_suppliers`
--
ALTER TABLE `ospos_suppliers`
  ADD CONSTRAINT `ospos_suppliers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`);

--
-- Filtros para la tabla `ospos_tax_rates`
--
ALTER TABLE `ospos_tax_rates`
  ADD CONSTRAINT `ospos_tax_rates_ibfk_1` FOREIGN KEY (`rate_tax_category_id`) REFERENCES `ospos_tax_categories` (`tax_category_id`),
  ADD CONSTRAINT `ospos_tax_rates_ibfk_2` FOREIGN KEY (`rate_tax_code_id`) REFERENCES `ospos_tax_codes` (`tax_code_id`),
  ADD CONSTRAINT `ospos_tax_rates_ibfk_3` FOREIGN KEY (`rate_jurisdiction_id`) REFERENCES `ospos_tax_jurisdictions` (`jurisdiction_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
