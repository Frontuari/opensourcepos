<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Price_conversion class
 */

class Price_conversion extends CI_Model
{
	/*
	Determines if a given Expense_id is an Expense category
	*/
	public function exists($price_id)
	{
		$this->db->from('price_conversions');
		$this->db->where('price_id', $price_id);

		return ($this->db->get()->num_rows() == 1);
	}

	/*
	Gets total of rows
	*/
	public function get_total_rows()
	{
		$this->db->from('price_conversions');
		$this->db->where('deleted', 0);

		return $this->db->count_all_results();
	}

	/*
	Gets information about a particular category
	*/
	public function get_lastprice($rows=1,$limit_from=0)
	{
		$this->db->from('price_conversions');
		$this->db->where('deleted', 0);
		$this->db->order_by('valid_from','desc');
		$this->db->limit($rows, $limit_from);
		$query = $this->db->get();
		if($query->num_rows()==1)
		{
			return $query->row();
		}
		else
		{
			//Get empty base parent object, as $item_kit_id is NOT an item kit
			$expense_obj = new stdClass();

			//Get all the fields from items table
			foreach($this->db->list_fields('price_conversions') as $field)
			{
				$expense_obj->$field = '';
			}

			return $expense_obj;
		}
	}

	/*
	Gets information about a particular category
	*/
	public function get_info($price_id)
	{
		$this->db->from('price_conversions');
		$this->db->where('price_id', $price_id);
		$this->db->where('deleted', 0);
		$query = $this->db->get();
		if($query->num_rows()==1)
		{
			return $query->row();
		}
		else
		{
			//Get empty base parent object, as $item_kit_id is NOT an item kit
			$expense_obj = new stdClass();

			//Get all the fields from items table
			foreach($this->db->list_fields('price_conversions') as $field)
			{
				$expense_obj->$field = '';
			}

			return $expense_obj;
		}
	}

	/*
	Returns all the price_conversions
	*/
	public function get_all($rows = 0, $limit_from = 0, $no_deleted = FALSE)
	{
		$this->db->from('price_conversions');
		if($no_deleted == TRUE)
		{
			$this->db->where('deleted', 0);
		}

		$this->db->order_by('valid_from', 'asc');

		if($rows > 0)
		{
			$this->db->limit($rows, $limit_from);
		}

		return $this->db->get();
	}

	/*
	Gets information about multiple price_id
	*/
	public function get_multiple_info($price_ids)
	{
		$this->db->from('price_conversions');
		$this->db->where_in('price_id', $price_ids);
		$this->db->order_by('valid_from', 'asc');

		return $this->db->get();
	}

	/*
	Inserts or updates an price_conversion
	*/
	public function save(&$price_conversion_data, $price_id = FALSE)
	{
		if(!$price_id || !$this->exists($price_id))
		{
			if($this->db->insert('price_conversions', $price_conversion_data))
			{
				$price_conversion_data['price_id'] = $this->db->insert_id();

				return TRUE;
			}

			return FALSE;
		}

		$this->db->where('price_id', $price_id);

		return $this->db->update('price_conversions', $price_conversion_data);
	}

	/*
	Deletes a list of price_conversion
	*/
	public function delete_list($price_ids)
	{
		$this->db->where_in('price_id', $price_ids);

		return $this->db->update('price_conversions', array('deleted' => 1));
 	}

	/*
	Gets rows
	*/
	public function get_found_rows($search)
	{
		return $this->search($search, 0, 0, 'valid_from', 'asc', TRUE);
	}

	/*
	Perform a search on price_conversion
	*/
	public function search($search, $rows = 0, $limit_from = 0, $sort = 'valid_from', $order='asc', $count_only = FALSE)
	{
		// get_found_rows case
		if($count_only == TRUE)
		{
			$this->db->select('COUNT(price_conversions.price_id) as count');
		}

		$this->db->from('price_conversions AS price_conversions');
		$this->db->group_start();
			$this->db->like('valid_from', $search);
			$this->db->or_like('currency_code', $search);
		$this->db->group_end();
		$this->db->where('deleted', 0);

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
}
?>
