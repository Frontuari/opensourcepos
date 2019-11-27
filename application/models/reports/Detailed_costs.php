<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once("Report.php");

class Detailed_costs extends Report
{

	public function getDataColumns()
	{
		return array(
			'summary' => array(
				array('id' => $this->lang->line('costs_cost_id')),
				array('documentno' => $this->lang->line('costs_documentno')),
				array('documentdate' => $this->lang->line('costs_documentdate'), 'sortable' => FALSE),
				array('person_name' => $this->lang->line('costs_person')),
				array('cash_concept' => $this->lang->line('costs_cash_concept_id')),
				array('movementtype' => $this->lang->line('expenses_payment'), 'sortable' => FALSE),
				array('total' => $this->lang->line('reports_total'), 'sorter' => 'number_sorter'),
				array('detail' => $this->lang->line('costs_detail')))
		);
	}

	public function getData(array $inputs)
	{
		$this->db->select('cost_id,
			documentno,
			documentdate,
			CONCAT(first_name,\' \',last_name) AS person_name,
			name AS cash_concept,
			movementtype,
			costs.amount AS total,
			detail');
		$this->db->from('costs');
		$this->db->join('cash_concepts','cash_concepts.cash_concept_id = costs.cash_subconcept_id');
    $this->db->join('people','people.person_id = costs.person_id');
		$this->db->join('cash_daily','costs.cost_id = cash_daily.reference_id AND cash_daily.table_reference = \'costs\'');
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
		$this->db->select('SUM(costs.amount) AS total');
		$this->db->from('costs AS costs');
		$this->db->join('cash_daily','costs.cost_id = cash_daily.reference_id AND cash_daily.table_reference = \'costs\'');
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
