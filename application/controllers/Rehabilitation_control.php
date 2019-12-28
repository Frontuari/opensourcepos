<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once("Secure_Controller.php");

class Rehabilitation_control extends Secure_Controller 
{
	function __construct()
	{
		parent::__construct('rehabilitation_control');
	}

	public function index()
	{
		$this->load->view('rehabilitation_control/index',$data);
	}

	/*
	Change employee password
	*/
	public function save()
	{
		$customer_id = $this->input->post('customer_id');
		$dateaccess_formatter = date_create_from_format($this->config->item('dateformat'). ' ' .$this->config->item('timeformat'), $this->input->post('dateaccess'));
		$sale_id = $this->input->post('sale_id');
		$item_id = $this->input->post('item_id');
		$onhand = $this->input->post('onhand');
		$used = $this->input->post('used');

		$insert = FALSE;

		$this->Customer->set_log("<< Start Log >>");

		$access_data = array(
			'customer_id' => $customer_id,
			'datein' => $dateaccess_formatter->format('Y-m-d H:i:s'),
			'sale_id' => $sale_id,
			'onhand' => ($onhand-1),
			'used' => ($used+1),
			'item_id' => $item_id
		);
		$insert = FALSE;

		$response = array();

		if($this->Customer->save_rehabilitation_control($access_data, $customer_id,$insert))
		{
			$this->Customer->set_log("<< End Log >>");
			if($insert)
			{
				$response[] = array('success' => TRUE, 'message' => $this->lang->line('customers_insert_rehabilitation_control'));
			}
			else
			{
				$response[] = array('success' => TRUE, 'message' => $this->lang->line('customers_update_rehabilitation_control'));
			}
		}
		else // Failure
		{
			$this->Customer->set_log("<< End Log >>");
			//	Use get_log method for debugg
			// --> $this->Customer->get_log().'<br>'.
			$response[] = array('success' => TRUE, 'message' => $this->lang->line('customers_error_adding_updating_rehabilitation_control'));
		}

		echo utf8_encode(json_encode($this->xss_clean($response)));

	}
}
?>
