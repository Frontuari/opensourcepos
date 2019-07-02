<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once("Secure_Controller.php");

class Access_control extends Secure_Controller 
{
	function __construct()
	{
		parent::__construct('access_control');
	}

	public function index()
	{
		$this->load->view('access_control/index',$data);
	}

	/*
	Change employee password
	*/
	public function save()
	{
		$customer_id = $this->input->post('customer_id');
		$dateaccess = $this->input->post('dateaccess');
		$status = $this->input->post('status');
		$item_id = $this->input->post('item_id');
		$insert = FALSE;

		$this->Customer->set_log("<< Start Log >>");

		if(!$this->Customer->exists_access($customer_id,$dateaccess))
		{
			$access_data = array(
				'customer_id' => $customer_id,
				'datein' => $dateaccess,
				'status' => $status,
				'item_id' => $item_id
			);
			$insert = TRUE;
		}
		else
		{
			$access_data = array(
				'customer_id' => $customer_id,
				'dateout' => $dateaccess,
				'status' => $status,
				'item_id' => $item_id
			);
			$insert = FALSE;
		}

		$response = array();

		if($this->Customer->save_access_control($access_data, $customer_id,$insert))
		{
			if($insert)
			{
				$response[] = array('success' => TRUE, 'message' => $this->lang->line('customers_insert_access_control'));
			}
			else
			{
				$response[] = array('success' => TRUE, 'message' => $this->lang->line('customers_update_access_control'));
			}
		}
		else // Failure
		{
			$this->Customer->set_log("<< End Log >>");
			//	Use get_log method for debugg
			// --> $this->Customer->get_log().'<br>'.
			$response[] = array('success' => TRUE, 'message' => $this->lang->line('customers_error_adding_updating_access_control'));
		}

		echo utf8_encode(json_encode($this->xss_clean($response)));

	}
}
?>
