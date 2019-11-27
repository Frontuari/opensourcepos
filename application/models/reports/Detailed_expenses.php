<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once("Report.php");

class Detailed_expenses extends Report
{

	public function getDataColumns()
	{
		return array(
			'summary' => array(
				array('id' => $this->lang->line('expenses_expense_id')),
				array('documentno' => $this->lang->line('expenses_documentno')),
				array('documentdate' => $this->lang->line('expenses_documentdate'), 'sortable' => FALSE),
				array('person_name' => $this->lang->line('expenses_person')),
				array('cash_concept' => $this->lang->line('costs_cash_concept_id')),
				array('movementtype' => $this->lang->line('expenses_payment'), 'sortable' => FALSE),
				array('total' => $this->lang->line('reports_total'), 'sorter' => 'number_sorter'),
				array('detail' => $this->lang->line('expenses_detail')))
		);
	}

	public function getData(array $inputs)
	{
		$this->db->select('expense_id,
			documentno,
			documentdate,
			person_name,
			name AS cash_concept,
			movementtype,
			expenses.amount AS total,
			detail');
		$this->db->from('expenses');
		$this->db->join('cash_concepts','cash_concepts.cash_concept_id = expenses.cash_concept_id');
		$this->db->join('cash_daily','expenses.expense_id = cash_daily.reference_id AND cash_daily.table_reference = \'expenses\'');
		$this->db->join('cash_up','cash_up.cashup_id = cash_daily.cashup_id');

		if($inputs['employee_id'] != 'all')
		{
			$this->db->where('cash_up.open_employee_id', $inputs['employee_id']);
		}

		if(empty($this->config->item('date_or_time_format')))
		{
			$where .= 'DATE(documentdate) BETWEEN ' . $this->db->escape($inputs['start_date']) . ' AND ' . $this->db->escape($inputs['end_date']);
		}
		else
		{
			$where .= 'documentdate BETWEEN ' . $this->db->escape(rawurldecode($inputs['start_date'])) . ' AND ' . $this->db->escape(rawurldecode($inputs['end_date']));
		}

		$this->db->order_by('documentdate','asc');
		$this->db->order_by('documentno','asc');

		$query = $this->db->get();
		$data = array();
		$data['summary'] = $query->result_array();

		return $data;
	}

	public function getSummaryData(array $inputs)
	{
		$this->db->select('SUM(expenses.amount) AS total');
		$this->db->from('expenses AS expenses');
		$this->db->join('cash_daily','expenses.expense_id = cash_daily.reference_id AND cash_daily.table_reference = \'expenses\'');
		$this->db->join('cash_up','cash_up.cashup_id = cash_daily.cashup_id');

		if($inputs['employee_id'] != 'all')
		{
			$this->db->where('cash_up.open_employee_id', $inputs['employee_id']);
		}

		if(empty($this->config->item('date_or_time_format')))
		{
			$where .= 'DATE(documentdate) BETWEEN ' . $this->db->escape($inputs['start_date']) . ' AND ' . $this->db->escape($inputs['end_date']);
		}
		else
		{
			$where .= 'documentdate BETWEEN ' . $this->db->escape(rawurldecode($inputs['start_date'])) . ' AND ' . $this->db->escape(rawurldecode($inputs['end_date']));
		}

		return $this->db->get()->row_array();
	}
}
?>
