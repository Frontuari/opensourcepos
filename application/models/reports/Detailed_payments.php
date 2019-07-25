<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once("Report.php");

class Detailed_payments extends Report
{
	public function create(array $inputs)
	{
		//Create our temp tables to work with the data in our report
		$this->Sale->create_temp_table($inputs);
	}

	public function getDataColumns()
	{
		return array(
			'summary' => array(
				array('id' => $this->lang->line('reports_sale_id')),
				array('type_code' => $this->lang->line('reports_code_type')),
				array('sale_date' => $this->lang->line('reports_date'), 'sortable' => FALSE),
				array('employee_name' => $this->lang->line('reports_sold_by')),
				array('customer_name' => $this->lang->line('reports_sold_to')),
				array('subtotal' => $this->lang->line('reports_subtotal'), 'sorter' => 'number_sorter'),
				array('tax' => $this->lang->line('reports_tax'), 'sorter' => 'number_sorter'),
				array('total' => $this->lang->line('reports_total'), 'sorter' => 'number_sorter'),
				array('payment_type' => $this->lang->line('reports_payment_type'), 'sorter' => 'number_sorter'),
				array('payment_amount' => $this->lang->line('reports_payment_amount')),
				array('bankname' => $this->lang->line('sales_bankname'), 'sorter' => 'number_sorter'),
				array('referenceno' => $this->lang->line('sales_referenceno'), 'sorter' => 'number_sorter'),
				array('transfer_status' => $this->lang->line('reports_payment_status'), 'sorter' => 'number_sorter')
			)
		);
	}

	public function getData(array $inputs)
	{
		$this->db->select('sales_items_temp.sale_id, 
			MAX(CASE
			WHEN sales_items_temp.sale_type = ' . SALE_TYPE_POS . ' && sales_items_temp.sale_status = ' . COMPLETED . ' THEN \'' . $this->lang->line('reports_code_pos') . '\'			
			WHEN sales_items_temp.sale_type = ' . SALE_TYPE_INVOICE . ' && sales_items_temp.sale_status = ' . COMPLETED . ' THEN \'' . $this->lang->line('reports_code_invoice') . '\'
			WHEN sales_items_temp.sale_type = ' . SALE_TYPE_WORK_ORDER . ' && sales_items_temp.sale_status = ' . SUSPENDED . ' THEN \'' . $this->lang->line('reports_code_work_order') . '\'
			WHEN sales_items_temp.sale_type = ' . SALE_TYPE_QUOTE . ' && sales_items_temp.sale_status = ' . SUSPENDED . ' THEN \'' . $this->lang->line('reports_code_quote') . '\'
			WHEN sales_items_temp.sale_type = ' . SALE_TYPE_RETURN . ' && sales_items_temp.sale_status = ' . COMPLETED . ' THEN \'' . $this->lang->line('reports_code_return') . '\'
			WHEN sales_items_temp.sale_status = ' . CANCELED . ' THEN \'' . $this->lang->line('reports_code_canceled') . '\'
			ELSE \'\'
			END) AS type_code,
			MAX(sales_items_temp.sale_status) as sale_status,
			MAX(sales_items_temp.sale_date) AS sale_date,
			MAX(sales_items_temp.employee_name) AS employee_name,
			MAX(sales_items_temp.customer_name) AS customer_name,
			SUM(sales_items_temp.subtotal) AS subtotal,
			SUM(sales_items_temp.tax) AS tax,
			SUM(sales_items_temp.total) AS total,
			sales_payments.payment_type,
			sales_payments.payment_amount,
			sales_payments.bankname,
			sales_payments.referenceno,
			CASE 
				WHEN sales_payments.payment_type = \''. $this->lang->line('sales_deposit') .'\' AND sales_payments.transfer_status = '. PAYMENT_STATUS_IP .' THEN \'' . $this->lang->line('reports_payment_status_ip') . '\'
				WHEN sales_payments.payment_type = \''. $this->lang->line('sales_deposit') .'\' AND sales_payments.transfer_status = '. PAYMENT_STATUS_CO .' THEN \'' . $this->lang->line('reports_payment_status_co') . '\'
				WHEN sales_payments.payment_type = \''. $this->lang->line('sales_deposit') .'\' AND sales_payments.transfer_status = '. PAYMENT_STATUS_VO .' THEN \'' . $this->lang->line('reports_payment_status_vo') . '\'
				ELSE \'' . $this->lang->line('reports_payment_status_na') . '\'
			END AS transfer_status');

		$this->db->from('sales_items_temp AS sales_items_temp ');
		$this->db->join('sales_payments AS sales_payments', 'sales_items_temp.sale_id = sales_payments.sale_id');

		if(!empty($inputs['location_id']) && $inputs['location_id'] != 'all')
		{
			$this->db->where('sales_items_temp.item_location', $inputs['location_id']);
		}

		if($inputs['sale_type'] == 'complete')
		{
			$this->db->where('sales_items_temp.sale_status', COMPLETED);
			$this->db->group_start();
			$this->db->where('sales_items_temp.sale_type', SALE_TYPE_POS);
			$this->db->or_where('sales_items_temp.sale_type', SALE_TYPE_INVOICE);
			$this->db->or_where('sales_items_temp.sale_type', SALE_TYPE_RETURN);
			$this->db->group_end();
		}
		elseif($inputs['sale_type'] == 'sales')
		{
			$this->db->where('sales_items_temp.sale_status', COMPLETED);
			$this->db->group_start();
			$this->db->where('sales_items_temp.sale_type', SALE_TYPE_POS);
			$this->db->or_where('sales_items_temp.sale_type', SALE_TYPE_INVOICE);
			$this->db->group_end();
		}
		elseif($inputs['sale_type'] == 'quotes')
		{
			$this->db->where('sales_items_temp.sale_status', SUSPENDED);
			$this->db->where('sales_items_temp.sale_type', SALE_TYPE_QUOTE);
		}
		elseif($inputs['sale_type'] == 'work_orders')
		{
			$this->db->where('sales_items_temp.sale_status', SUSPENDED);
			$this->db->where('sales_items_temp.sale_type', SALE_TYPE_WORK_ORDER);
		}
		elseif($inputs['sale_type'] == 'canceled')
		{
			$this->db->where('sales_items_temp.sale_status', CANCELED);
		}
		elseif($inputs['sale_type'] == 'returns')
		{
			$this->db->where('sales_items_temp.sale_status', COMPLETED);
			$this->db->where('sales_items_temp.sale_type', SALE_TYPE_RETURN);
		}

		if(!empty($inputs['payment_type']) && $inputs['payment_type'] != 'all')
		{
			$this->db->like('sales_items_temp.payment_type', rawurldecode($inputs['payment_type']));
		}

		$this->db->group_by(array('sales_items_temp.sale_id','sales_payments.payment_type','sales_payments.payment_amount'
			,'sales_payments.bankname','sales_payments.referenceno','sales_payments.transfer_status'));
		$this->db->order_by('MAX(sales_items_temp.sale_date)');

		$query = $this->db->get();

		//echo $this->db->last_query();

		return $query->result_array();
	}

	public function getSummaryData(array $inputs)
	{
		$this->db->select('SUM(subtotal) AS subtotal, SUM(tax) AS tax, SUM(total) AS total');
		$this->db->from('sales_items_temp');

		if($inputs['location_id'] != 'all')
		{
			$this->db->where('item_location', $inputs['location_id']);
		}

		if($inputs['sale_type'] == 'complete')
		{
			$this->db->where('sale_status', COMPLETED);
			$this->db->group_start();
			$this->db->where('sale_type', SALE_TYPE_POS);
			$this->db->or_where('sale_type', SALE_TYPE_INVOICE);
			$this->db->or_where('sale_type', SALE_TYPE_RETURN);
			$this->db->group_end();
		}
		elseif($inputs['sale_type'] == 'sales')
		{
			$this->db->where('sale_status', COMPLETED);
			$this->db->group_start();
			$this->db->where('sale_type', SALE_TYPE_POS);
			$this->db->or_where('sale_type', SALE_TYPE_INVOICE);
			$this->db->group_end();
		}
		elseif($inputs['sale_type'] == 'quotes')
		{
			$this->db->where('sale_status', SUSPENDED);
			$this->db->where('sale_type', SALE_TYPE_QUOTE);
		}
		elseif($inputs['sale_type'] == 'work_orders')
		{
			$this->db->where('sale_status', SUSPENDED);
			$this->db->where('sale_type', SALE_TYPE_WORK_ORDER);
		}
		elseif($inputs['sale_type'] == 'canceled')
		{
			$this->db->where('sale_status', CANCELED);
		}
		elseif($inputs['sale_type'] == 'returns')
		{
			$this->db->where('sale_status', COMPLETED);
			$this->db->where('sale_type', SALE_TYPE_RETURN);
		}

		if(!empty($inputs['payment_type']) && $inputs['payment_type'] != 'all')
		{
			$this->db->like('sales_items_temp.payment_type',rawurldecode($inputs['payment_type']));
		}

		return $this->db->get()->row_array();
	}
}
?>
