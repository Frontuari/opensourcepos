ALTER TABLE `ospos_items` 
	ADD `is_membership` TINYINT(1) NOT NULL DEFAULT '0' AFTER `hsn_code`, 
	ADD `frequency` TINYINT(1) NOT NULL DEFAULT '0' AFTER `is_membership`;

ALTER TABLE `ospos_people` ADD `dni` VARCHAR(20) NULL DEFAULT NULL FIRST;

ALTER TABLE `ospos_customers` 
	ADD `pic_filename` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `consent`, 
	ADD `customer_number` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `pic_filename`;

CREATE TABLE `ospos_customer_access_control` (
 `access_id` int(10) NOT NULL AUTO_INCREMENT,
 `item_id` INT(10) NOT NULL,
 `customer_id` int(10) NOT NULL,
 `datein` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `dateout` timestamp NULL DEFAULT NULL,
 `status` tinyint(1) NOT NULL DEFAULT '0',
 PRIMARY KEY (`access_id`),
 KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `ospos_modules` (`name_lang_key`, `desc_lang_key`, `sort`, `module_id`) VALUES ('module_access_control', 'module_access_control_desc', '20', 'access_control');

INSERT INTO `ospos_permissions` (`permission_id`, `module_id`, `location_id`) VALUES ('access_control', 'access_control', NULL);

INSERT INTO `ospos_permissions` (`permission_id`, `module_id`, `location_id`) VALUES ('reports_access_customers', 'reports', NULL);

-- Cambios 08-07-2019

ALTER TABLE `ospos_customers` ADD `discipline_id` INT(10) NULL DEFAULT NULL AFTER `customer_number`;
ALTER TABLE `ospos_customers` ADD `service_duedate` DATE NULL DEFAULT NULL AFTER `customer_number`;
ALTER TABLE `ospos_customers` ADD INDEX(`discipline_id`);
ALTER TABLE `ospos_customers` ADD CONSTRAINT `ospos_customers_ibfk_4` FOREIGN KEY (`discipline_id`) REFERENCES `ospos_items`(`item_id`);

ALTER TABLE `ospos_sales_payments` ADD `bankname` VARCHAR(255) NULL DEFAULT NULL AFTER `reference_code`, ADD `referenceno` VARCHAR(100) NULL DEFAULT NULL AFTER `bankname`;
ALTER TABLE `ospos_sales_payments` ADD `transfer_status` INT(1) NULL DEFAULT '0' AFTER `referenceno`;


CREATE TABLE `ospos_price_conversions` (
 `price_id` int(10) NOT NULL AUTO_INCREMENT,
 `valid_from` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `price` decimal(10,2) NOT NULL DEFAULT 0.00,
 `currency_code` char(3) NOT NULL DEFAULT 'VES',
 `deleted` tinyint(1) NOT NULL DEFAULT '0',
 PRIMARY KEY (`price_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `ospos_modules` (`name_lang_key`, `desc_lang_key`, `sort`, `module_id`) VALUES ('module_price_conversions', 'module_price_conversions_desc', '55', 'price_conversions');
INSERT INTO `ospos_permissions` (`permission_id`, `module_id`, `location_id`) VALUES ('price_conversions', 'price_conversions', NULL);
INSERT INTO `ospos_grants` (`permission_id`, `person_id`, `menu_group`) VALUES ('price_conversions', '1', 'office');

-- Cambios 23-07-2019

ALTER TABLE `ospos_sales` ADD `sale_fiscalprinter_status` CHAR(2) NULL DEFAULT NULL AFTER `sale_type`;

-- Cambios 30-07-2019

ALTER TABLE `ospos_customers` ADD `is_exhonerated` TINYINT(1) NULL DEFAULT '0' AFTER `service_duedate`;
INSERT INTO `ospos_permissions` (`permission_id`, `module_id`, `location_id`) VALUES ('reports_fiscalprinters', 'reports', NULL);
INSERT INTO `ospos_grants` (`permission_id`, `person_id`, `menu_group`) VALUES ('reports_fiscalprinters', '1', '--');

ALTER TABLE `ospos_sales_payments` ADD `bankreceptor` VARCHAR(255) NULL DEFAULT NULL AFTER `bankname`;

-- Cambios 01-08-2019

CREATE TABLE `ospos_customer_rehabilitation_control` (
 `rehabilitation_id` int(10) NOT NULL AUTO_INCREMENT,
 `item_id` INT(10) NOT NULL,
 `sale_id` INT(10) NOT NULL,
 `customer_id` int(10) NOT NULL,
 `datein` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `dateout` timestamp NULL DEFAULT NULL,
 `onhand` int(10) NOT NULL DEFAULT 0,
 `used` int(10) NOT NULL DEFAULT 0,
 PRIMARY KEY (`rehabilitation_id`),
 KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `ospos_modules` (`name_lang_key`, `desc_lang_key`, `sort`, `module_id`) VALUES ('module_rehabilitation_control', 'module_rehabilitation_control_desc', '25', 'rehabilitation_control');
INSERT INTO `ospos_permissions` (`permission_id`, `module_id`, `location_id`) VALUES ('rehabilitation_control', 'rehabilitation_control', NULL);
INSERT INTO `ospos_grants` (`permission_id`, `person_id`, `menu_group`) VALUES ('rehabilitation_control', '1', 'home');
INSERT INTO `ospos_permissions` (`permission_id`, `module_id`, `location_id`) VALUES ('reports_rehabilitation_customers', 'reports', NULL);

ALTER TABLE `ospos_items` ADD `is_rehabilitationservice` TINYINT(1) NULL DEFAULT NULL ;

ALTER TABLE `ospos_customers` ADD `rif` VARCHAR(20) NULL DEFAULT NULL AFTER `company_name`;
ALTER TABLE `ospos_customers` ADD `rehabilitation_id` INT(10) NULL DEFAULT NULL AFTER `discipline_id`, ADD `onhand` INT(10) NULL DEFAULT NULL AFTER `rehabilitation_id`, ADD `used` INT(10) NULL DEFAULT NULL AFTER `onhand`;

-- Cambios 02-08-2019 

ALTER TABLE `ospos_expenses` 
	ADD `invoiceno` VARCHAR(255) NULL DEFAULT NULL AFTER `supplier_id`, 
	ADD `referenceno` VARCHAR(255) NULL DEFAULT NULL AFTER `invoiceno`;
