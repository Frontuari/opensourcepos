<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once("Summary_report.php");

class Summary_expenses_categories extends Summary_report
{
	protected function _get_data_columns()
	{
		return array(
			array('category_name' => $this->lang->line('reports_expenses_category')),
			array('count' => $this->lang->line('reports_count')),
			array('total_amount' => $this->lang->line('reports_expenses_amount'), 'sorter' => 'number_sorter'));
	}

	public function getData(array $inputs)
	{
		$this->db->select('cash_concepts.name AS category_name, COUNT(expenses.expense_id) AS count, SUM(expenses.amount) AS total_amount');
		$this->db->from('expenses AS expenses');
		$this->db->join('cash_concepts AS cash_concepts', 'cash_concepts.cash_concept_id = expenses.cash_concept_id', 'LEFT');

		if(empty($this->config->item('date_or_time_format')))
		{
			$this->db->where('DATE(expenses.documentdate) BETWEEN ' . $this->db->escape($inputs['start_date']) . ' AND ' . $this->db->escape($inputs['end_date']));
		}
		else
		{
			$this->db->where('expenses.documentdate BETWEEN ' . $this->db->escape(rawurldecode($inputs['start_date'])) . ' AND ' . $this->db->escape(rawurldecode($inputs['end_date'])));
		}

		$this->db->where('expenses.deleted', 0);

		$this->db->group_by('cash_concepts.name');
		$this->db->order_by('cash_concepts.name');

		return $this->db->get()->result_array();
	}

	public function getSummaryData(array $inputs)
	{
		$this->db->select('SUM(expenses.amount) AS expenses_total_amount');
		$this->db->from('expenses AS expenses');

		if(empty($this->config->item('date_or_time_format')))
		{
			$this->db->where('DATE(expenses.documentdate) BETWEEN ' . $this->db->escape($inputs['start_date']) . ' AND ' . $this->db->escape($inputs['end_date']));
		}
		else
		{
			$this->db->where('expenses.documentdate BETWEEN ' . $this->db->escape(rawurldecode($inputs['start_date'])) . ' AND ' . $this->db->escape(rawurldecode($inputs['end_date'])));
		}

		$this->db->where('expenses.deleted', 0);

		return $this->db->get()->row_array();
	}
}
?>
