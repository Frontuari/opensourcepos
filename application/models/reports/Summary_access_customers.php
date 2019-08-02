<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once("Summary_report.php");

class Summary_access_customers extends Summary_report
{
	protected function _get_data_columns()
	{
		return array(
			array('item' => $this->lang->line('reports_item')),
			array('dni' => $this->lang->line('reports_dni')),
			array('name' => $this->lang->line('reports_customer')),
			array('datein' => $this->lang->line('reports_datein')),
			array('dateout' => $this->lang->line('reports_dateout')),
			array('duration' => $this->lang->line('reports_duration'), 'sorter' => 'number_sorter'),
			array('status' => $this->lang->line('reports_status')));
	}

	public function getData(array $inputs)
	{
		$this->db->select('items.name AS item,
			people.dni,
			CONCAT(people.first_name,\' \',people.last_name) AS name,
			cac.datein,
			cac.dateout,
			TIMESTAMPDIFF(HOUR, cac.datein, cac.dateout) AS duration,
			cac.status');
		$this->db->from('customer_access_control AS cac');
		$this->db->join('customers AS customers', 'cac.customer_id = customers.person_id');
		$this->db->join('people AS people', 'people.person_id = customers.person_id');
		$this->db->join('items AS items', 'cac.item_id = items.item_id');

		if(empty($this->config->item('date_or_time_format')))
		{
			$this->db->where('DATE(cac.datein) >= ' . $this->db->escape($inputs['start_date']) . ' AND (DATE(cac.datein) <=' . $this->db->escape($inputs['end_date']). ')');
		}
		else
		{
			$this->db->where('cac.datein >= ' . $this->db->escape(rawurldecode($inputs['start_date'])) . ' AND (cac.datein <= ' . $this->db->escape(rawurldecode($inputs['end_date']). ')'));
		}

		if($inputs['item_id'] != 'all')
		{
			$this->db->where('cac.item_id',$inputs['item_id']);
		}

		if(!empty($inputs['customer_id']) && $inputs['customer_id'] != 1)
		{
			$this->db->where('cac.customer_id',$inputs['customer_id']);
		}

		$query = $this->db->get();

		//echo $this->db->last_query();

		return $query->result_array();
	}

	public function getSummaryData(array $inputs)
	{
		$this->db->select('COUNT(DISTINCT cac.item_id) AS items_total_count,COUNT(DISTINCT cac.customer_id) AS customers_total_count');
		$this->db->from('customer_access_control AS cac');

		if(empty($this->config->item('date_or_time_format')))
		{
			$this->db->where('DATE(cac.datein) >= ' . $this->db->escape($inputs['start_date']) . ' AND (DATE(cac.datein) <=' . $this->db->escape($inputs['end_date']). ')');
		}
		else
		{
			$this->db->where('cac.datein >= ' . $this->db->escape(rawurldecode($inputs['start_date'])) . ' AND (cac.datein <= ' . $this->db->escape(rawurldecode($inputs['end_date']). ')'));
		}

		if($inputs['item_id'] != 'all')
		{
			$this->db->where('cac.item_id',$inputs['item_id']);
		}

		if(!empty($inputs['customer_id']) && $inputs['customer_id'] != 1)
		{
			$this->db->where('cac.customer_id',$inputs['customer_id']);
		}

		return $this->db->get()->row_array();
	}
}
?>
