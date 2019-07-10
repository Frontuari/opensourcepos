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

INSERT INTO `sealboxdb`.`ospos_permissions` (`permission_id`, `module_id`, `location_id`) VALUES ('reports_access_customers', 'reports', NULL);

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

