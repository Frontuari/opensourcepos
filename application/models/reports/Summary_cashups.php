<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once("Summary_report.php");

class Summary_cashups extends Summary_report
{

  protected function _get_data_columns()
	{
		return array();
	}

	public function getData(array $inputs)
	{

    $commitdata = array();

    if(empty($this->config->item('date_or_time_format')))
		{
      $beginfilterdate = ' AND DATE(cd.movementdate) < ' . $this->db->escape($inputs['start_date']);
			$filterdate = ' AND DATE(cd.movementdate) BETWEEN ' . $this->db->escape($inputs['start_date']) . ' AND ' . $this->db->escape($inputs['end_date']);
		}
		else
		{
      $beginfilterdate = ' AND cd.movementdate < ' . $this->db->escape(rawurldecode($inputs['start_date']));
			$filterdate = ' AND cd.movementdate BETWEEN ' . $this->db->escape(rawurldecode($inputs['start_date'])) . ' AND ' . $this->db->escape(rawurldecode($inputs['end_date']));
		}
    //  Initial Balance
    $query = $this->db->query("SELECT SUM(amount * (CASE WHEN cd.operation_type = 1 THEN 1 ELSE -1 END)) AS balance
			FROM ". $this->db->dbprefix('cash_daily')." AS cd
			WHERE cd.deleted = 0 $beginfilterdate");

		if($query->num_rows() == 1)
		{
			$commitdata['initial_balance'] = $query->row()->balance;
		}
    $query = null;
    //  Incomes
    $query = $this->db->query("
			SELECT SUM(COALESCE(cd.amount,0)) AS balance
			FROM ".$this->db->dbprefix('cash_daily')." cd
			WHERE cd.deleted = 0 AND cd.table_reference = 'incomes' $filterdate");

		if($query->num_rows() == 1)
		{
			$commitdata['receipt_income'] = $query->row()->balance;
		}

    $query = null;
    //  Sales
    $query = $this->db->query("
			SELECT SUM(COALESCE(cd.amount,0)) AS balance
			FROM ".$this->db->dbprefix('cash_daily')." cd
			WHERE cd.deleted = 0 $filterdate
			AND cd.cash_concept_id IN (SELECT COALESCE(sc.cash_concept_id,cc.cash_concept_id) FROM ".$this->db->dbprefix('cash_concepts')." sc
			RIGHT JOIN ".$this->db->dbprefix('cash_concepts')." cc ON sc.cash_concept_parent_id = cc.cash_concept_id
			WHERE cc.code = '00-01-01')");

		if($query->num_rows() == 1)
		{
			$commitdata['sales'] = $query->row()->balance;
		}

    $query = null;
    //  Open Cash
    $query = $this->db->query("
			SELECT SUM(COALESCE(cd.amount,0)) AS balance
			FROM ".$this->db->dbprefix('cash_daily')." cd
			WHERE cd.deleted = 0 $filterdate
			AND cd.cash_concept_id IN (SELECT COALESCE(sc.cash_concept_id,cc.cash_concept_id) FROM ".$this->db->dbprefix('cash_concepts')." sc
			RIGHT JOIN ".$this->db->dbprefix('cash_concepts')." cc ON sc.cash_concept_parent_id = cc.cash_concept_id
			WHERE cc.code = '00-01-00')");

		if($query->num_rows() == 1)
		{
			$commitdata['open_cash'] = $query->row()->balance;
		}

    $query = null;
    //  Costs
    $query = $this->db->query("
			SELECT SUM(COALESCE(cd.amount,0)) AS balance
			FROM ".$this->db->dbprefix('cash_daily')." cd
			WHERE cd.deleted = 0 AND cd.table_reference = 'costs' $filterdate ");

		if($query->num_rows() == 1)
		{
			$commitdata['receipt_cost'] = $query->row()->balance;
		}

    $query = null;
    //  Expenses
    $this->db->select('cc.cash_concept_id,cc.code,cc.name AS concept,SUM(cd.amount) AS balance');
		$this->db->from('cash_daily AS cd');
		$this->db->join('cash_concepts AS cc','cc.cash_concept_id = cd.cash_concept_id');
		$this->db->where('cc.concept_type',3);
		$this->db->where('cd.deleted',0);
    if(empty($this->config->item('date_or_time_format')))
		{
			$this->db->where('DATE(cd.movementdate) BETWEEN ' . $this->db->escape($inputs['start_date']) . ' AND ' . $this->db->escape($inputs['end_date']));
		}
		else
		{
			$this->db->where('cd.movementdate BETWEEN ' . $this->db->escape(rawurldecode($inputs['start_date'])) . ' AND ' . $this->db->escape(rawurldecode($inputs['end_date'])));
		}
		$this->db->group_by(array('cc.cash_concept_id','cc.code','cc.name'));
		$this->db->order_by(array('cc.cash_concept_id','cc.code','cc.name'));

		$query = $this->db->get();

		if($query->num_rows() >= 1)
		{
			$commitdata['expenses'] = $query->result();
      $expense_amt = 0;
      foreach($query->result() AS $row)
      {
        $expense_amt = $expense_amt + (!empty($row->balance) ? $row->balance : 0);
      }
      $commitdata['expense_amt'] = $expense_amt;
		}

		return $commitdata;
	}
}
?>
