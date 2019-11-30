ALTER TABLE `ospos_people` ADD `dni` VARCHAR(20) NULL DEFAULT NULL FIRST;
ALTER TABLE `ospos_suppliers` ADD `ruc` VARCHAR(20) NULL DEFAULT NULL AFTER `person_id`;
ALTER TABLE `ospos_customers` ADD `ruc` VARCHAR(20) NULL DEFAULT NULL AFTER `person_id`;


-- --------------------------------------------------------

--
-- Dumping data for table `ospos_cash_concepts`
--

CREATE TABLE IF NOT EXISTS `ospos_cash_concepts` (
  `cash_concept_id` int(10) NOT NULL AUTO_INCREMENT,
  `code` varchar(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `concept_type` char(1) NOT NULL DEFAULT '1',
  `document_sequence` varchar(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_summary` tinyint(1) NOT NULL DEFAULT '0',
  `is_cash_general_used` tinyint(1) NOT NULL DEFAULT '0',
  `cash_concept_parent_id` int(10) DEFAULT NULL,
  `is_internal` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cash_concept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

--
-- Constraints for table `ospos_cash_concepts`
--
ALTER TABLE `ospos_cash_concepts`
  ADD CONSTRAINT `ospos_cash_concepts_ibfk_1` FOREIGN KEY (`cash_concept_parent_id`) REFERENCES `ospos_cash_concepts` (`cash_concept_id`);


INSERT INTO `ospos_cash_concepts` (`cash_concept_id`, `code`, `name`, `concept_type`, `document_sequence`, `description`, `is_summary`, `is_cash_general_used`, `cash_concept_parent_id`, `is_internal`, `deleted`) VALUES
  (NULL, '01-00', 'SALDO APERTURA CAJA GENERAL', '1', NULL, NULL, '0', '1', NULL, '1', '0'),
  (NULL, '00-01-00', 'SALDO APERTURA CAJA PAGADORA', '1', NULL, NULL, '0', '0', NULL, '1', '0'),
  (NULL, '00-01-01', 'VENTAS', '1', NULL, NULL, '0', '0', NULL, '1', '0'),
  (NULL, '02-00', 'COMPRAS', '0', NULL, NULL, '0', '1', NULL, '1', '0');


INSERT INTO `ospos_modules` (`name_lang_key`, `desc_lang_key`, `sort`, `module_id`) VALUES
('module_cash_concepts', 'module_cash_concepts_desc', 48, 'cash_concepts');

INSERT INTO `ospos_permissions` (`permission_id`, `module_id`) VALUES
('cash_concepts', 'cash_concepts');

INSERT INTO `ospos_grants` (`permission_id`, `person_id`, `menu_group`) VALUES
('cash_concepts', 1, 'home');

INSERT INTO `ospos_modules` (`name_lang_key`, `desc_lang_key`, `sort`, `module_id`) VALUES ('module_cash', 'module_cash_desc', '777', 'cash');

INSERT INTO `ospos_permissions` (`permission_id`, `module_id`, `location_id`) VALUES ('cash', 'cash', NULL);

ALTER TABLE `ospos_stock_locations` ADD `location_code` VARCHAR(10) NULL DEFAULT NULL AFTER `location_id`;

ALTER TABLE `ospos_employees` ADD `stock_location_id` INT(10) NULL DEFAULT NULL AFTER `hash_version`;

ALTER TABLE `ospos_employees`
  ADD CONSTRAINT `ospos_employees_ibfk_2` FOREIGN KEY (`stock_location_id`) REFERENCES `ospos_stock_locations` (`location_id`);

  -- --------------------------------------------------------

  --
  -- Estructura de tabla para la tabla `ospos_banks`
  --

  CREATE TABLE IF NOT EXISTS `ospos_banks` (
  `bank_id` int(10) NOT NULL AUTO_INCREMENT,
    `ruc` varchar(50) NOT NULL,
    `name` varchar(255) NOT NULL,
    `deleted` int(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (`bank_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

  --
  -- Estructura de tabla para la tabla `ospos_bankaccounts`
  --

  CREATE TABLE IF NOT EXISTS `ospos_bankaccounts` (
    `bankaccount_id` int(10) NOT NULL AUTO_INCREMENT,
    `bank_id` int(10) NOT NULL,
    `currency` char(3) NOT NULL DEFAULT 'PEN',
    `account_number` varchar(20) NOT NULL,
    `deleted` int(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (`bankaccount_id`),
    KEY `bank_id` (`bank_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

  --
  -- Filtros para la tabla `ospos_bankaccounts`
  --
  ALTER TABLE `ospos_bankaccounts`
    ADD CONSTRAINT `ospos_bankaccounts_ibfk_1` FOREIGN KEY (`bank_id`) REFERENCES `ospos_banks` (`bank_id`);

CREATE TABLE `ospos_cash_books` (
  `cash_book_id` int(10) NOT NULL AUTO_INCREMENT,
  `code` varchar(40) NOT NULL,
  `stock_location_id` int(10) NOT NULL,
  `employee_id` int(10) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `is_cash_general` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cash_book_id`),
  UNIQUE KEY `code` (`code`,`stock_location_id`,`employee_id`,`deleted`),
  KEY `stock_location_id` (`stock_location_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `ospos_cash_books`
  ADD CONSTRAINT `ospos_cash_books_ibfk_1` FOREIGN KEY (`stock_location_id`) REFERENCES `ospos_stock_locations` (`location_id`),
  ADD CONSTRAINT `ospos_cash_books_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`);

INSERT INTO `ospos_modules` (`name_lang_key`, `desc_lang_key`, `sort`, `module_id`) VALUES ('module_cash_books', 'module_cash_books_desc', '70', 'cash_books');

INSERT INTO `ospos_permissions` (`permission_id`, `module_id`, `location_id`) VALUES ('cash_books', 'cash_books', NULL);

INSERT INTO `ospos_modules` (`name_lang_key`, `desc_lang_key`, `sort`, `module_id`) VALUES ('module_pay_cash', 'module_pay_cash_desc', '788', 'pay_cash');
INSERT INTO `ospos_permissions` (`permission_id`, `module_id`, `location_id`) VALUES ('pay_cash', 'pay_cash', NULL);

ALTER TABLE `ospos_cash_up` ADD `cash_book_id` INT(10) NOT NULL;

--
-- Constraints for table `ospos_cash_up`
--
ALTER TABLE `ospos_cash_up`
  ADD CONSTRAINT `ospos_cash_up_ibfk_3` FOREIGN KEY (`cash_book_id`) REFERENCES `ospos_cash_books` (`cash_book_id`);

  INSERT INTO `ospos_modules` (`name_lang_key`, `desc_lang_key`, `sort`, `module_id`)
  	VALUES ('module_overall_cashs', 'module_overall_cashs_desc', '799', 'overall_cashs');
  INSERT INTO `ospos_permissions` (`permission_id`, `module_id`, `location_id`)
  	VALUES ('overall_cashs', 'overall_cashs', NULL);
  INSERT INTO `ospos_grants` (`permission_id`, `person_id`, `menu_group`) VALUES ('overall_cashs', '1', 'home');

CREATE TABLE `ospos_overall_cashs`(
  	`overall_cash_id` int(10) NOT NULL AUTO_INCREMENT,
  	`opendate` timestamp NOT NULL,
  	`startbalance` decimal(10,2) NOT NULL DEFAULT 0.00,
  	`openingbalance` decimal(10,2) NOT NULL DEFAULT 0.00,
  	`closedate` timestamp NULL DEFAULT NULL,
  	`endingbalance` decimal(10,2) NOT NULL DEFAULT 0.00,
    `usdstartbalance` decimal(10,2) NOT NULL DEFAULT '0.00',
    `usdopeningbalance` decimal(10,2) NOT NULL DEFAULT '0.00',
    `usdendingbalance` decimal(10,2) NOT NULL DEFAULT '0.00',
  	`state` int(1) NOT NULL DEFAULT '0',
  	PRIMARY KEY (`overall_cash_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ospos_cash_flow`(
  	`cash_flow_id` int(10) NOT NULL AUTO_INCREMENT,
  	`overall_cash_id` int(10) NOT NULL,
  	`cash_concept_id` int(10) NOT NULL,
  	`cash_book_id` int(10) NOT NULL,
  	`operation_type` int(1) NOT NULL DEFAULT 1,
  	`movementdate` timestamp NOT NULL,
  	`description` varchar(255) NULL DEFAULT NULL,
    `currency` char(3) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'PEN',
  	`amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  	`table_reference` varchar(255) NULL,
  	`reference_id` int(10) NULL,
  	`deleted` int(1) NOT NULL DEFAULT '0',
  	PRIMARY KEY (`cash_flow_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ospos_overallcash_currencys`(
  	`overallcash_currency_id` int(10) NOT NULL AUTO_INCREMENT,
  	`overall_cash_id` int(10) NOT NULL,
  	`currency` CHAR(3) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'PEN',
  	`denomination` varchar(100) NOT NULL,
  	`quantity` int(10) NOT NULL DEFAULT 0,
  	`amount` decimal(10,2) NOT NULL DEFAULT 0,
  	`deleted` int(1) NOT NULL DEFAULT '0',
  	PRIMARY KEY (`overallcash_currency_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

  CREATE TABLE `ospos_incomes`(
  	`income_id` int(10) NOT NULL AUTO_INCREMENT,
  	`documentno` varchar(50) NOT NULL,
  	`documentdate` timestamp NOT NULL,
  	`person_id` int(10) NOT NULL,
    `person_name` varchar(255) DEFAULT NULL,
  	`bankaccount_id` int(10) DEFAULT NULL,
  	`cash_concept_id` int(10) NOT NULL,
  	`cash_subconcept_id` int(10) NOT NULL,
  	`detail` varchar(255) NOT NULL,
    `is_cashupmovement` int(11) NOT NULL DEFAULT '0',
  	`movementtype` char(1) NOT NULL DEFAULT 'C',
  	`trx_number` VARCHAR(50) NULL,
  	`currency` char(3) NOT NULL DEFAULT 'PEN',
  	`amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  	`deleted` int(1) NOT NULL DEFAULT '0',
  	PRIMARY KEY (`income_id`),
  	KEY `person_id` (`person_id`),
  	KEY `bankaccount_id` (`bankaccount_id`),
  	KEY `cash_concept_id` (`cash_concept_id`),
  	KEY `cash_subconcept_id` (`cash_subconcept_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

  ALTER TABLE `ospos_incomes`
  	ADD CONSTRAINT `ospos_incomes_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`),
  	ADD CONSTRAINT `ospos_incomes_ibfk_2` FOREIGN KEY (`bankaccount_id`) REFERENCES `ospos_bankaccounts` (`bankaccount_id`),
  	ADD CONSTRAINT `ospos_incomes_ibfk_3` FOREIGN KEY (`cash_concept_id`) REFERENCES `ospos_cash_concepts` (`cash_concept_id`),
  	ADD CONSTRAINT `ospos_incomes_ibfk_4` FOREIGN KEY (`cash_subconcept_id`) REFERENCES `ospos_cash_concepts` (`cash_concept_id`);

DROP TABLE IF EXISTS `ospos_expenses`;
CREATE TABLE IF NOT EXISTS `ospos_expenses` (
    `expense_id` int(10) NOT NULL AUTO_INCREMENT,
      `documentno` varchar(50) NOT NULL,
      `documentdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      `person_id` int(10) DEFAULT NULL,
      `person_name` varchar(255) DEFAULT NULL,
      `cash_concept_id` int(10) NOT NULL,
      `cash_subconcept_id` int(10) DEFAULT NULL,
      `detail` varchar(255) NOT NULL,
      `doctype` VARCHAR(255) NULL DEFAULT NULL,
      `docnumber` VARCHAR(255) NULL DEFAULT NULL,
      `is_cashupmovement` int(11) NOT NULL DEFAULT '0',
      `movementtype` char(1) NOT NULL DEFAULT 'C',
      `bankaccount_id` int(10) DEFAULT NULL,
      `trx_number` varchar(50) DEFAULT NULL,
      `currency` char(3) NOT NULL DEFAULT 'PEN',
      `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
      `deleted` int(1) NOT NULL DEFAULT '0',
      PRIMARY KEY (`expense_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

    ALTER TABLE `ospos_expenses`
    	ADD CONSTRAINT `ospos_expenses_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`),
    	ADD CONSTRAINT `ospos_expenses_ibfk_2` FOREIGN KEY (`bankaccount_id`) REFERENCES `ospos_bankaccounts` (`bankaccount_id`),
    	ADD CONSTRAINT `ospos_expenses_ibfk_3` FOREIGN KEY (`cash_concept_id`) REFERENCES `ospos_cash_concepts` (`cash_concept_id`),
    	ADD CONSTRAINT `ospos_expenses_ibfk_4` FOREIGN KEY (`cash_subconcept_id`) REFERENCES `ospos_cash_concepts` (`cash_concept_id`);

CREATE TABLE `ospos_cash_daily`(
  	`cash_daily_id` int(10) NOT NULL AUTO_INCREMENT,
  	`cashup_id` int(10) NOT NULL,
  	`cash_concept_id` int(10) NOT NULL,
  	`cash_book_id` int(10) NOT NULL,
  	`operation_type` int(1) NOT NULL DEFAULT 1,
  	`movementdate` timestamp NOT NULL,
  	`description` varchar(255) NULL DEFAULT NULL,
  	`isbankmovement` int(1) NOT NULL DEFAULT '0',
  	`currency` CHAR(3) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'PEN',
  	`amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  	`table_reference` varchar(255) NULL,
  	`reference_id` int(10) NULL,
  	`deleted` int(1) NOT NULL DEFAULT '0',
  	PRIMARY KEY (`cash_daily_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

  ALTER TABLE `ospos_cash_up` CHANGE `transfer_amount_cash` `transfer_amount_cash` DECIMAL(15,2) NOT NULL DEFAULT '0.00';
  ALTER TABLE `ospos_cash_up` CHANGE `note` `note` INT(1) NOT NULL DEFAULT '0';
  ALTER TABLE `ospos_cash_up` CHANGE `closed_amount_cash` `closed_amount_cash` DECIMAL(15,2) NOT NULL DEFAULT '0.00';
  ALTER TABLE `ospos_cash_up` CHANGE `closed_amount_card` `closed_amount_card` DECIMAL(15,2) NOT NULL DEFAULT '0.00';
  ALTER TABLE `ospos_cash_up` CHANGE `closed_amount_check` `closed_amount_check` DECIMAL(15,2) NOT NULL DEFAULT '0.00';
  ALTER TABLE `ospos_cash_up` CHANGE `closed_amount_total` `closed_amount_total` DECIMAL(15,2) NOT NULL DEFAULT '0.00';
  ALTER TABLE `ospos_cash_up` CHANGE `closed_amount_due` `closed_amount_due` DECIMAL(15,2) NOT NULL DEFAULT '0.00';
  ALTER TABLE `ospos_cash_up` CHANGE `close_employee_id` `close_employee_id` INT(10) NULL DEFAULT NULL;

  CREATE TABLE `ospos_costs`(
  	`cost_id` int(10) NOT NULL AUTO_INCREMENT,
  	`documentno` varchar(50) NOT NULL,
  	`documentdate` timestamp NOT NULL,
  	`person_id` int(10) NULL,
  	`cash_concept_id` int(10) NOT NULL,
  	`cash_subconcept_id` int(10) NOT NULL,
  	`detail` varchar(255) NOT NULL,
  	`is_cashupmovement` INT(0) NOT NULL DEFAULT '0',
  	`movementtype` char(1) NOT NULL DEFAULT 'C',
  	`bankaccount_id` int(10) NULL,
  	`trx_number` VARCHAR(50) NULL,
  	`currency` char(3) NOT NULL DEFAULT 'PEN',
  	`amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  	`deleted` int(1) NOT NULL DEFAULT '0',
  	PRIMARY KEY (`cost_id`),
  	KEY `person_id` (`person_id`),
  	KEY `bankaccount_id` (`bankaccount_id`),
  	KEY `cash_concept_id` (`cash_concept_id`),
  	KEY `cash_subconcept_id` (`cash_subconcept_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

  ALTER TABLE `ospos_costs`
  	ADD CONSTRAINT `ospos_costs_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`),
  	ADD CONSTRAINT `ospos_costs_ibfk_2` FOREIGN KEY (`bankaccount_id`) REFERENCES `ospos_bankaccounts` (`bankaccount_id`),
  	ADD CONSTRAINT `ospos_costs_ibfk_3` FOREIGN KEY (`cash_concept_id`) REFERENCES `ospos_cash_concepts` (`cash_concept_id`),
  	ADD CONSTRAINT `ospos_costs_ibfk_4` FOREIGN KEY (`cash_subconcept_id`) REFERENCES `ospos_cash_concepts` (`cash_concept_id`);

CREATE TABLE `ospos_cashup_currencys`(
    	`cashup_currency_id` int(10) NOT NULL AUTO_INCREMENT,
    	`cashup_id` int(10) NOT NULL,
    	`currency` CHAR(3) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'PEN',
    	`denomination` varchar(100) NOT NULL,
    	`quantity` int(10) NOT NULL DEFAULT 0,
    	`amount` decimal(10,2) NOT NULL DEFAULT 0,
    	`deleted` int(1) NOT NULL DEFAULT '0',
    	PRIMARY KEY (`cashup_currency_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ospos_doctype_sequences`(
    	`sequence_id` int(10) NOT NULL AUTO_INCREMENT,
    	`name` varchar(255) NOT NULL,
    	`prefix` varchar(50) NOT NULL,
    	`suffix` varchar(50) NOT NULL,
    	`next_sequence` varchar(50) NOT NULL,
    	`number_incremental` varchar(50) NOT NULL,
    	`doctype` varchar(50) NOT NULL,
    	`is_cashup` int(1) NOT NULL DEFAULT '0',
    	`deleted` int(1) NOT NULL DEFAULT '0',
    	PRIMARY KEY (`sequence_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

    INSERT INTO `ospos_modules` (`name_lang_key`, `desc_lang_key`, `sort`, `module_id`) VALUES
    ('module_doctypesequences', 'module_doctypesequences_desc', 520, 'doctypesequences');

    INSERT INTO `ospos_permissions` (`permission_id`, `module_id`, `location_id`) VALUES
    ('doctypesequences', 'doctypesequences', NULL);

    INSERT INTO `ospos_grants` (`permission_id`, `person_id`, `menu_group`) VALUES
    ('doctypesequences', 1, 'office');

    INSERT INTO `ospos_permissions` (`permission_id`, `module_id`, `location_id`)
    VALUES ('reports_expenses', 'reports', NULL), ('reports_costs', 'reports', NULL);

ALTER TABLE `ospos_sales` ADD COLUMN `pdf_link` text AFTER `sale_type`;

INSERT INTO `ospos_permissions` (`permission_id`, `module_id`, `location_id`)
    VALUES ('reports_cashups', 'reports', NULL), ('reports_overallcashs', 'reports', NULL);

ALTER TABLE `ospos_customers` ADD `business_name` VARCHAR(255) NULL DEFAULT NULL AFTER `ruc`;
