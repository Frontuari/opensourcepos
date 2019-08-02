<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Customer class
 */

class Customer extends Person
{

	private $log;

	function get_log(){
		return $this->log;
	}

	function set_log($log){
		return $this->log = $this->log."<br>".$log;
	}

	/*
	Determines if a given person_id is a customer
	*/
	public function exists($person_id)
	{
		$this->db->from('customers');
		$this->db->join('people', 'people.person_id = customers.person_id');
		$this->db->where('customers.person_id', $person_id);

		return ($this->db->get()->num_rows() == 1);
	}

	/*
	Checks if account number exists
	*/
	public function check_account_number_exists($account_number, $person_id = '')
	{
		$this->db->from('customers');
		$this->db->where('account_number', $account_number);

		if(!empty($person_id))
		{
			$this->db->where('person_id !=', $person_id);
		}

		return ($this->db->get()->num_rows() == 1);
	}

	/*
	Gets total of rows
	*/
	public function get_total_rows()
	{
		$this->db->from('customers');
		$this->db->where('deleted', 0);

		return $this->db->count_all_results();
	}

	/*
	Returns all the customers
	*/
	public function get_all($rows = 0, $limit_from = 0)
	{
		$this->db->from('customers');
		$this->db->join('people', 'customers.person_id = people.person_id');
		$this->db->where('deleted', 0);
		$this->db->order_by('last_name', 'asc');

		if($rows > 0)
		{
			$this->db->limit($rows, $limit_from);
		}

		return $this->db->get();
	}

	/*
	Gets information about a particular customer
	*/
	public function get_info($customer_id)
	{
		$this->db->from('customers');
		$this->db->join('people', 'people.person_id = customers.person_id');
		$this->db->where('customers.person_id', $customer_id);
		$query = $this->db->get();

		if($query->num_rows() == 1)
		{
			return $query->row();
		}
		else
		{
			//Get empty base parent object, as $customer_id is NOT a customer
			$person_obj = parent::get_info(-1);

			//Get all the fields from customer table
			//append those fields to base parent object, we we have a complete empty object
			foreach($this->db->list_fields('customers') as $field)
			{
				$person_obj->$field = '';
			}

			return $person_obj;
		}
	}

	/*
	Gets stats about a particular customer
	*/
	public function get_stats($customer_id)
	{
		// create a temporary table to contain all the sum and average of items
		$this->db->query('CREATE TEMPORARY TABLE IF NOT EXISTS ' . $this->db->dbprefix('sales_items_temp') .
			' (INDEX(sale_id)) ENGINE=MEMORY
			(
				SELECT
					sales.sale_id AS sale_id,
					AVG(sales_items.discount) AS avg_discount,
					SUM(sales_items.quantity_purchased) AS quantity
				FROM ' . $this->db->dbprefix('sales') . ' AS sales
				INNER JOIN ' . $this->db->dbprefix('sales_items') . ' AS sales_items
					ON sales_items.sale_id = sales.sale_id
				WHERE sales.customer_id = ' . $this->db->escape($customer_id) . '
				GROUP BY sale_id
			)'
		);

		$totals_decimals = totals_decimals();
		$quantity_decimals = quantity_decimals();

		$this->db->select('
						SUM(sales_payments.payment_amount - sales_payments.cash_refund) AS total,
						MIN(sales_payments.payment_amount - sales_payments.cash_refund) AS min,
						MAX(sales_payments.payment_amount - sales_payments.cash_refund) AS max,
						AVG(sales_payments.payment_amount - sales_payments.cash_refund) AS average,
						' . "
						ROUND(AVG(sales_items_temp.avg_discount), $totals_decimals) AS avg_discount,
						ROUND(SUM(sales_items_temp.quantity), $quantity_decimals) AS quantity
						");
		$this->db->from('sales');
		$this->db->join('sales_payments AS sales_payments', 'sales.sale_id = sales_payments.sale_id');
		$this->db->join('sales_items_temp AS sales_items_temp', 'sales.sale_id = sales_items_temp.sale_id');
		$this->db->where('sales.customer_id', $customer_id);
		$this->db->where('sales.sale_status', COMPLETED);
		$this->db->group_by('sales.customer_id');

		$stat = $this->db->get()->row();

		// drop the temporary table to contain memory consumption as it's no longer required
		$this->db->query('DROP TEMPORARY TABLE IF EXISTS ' . $this->db->dbprefix('sales_items_temp'));

		return $stat;
	}

	/*
	Gets information about multiple customers
	*/
	public function get_multiple_info($customer_ids)
	{
		$this->db->from('customers');
		$this->db->join('people', 'people.person_id = customers.person_id');
		$this->db->where_in('customers.person_id', $customer_ids);
		$this->db->order_by('last_name', 'asc');

		return $this->db->get();
	}

	/*
	Checks if customer email exists
	*/
	public function check_email_exists($email, $customer_id = '')
	{
		// if the email is empty return like it is not existing
		if(empty($email))
		{
			return FALSE;
		}

		$this->db->from('customers');
		$this->db->join('people', 'people.person_id = customers.person_id');
		$this->db->where('people.email', $email);
		$this->db->where('customers.deleted', 0);

		if(!empty($customer_id))
		{
			$this->db->where('customers.person_id !=', $customer_id);
		}

		return ($this->db->get()->num_rows() == 1);
	}

	/*
	Inserts or updates a customer
	*/
	public function save_customer(&$person_data, &$customer_data, $customer_id = FALSE)
	{
		$success = FALSE;

		//Run these queries as a transaction, we want to make sure we do all or nothing
		$this->db->trans_start();

		$this->set_log("ID To Send: ".$customer_id);

		if(parent::save($person_data, $customer_id))
		{
			$this->set_log($this->db->last_query());
			if(!$customer_id || !$this->exists($customer_id))
			{
				$this->set_log($this->db->last_query());
				$customer_data['person_id'] = (!empty($person_data['person_id']) ? $person_data['person_id'] : $customer_id);
				$success = $this->db->insert('customers', $customer_data);
				$this->set_log($this->db->last_query());
			}
			else
			{
				$this->db->where('person_id', $customer_id);
				$success = $this->db->update('customers', $customer_data);
				$this->set_log($this->db->last_query());
			}
		}else{
			$this->set_log($this->db->last_query());	
		}

		$this->db->trans_complete();

		$success &= $this->db->trans_status();

		return $success;
	}

	/*
	Inserts or updates a customer
	*/
	public function save(&$customer_data, $customer_id = FALSE)
	{
		$success = FALSE;

		//Run these queries as a transaction, we want to make sure we do all or nothing
		$this->db->trans_start();

		$this->set_log("ID To Send: ".$customer_id);

		$this->db->where('person_id', $customer_id);
		$success = $this->db->update('customers', $customer_data);
		$this->set_log($this->db->last_query());
			
		$this->db->trans_complete();

		$success &= $this->db->trans_status();

		return $success;
	}

	/*
	Updates reward points value
	*/
	public function update_reward_points_value($customer_id, $value)
	{
		$this->db->where('person_id', $customer_id);
		$this->db->update('customers', array('points' => $value));
	}

	/*
	Deletes one customer
	*/
	public function delete($customer_id)
	{
		$result = TRUE;

		// if privacy enforcement is selected scramble customer data
		if($this->config->item('enforce_privacy'))
		{
			$this->db->where('person_id', $customer_id);

			$result &= $this->db->update('people', array(
					'first_name'	=> $customer_id,
					'last_name'		=> $customer_id,
					'phone_number'	=> '',
					'email'			=> '',
					'gender'		=> NULL,
					'address_1'		=> '',
					'address_2'		=> '',
					'city'			=> '',
					'state'			=> '',
					'zip'			=> '',
					'country'		=> '',
					'comments'		=> ''
				));

			$this->db->where('person_id', $customer_id);

			$result &= $this->db->update('customers', array(
					'consent'			=> 0,
					'company_name'		=> NULL,
					'account_number'	=> NULL,
					'tax_id'			=> '',
					'taxable'			=> 0,
					'discount'			=> 0.00,
					'discount_type'		=> 0,
					'package_id'		=> NULL,
					'points'			=> NULL,
					'sales_tax_code'	=> 1,
					'deleted'			=> 1
				));
		}
		else
		{
			$this->db->where('person_id', $customer_id);

			$result &= $this->db->update('customers', array('deleted' => 1));
		}

		return $result;
	}

	/*
	Deletes a list of customers
	*/
	public function delete_list($customer_ids)
	{
		$this->db->where_in('person_id', $customer_ids);

		return $this->db->update('customers', array('deleted' => 1));
 	}

 	/*
	Get search suggestions to find customers
	*/
	public function get_search_suggestions($search, $unique = TRUE, $limit = 25)
	{
		$suggestions = array();

		$this->db->from('customers');
		$this->db->join('people', 'customers.person_id = people.person_id');
		$this->db->group_start();
			$this->db->like('first_name', $search);
			$this->db->or_like('last_name', $search);
			$this->db->or_like('dni', $search);
			$this->db->or_like('customer_number', $search);
			$this->db->or_like('CONCAT(first_name, " ", last_name)', $search);
			if($unique)
			{
				$this->db->or_like('email', $search);
				$this->db->or_like('phone_number', $search);
				$this->db->or_like('company_name', $search);
			}
		$this->db->group_end();
		$this->db->where('deleted', 0);
		$this->db->order_by('last_name', 'asc');
		foreach($this->db->get()->result() as $row)
		{
			$suggestions[] = array('value' => $row->person_id, 'label' => $row->first_name . ' ' . $row->last_name . (!empty($row->company_name) ? ' [' . $row->company_name . ']' : ''). (!empty($row->phone_number) ? ' [' . $row->phone_number . ']' : ''));
		}

		if(!$unique)
		{
			$this->db->from('customers');
			$this->db->join('people', 'customers.person_id = people.person_id');
			$this->db->where('deleted', 0);
			$this->db->like('email', $search);
			$this->db->order_by('email', 'asc');
			foreach($this->db->get()->result() as $row)
			{
				$suggestions[] = array('value' => $row->person_id, 'label' => $row->email);
			}

			$this->db->from('customers');
			$this->db->join('people', 'customers.person_id = people.person_id');
			$this->db->where('deleted', 0);
			$this->db->like('phone_number', $search);
			$this->db->order_by('phone_number', 'asc');
			foreach($this->db->get()->result() as $row)
			{
				$suggestions[] = array('value' => $row->person_id, 'label' => $row->phone_number);
			}

			$this->db->from('customers');
			$this->db->join('people', 'customers.person_id = people.person_id');
			$this->db->where('deleted', 0);
			$this->db->like('account_number', $search);
			$this->db->order_by('account_number', 'asc');
			foreach($this->db->get()->result() as $row)
			{
				$suggestions[] = array('value' => $row->person_id, 'label' => $row->account_number);
			}
			$this->db->from('customers');
			$this->db->join('people', 'customers.person_id = people.person_id');
			$this->db->where('deleted', 0);
			$this->db->like('company_name', $search);
			$this->db->order_by('company_name', 'asc');
			foreach($this->db->get()->result() as $row)
			{
				$suggestions[] = array('value' => $row->person_id, 'label' => $row->company_name);
			}
		}

		//only return $limit suggestions
		if(count($suggestions) > $limit)
		{
			$suggestions = array_slice($suggestions, 0, $limit);
		}

		return $suggestions;
	}

 	/*
	Gets rows
	*/
	public function get_found_rows($search)
	{
		return $this->search($search, 0, 0, 'last_name', 'asc', TRUE);
	}

	/*
	Performs a search on customers
	*/
	public function search($search, $rows = 0, $limit_from = 0, $sort = 'last_name', $order = 'asc', $count_only = FALSE)
	{
		// get_found_rows case
		if($count_only == TRUE)
		{
			$this->db->select('COUNT(customers.person_id) as count');
		}
		else
		{
			$this->db->select('customers.*,people.*,items.name AS discipline');
		}

		$this->db->from('customers AS customers');
		$this->db->join('people AS people', 'customers.person_id = people.person_id');
		$this->db->join('items AS items', 'customers.discipline_id = items.item_id','LEFT');
		$this->db->group_start();
			$this->db->like('people.first_name', $search);
			$this->db->or_like('people.last_name', $search);
			$this->db->or_like('people.dni', $search);
			$this->db->or_like('people.email', $search);
			$this->db->or_like('people.phone_number', $search);
			$this->db->or_like('customers.account_number', $search);
			$this->db->or_like('customers.company_name', $search);
			$this->db->or_like('CONCAT(people.first_name, " ", people.last_name)', $search);
		$this->db->group_end();
		$this->db->where('customers.deleted', 0);

		// get_found_rows case
		if($count_only == TRUE)
		{
			return $this->db->get()->row()->count;
		}

		$this->db->order_by($sort, $order);

		if($rows > 0)
		{
			$this->db->limit($rows, $limit_from);
		}

		return $this->db->get();
	}

 	/*
	Get search suggestions to find customers
	*/
	public function get_status($person_id)
	{
		$suggestions = array();

		// create a temporary table to contain all the sum and average of items
		$this->db->query('CREATE TEMPORARY TABLE IF NOT EXISTS ' . $this->db->dbprefix('sales_items_temp') .
			' (INDEX(sale_id)) ENGINE=MEMORY
			(
				SELECT
					sales.customer_id,
					MAX(sales.sale_id) AS sale_id,
					MAX(sales_items.item_id) AS item_id,
					MAX(sales.sale_time) AS sale_time,
					MAX(CASE 
						WHEN items.frequency = ' . FREQUENCY_DAILY . ' 
							THEN (CASE WHEN DATEDIFF(CURDATE(),DATE_FORMAT(sales.sale_time,\'%Y-%m-%d\')) > 1 THEN 0 ELSE 1 END)
						WHEN items.frequency = ' . FREQUENCY_WEEKLY . ' 
							THEN (CASE WHEN DATEDIFF(CURDATE(),DATE_FORMAT(sales.sale_time,\'%Y-%m-%d\')) > 7 THEN 0 ELSE 1 END)
						WHEN items.frequency = ' . FREQUENCY_MONTHLY . ' 
							THEN (CASE WHEN DATEDIFF(CURDATE(),DATE_FORMAT(sales.sale_time,\'%Y-%m-%d\')) > 30 THEN 0 ELSE 1 END)
						WHEN items.frequency = ' . FREQUENCY_QUARTERLY . ' 
							THEN (CASE WHEN DATEDIFF(CURDATE(),DATE_FORMAT(sales.sale_time,\'%Y-%m-%d\')) > 90 THEN 0 ELSE 1 END)
						WHEN items.frequency = ' . FREQUENCY_ANNUALLY . ' 
							THEN (CASE WHEN DATEDIFF(CURDATE(),DATE_FORMAT(sales.sale_time,\'%Y-%m-%d\')) > 365 THEN 0 ELSE 1 END)
					END) AS status 
				FROM ' . $this->db->dbprefix('sales') . ' AS sales
				INNER JOIN ' . $this->db->dbprefix('sales_items') . ' AS sales_items 
					ON sales_items.sale_id = sales.sale_id
				INNER JOIN ' . $this->db->dbprefix('items') . ' AS items 
					ON sales_items.item_id = items.item_id
				WHERE sales.customer_id = ' . $this->db->escape($person_id) . ' 
				AND items.is_membership = 1 
				GROUP BY sales.customer_id 
			)'
		);

		//echo $this->db->last_query();

		$this->db->select('customers.person_id,
			people.dni,
			people.first_name,
			people.last_name,
			people.gender,
			customers.company_name,
			customers.pic_filename,
			customers.service_duedate,
			customers.is_exhonerated,
			people.phone_number,
			COALESCE(sales_items_temp.item_id,customers.discipline_id) AS item_id,
			items.name AS item_name,
			CURRENT_TIMESTAMP() AS today,
			DATEDIFF(service_duedate,CURDATE()) AS daysplace,
			CASE 
				WHEN (sales.sale_status = ' . COMPLETED . ')
					THEN 
					(CASE 
						WHEN sales_payments.payment_type = \'' . $this->lang->line('sales_deposit') . '\' AND sales_payments.transfer_status = ' . PAYMENT_STATUS_CO . ' THEN 
						(CASE 
							WHEN customers.service_duedate IS NOT NULL AND service_duedate>=CURDATE() THEN 1 
							WHEN customers.service_duedate IS NOT NULL AND service_duedate<CURDATE() THEN 0 
							ELSE sales_items_temp.status END) 
						WHEN sales_payments.payment_type = \'' . $this->lang->line('sales_deposit') . '\' AND sales_payments.transfer_status = ' . PAYMENT_STATUS_IP . ' THEN 2 
						WHEN sales_payments.payment_type = \'' . $this->lang->line('sales_deposit') . '\' AND sales_payments.transfer_status = ' . PAYMENT_STATUS_VO . ' THEN 0 
						WHEN sales_payments.payment_type <> \'' . $this->lang->line('sales_deposit') . '\' AND customers.service_duedate IS NOT NULL AND service_duedate>=CURDATE() THEN 1 
						WHEN sales_payments.payment_type <> \'' . $this->lang->line('sales_deposit') . '\' AND customers.service_duedate IS NOT NULL AND service_duedate<CURDATE() THEN 0 
						ELSE 2
					END)
				WHEN customers.service_duedate IS NOT NULL AND service_duedate>=CURDATE() THEN 1 
				WHEN customers.service_duedate IS NOT NULL AND service_duedate<CURDATE() THEN 0 
				ELSE 2 
			END AS status');

		$this->db->from('customers AS customers');
		$this->db->join('people AS people', 'customers.person_id = people.person_id');
		$this->db->join('sales_items_temp AS sales_items_temp', 'sales_items_temp.customer_id = customers.person_id AND customers.discipline_id = sales_items_temp.item_id','left');
		$this->db->join('sales_payments AS sales_payments', 'sales_items_temp.sale_id = sales_payments.sale_id','left');
		$this->db->join('sales AS sales','sales.sale_id = sales_items_temp.sale_id','left');
		$this->db->join('items AS items', 'items.item_id = COALESCE(sales_items_temp.item_id,customers.discipline_id)','left');
		$this->db->where('customers.person_id', $person_id);

		$query = $this->db->get();
		//echo "<br>".$this->db->last_query();
		foreach($query->result() as $row)
		{
			$suggestions[] = array(
				'id' => $row->person_id, 
				'item_id' => $row->item_id, 
				'dni' => $row->dni, 
				'gender' => $row->gender, 
				'item_name' => $row->item_name,
				'is_exhonerated' => $row->is_exhonerated,
				'daysplace' => $row->daysplace, 
				'today' => to_datetime(strtotime($row->today)), 
				'service_duedate' => to_date(strtotime($row->service_duedate)), 
				'name' => $row->first_name . ' ' . $row->last_name . (!empty($row->company_name) ? ' [' . $row->company_name . ']' : ''). (!empty($row->phone_number) ? ' [' . $row->phone_number . ']' : ''),
				'pic_filename' => $row->pic_filename, 
				'status' => ($row->is_exhonerated ==0 ? $row->status : 1)
			);

		}


		// drop the temporary table to contain memory consumption as it's no longer required
		$this->db->query('DROP TEMPORARY TABLE IF EXISTS ' . $this->db->dbprefix('sales_items_temp'));

		return $suggestions;
	}

	/*
	Determines if a given person_id is a customer
	*/
	public function exists_access($person_id,$datein)
	{
		$this->db->from('customer_access_control');
		$this->db->where('customer_id', $person_id);
		$this->db->where('DATE_FORMAT(datein,\'%Y-%m-%d\')', date('Y-m-d',strtotime($datein)));
		$this->db->where('dateout IS NULL', null, false);

		return ($this->db->get()->num_rows() == 1);
	}

	public function save_access_control($data_access, $customer_id, $insert = FALSE)
	{
		$success = FALSE;

		//Run these queries as a transaction, we want to make sure we do all or nothing
		$this->db->trans_start();

		$this->set_log("ID To Send: ".$customer_id);

		if($insert)
		{
			$this->set_log($this->db->last_query());
			$success = $this->db->insert('customer_access_control', $data_access);
			$this->set_log($this->db->last_query());
		}
		else
		{
			$this->db->where('customer_id', $customer_id);
			$this->db->where('DATE_FORMAT(datein,\'%Y-%m-%d\')', date('Y-m-d',strtotime($data_access['dateout'])));
			$this->db->where('dateout IS NULL', null, false);
			$success = $this->db->update('customer_access_control', $data_access);
			$this->set_log($this->db->last_query());
		}

		$this->db->trans_complete();

		$success &= $this->db->trans_status();

		return $success;
	}

	public function save_rehabilitation_control($data_access, $customer_id, $insert = FALSE)
	{
		$success = FALSE;

		//Run these queries as a transaction, we want to make sure we do all or nothing
		$this->db->trans_start();

		$this->set_log("ID To Send: ".$customer_id);

		$success = $this->db->insert('customer_rehabilitation_control', $data_access);
		$this->set_log($this->db->last_query());

		$this->db->trans_complete();

		$success &= $this->db->trans_status();

		return $success;
	}

	/*
	Get search suggestions to find customers
	*/
	public function check_status($person_id)
	{
		$suggestions = array();

		// create a temporary table to contain all the sum and average of items
		$this->db->query('CREATE TEMPORARY TABLE IF NOT EXISTS ' . $this->db->dbprefix('sales_items_temp') .
			' (INDEX(sale_id)) ENGINE=MEMORY
			(
				SELECT
					sales.customer_id,
					MAX(sales.sale_id) AS sale_id,
					MAX(sales_items.item_id) AS item_id
				FROM ' . $this->db->dbprefix('sales') . ' AS sales
				INNER JOIN ' . $this->db->dbprefix('sales_items') . ' AS sales_items 
					ON sales_items.sale_id = sales.sale_id
				INNER JOIN ' . $this->db->dbprefix('items') . ' AS items 
					ON sales_items.item_id = items.item_id 
				WHERE sales.customer_id = ' . $this->db->escape($person_id) . ' 
				AND items.is_rehabilitationservice = 1 
				GROUP BY sales.customer_id 
			)'
		);

		//echo $this->db->last_query();

		$this->db->select('customers.person_id,
			people.dni,
			people.first_name,
			people.last_name,
			people.gender,
			customers.company_name,
			customers.pic_filename,
			people.phone_number,
			COALESCE(sales_items_temp.item_id,customers.rehabilitation_id) AS item_id,
			items.name AS item_name,
			CURRENT_TIMESTAMP() AS today,
			COALESCE(sales_items_temp.sale_id,0) AS sale_id,
			COALESCE((CASE WHEN sales_items_temp.sale_id IS NOT NULL THEN sales_items.quantity_purchased-COALESCE((SELECT used FROM ' . $this->db->dbprefix('customer_rehabilitation_control') . ' AS rehab 
					WHERE sales_items_temp.item_id = rehab.item_id AND customers.person_id = rehab.customer_id AND rehab.sale_id = sales_items_temp.sale_id 
					ORDER BY datein DESC LIMIT 1),0) ELSE NULL END),(SELECT onhand FROM ' . $this->db->dbprefix('customer_rehabilitation_control') . ' AS rehab 
					WHERE customers.rehabilitation_id = rehab.item_id AND customers.person_id = rehab.customer_id AND rehab.sale_id = 0 
					ORDER BY datein DESC LIMIT 1),customers.onhand) AS onhand,
			COALESCE((CASE WHEN sales_items_temp.sale_id IS NOT NULL THEN COALESCE((SELECT used FROM ' . $this->db->dbprefix('customer_rehabilitation_control') . ' AS rehab 
					WHERE sales_items_temp.item_id = rehab.item_id AND customers.person_id = rehab.customer_id AND rehab.sale_id = sales_items_temp.sale_id 
					ORDER BY datein DESC LIMIT 1),0) ELSE NULL END),(SELECT used FROM ' . $this->db->dbprefix('customer_rehabilitation_control') . ' AS rehab 
					WHERE customers.rehabilitation_id = rehab.item_id AND customers.person_id = rehab.customer_id AND rehab.sale_id = 0 
					ORDER BY datein DESC LIMIT 1),customers.used) AS used');

		$this->db->from('customers AS customers');
		$this->db->join('people AS people', 'customers.person_id = people.person_id');
		$this->db->join('sales_items_temp AS sales_items_temp', 'sales_items_temp.customer_id = customers.person_id','left');
		$this->db->join('sales_items AS sales_items', 'sales_items_temp.sale_id = sales_items.sale_id','left');
		$this->db->join('items AS items', 'items.item_id = COALESCE(sales_items_temp.item_id,customers.rehabilitation_id)','left');
		$this->db->where('customers.person_id', $person_id);

		$query = $this->db->get();
		//echo "<br>".$this->db->last_query();
		foreach($query->result() as $row)
		{
			$suggestions[] = array(
				'id' => $row->person_id, 
				'item_id' => $row->item_id, 
				'dni' => $row->dni, 
				'gender' => $row->gender, 
				'item_name' => $row->item_name, 
				'today' => to_datetime(strtotime($row->today)), 
				'name' => $row->first_name . ' ' . $row->last_name . (!empty($row->company_name) ? ' [' . $row->company_name . ']' : ''). (!empty($row->phone_number) ? ' [' . $row->phone_number . ']' : ''),
				'pic_filename' => $row->pic_filename, 
				'sale_id' => $row->sale_id, 
				'onhand' => round($row->onhand), 
				'used' => round($row->used)
			);

		}


		// drop the temporary table to contain memory consumption as it's no longer required
		$this->db->query('DROP TEMPORARY TABLE IF EXISTS ' . $this->db->dbprefix('sales_items_temp'));

		return $suggestions;
	}


}
?>
