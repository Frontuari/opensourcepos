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
