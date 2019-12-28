<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once("Secure_Controller.php");

class Price_conversions extends Secure_Controller
{
	public function __construct()
	{
		parent::__construct('price_conversions');
	}

	public function index()
	{
		 $data['table_headers'] = $this->xss_clean(get_price_conversion_manage_table_headers());

		 $this->load->view('price_conversions/manage', $data);
	}

	/*
	Returns price_conversion_manage table data rows. This will be called with AJAX.
	*/
	public function search()
	{
		$search = $this->input->get('search');
		$limit  = $this->input->get('limit');
		$offset = $this->input->get('offset');
		$sort   = $this->input->get('sort');
		$order  = $this->input->get('order');

		$price_conversions = $this->Price_conversion->search($search, $limit, $offset, $sort, $order);
		$total_rows = $this->Price_conversion->get_found_rows($search);

		$data_rows = array();
		foreach($price_conversions->result() as $price_conversion)
		{
			$data_rows[] = $this->xss_clean(get_price_conversion_data_row($price_conversion));
		}

		echo json_encode(array('total' => $total_rows, 'rows' => $data_rows));
	}

	public function get_row($row_id)
	{
		$data_row = $this->xss_clean(get_price_conversion_data_row($this->Price_conversion->get_info($row_id)));

		echo json_encode($data_row);
	}

	public function view($price_id = -1)
	{
		$data['price_info'] = $this->Price_conversion->get_info($price_id);

		if(empty($data['price_info']->valid_from))
		{
			$data['price_info']->valid_from = date('Y-m-d H:i:s');
		}

		$this->load->view("price_conversions/form", $data);
	}

	public function save($price_id = -1)
	{

		$valid_from = $this->input->post('valid_from');
		$valid_from_formatter = date_create_from_format($this->config->item('dateformat') . ' ' . $this->config->item('timeformat'), $valid_from);
		
		$price_conversion_data = array(
			'valid_from' => $valid_from_formatter->format('Y-m-d H:i:s'),
			'price' => $this->input->post('price'),
			'currency_code' => $this->input->post('currency_code')
		);

		if($this->Price_conversion->save($price_conversion_data, $price_id))
		{
			$price_conversion_data = $this->xss_clean($price_conversion_data);

			// New price_id
			if($price_id == -1)
			{
				echo json_encode(array('success' => TRUE, 'message' => $this->lang->line('price_conversions_successful_adding'), 'id' => $price_conversion_data['price_id']));
			}
			else // Existing Expense Category
			{
				echo json_encode(array('success' => TRUE, 'message' => $this->lang->line('price_conversions_successful_updating'), 'id' => $price_id));
			}
		}
		else//failure
		{
			echo json_encode(array('success' => FALSE, 'message' => $this->lang->line('price_conversions_error_adding_updating') . ' ' . $price_conversion_data['price_name'], 'id' => -1));
		}
	}

	public function delete()
	{
		$price_conversion_to_delete = $this->input->post('ids');

		if($this->Price_conversion->delete_list($price_conversion_to_delete))
		{
			echo json_encode(array('success' => TRUE, 'message' => $this->lang->line('price_conversions_successful_deleted') . ' ' . count($price_conversion_to_delete) . ' ' . $this->lang->line('price_conversions_one_or_multiple')));
		}
		else
		{
			echo json_encode(array('success' => FALSE, 'message' => $this->lang->line('price_conversions_cannot_be_deleted')));
		}
	}
}
?>
