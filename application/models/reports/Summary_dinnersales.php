<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once("Summary_report.php");

class Summary_dinnersales extends Summary_report
{
	protected function _get_data_columns()
	{
		return array(
			array('dinner_table' => $this->lang->line('sales_table'), 'sortable' => FALSE),
			array('quantity' => $this->lang->line('reports_quantity')),
			array('subtotal' => $this->lang->line('reports_subtotal'), 'sorter' => 'number_sorter'),
			array('tax' => $this->lang->line('reports_tax'), 'sorter' => 'number_sorter'),
			array('total' => $this->lang->line('reports_total'), 'sorter' => 'number_sorter'),
			array('cost' => $this->lang->line('reports_cost'), 'sorter' => 'number_sorter'),
			array('profit' => $this->lang->line('reports_profit'), 'sorter' => 'number_sorter'));
	}

	protected function _select(array $inputs)
	{
		parent::_select($inputs);

		$this->db->select('
				(CASE WHEN sales.dinner_table_id=1 || sales.dinner_table_id=2 THEN dinner_tables.name ELSE \'Restaurante\' END) AS dinner_table,
				SUM(sales_items.quantity_purchased) AS quantity_purchased
		');
	}

	protected function _group_order()
	{
		$this->db->group_by('6');
		$this->db->order_by('6');
	}
}
?>
