<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once("Summary_report.php");

class Summary_overall_cashs extends Summary_report
{

  protected function _get_data_columns()
	{
		return array();
	}

	public function getData(array $inputs)
	{

    $commitdata = array();

    $this->db->select('MIN(oc.startbalance) AS startbalance,MIN(oc.usdstartbalance) AS usdstartbalance,
			SUM(COALESCE((CASE WHEN cf.operation_type = 1 AND cf.currency = \'' . CURRENCY . '\' THEN cf.amount ELSE 0 END),0)) AS income,
			SUM(COALESCE((CASE WHEN cf.operation_type = 0 AND cf.currency = \'' . CURRENCY . '\' THEN cf.amount ELSE 0 END),0)) AS cost,
			SUM(COALESCE((CASE WHEN cf.operation_type = 2 AND cf.currency = \'' . CURRENCY . '\' THEN cf.amount ELSE 0 END),0)) AS purchase,
			SUM(COALESCE((CASE WHEN cf.operation_type = 1 AND cf.currency = \'' . USDCURRENCY . '\' THEN cf.amount ELSE 0 END),0)) AS usdincome,
			SUM(COALESCE((CASE WHEN cf.operation_type = 0 AND cf.currency = \'' . USDCURRENCY . '\' THEN cf.amount ELSE 0 END),0)) AS usdcost,
			SUM(COALESCE((CASE WHEN cf.operation_type = 2 AND cf.currency = \'' . USDCURRENCY . '\' THEN cf.amount ELSE 0 END),0)) AS usdpurchase,
			SUM(COALESCE((CASE WHEN cf.currency = \''. CURRENCY .'\' THEN cf.amount * (CASE WHEN cf.operation_type = 1 THEN 1 ELSE -1 END) ELSE 0 END),0)) AS endingbalance,
			SUM(COALESCE((CASE WHEN cf.currency = \''. USDCURRENCY .'\' THEN cf.amount * (CASE WHEN cf.operation_type = 1 THEN 1 ELSE -1 END) ELSE 0 END),0)) AS usdendingbalance
			');
		$this->db->from('overall_cashs oc');
		$this->db->join('cash_flow AS cf','cf.overall_cash_id = oc.overall_cash_id AND cf.deleted = 0','LEFT');

    if(empty($this->config->item('date_or_time_format')))
		{
			$this->db->where('DATE(cf.movementdate) BETWEEN ' . $this->db->escape($inputs['start_date']) . ' AND ' . $this->db->escape($inputs['end_date']));
		}
		else
		{
			$this->db->where('cf.movementdate BETWEEN ' . $this->db->escape(rawurldecode($inputs['start_date'])) . ' AND ' . $this->db->escape(rawurldecode($inputs['end_date'])));
		}

		$query = $this->db->get();

		if($query->num_rows() == 1)
		{
			$commitdata['overall_cash_summary'] = $query->row();
		}

		return $commitdata;
	}
}
?>
