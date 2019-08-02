<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once("Persons.php");

class Customers extends Persons
{
	private $_list_id;

	public function __construct()
	{
		parent::__construct('customers');

		$this->load->library('mailchimp_lib');

		$CI =& get_instance();

		$this->_list_id = $CI->encryption->decrypt($CI->Appconfig->get('mailchimp_list_id'));
	}

	public function index()
	{
		$data['table_headers'] = $this->xss_clean(get_customer_manage_table_headers());

		$this->load->view('people/manage', $data);
	}

	/*
	Gives search suggestions based on what is being searched for
	*/
	public function get_row_by_dni($dni)
	{
		$data_row = $this->Person->get_info_by_dni($dni);
		foreach(get_object_vars($data_row) as $property => $value)
		{
			$data_row->$property = $this->xss_clean($value);
		}
		echo json_encode($data_row);
	}

	/*
	Gets one row for a customer manage table. This is called using AJAX to update one row.
	*/
	public function get_row($row_id)
	{
		$person = $this->Customer->get_info($row_id);

		// retrieve the total amount the customer spent so far together with min, max and average values
		$stats = $this->Customer->get_stats($person->person_id);
		if(empty($stats))
		{
			//create object with empty properties.
			$stats = new stdClass;
			$stats->total = 0;
			$stats->min = 0;
			$stats->max = 0;
			$stats->average = 0;
			$stats->avg_discount = 0;
			$stats->quantity = 0;
		}

		$data_row = $this->xss_clean(get_customer_data_row($person, $stats));

		echo json_encode($data_row);
	}

	/*
	Returns customer table data rows. This will be called with AJAX.
	*/
	public function search()
	{
		$search = $this->input->get('search');
		$limit  = $this->input->get('limit');
		$offset = $this->input->get('offset');
		$sort   = $this->input->get('sort');
		$order  = $this->input->get('order');

		$customers = $this->Customer->search($search, $limit, $offset, $sort, $order);
		$total_rows = $this->Customer->get_found_rows($search);

		$data_rows = array();
		foreach($customers->result() as $person)
		{
			// retrieve the total amount the customer spent so far together with min, max and average values
			$stats = $this->Customer->get_stats($person->person_id);
			if(empty($stats))
			{
				//create object with empty properties.
				$stats = new stdClass;
				$stats->total = 0;
				$stats->min = 0;
				$stats->max = 0;
				$stats->average = 0;
				$stats->avg_discount = 0;
				$stats->quantity = 0;
			}

			$data_rows[] = $this->xss_clean(get_customer_data_row($person, $stats));

			if($person->pic_filename!='')
			{
				$this->_update_pic_filename($person);
			}
		}

		echo json_encode(array('total' => $total_rows, 'rows' => $data_rows));
	}

	/*
	Gives search suggestions based on what is being searched for
	*/
	public function suggest()
	{
		$suggestions = $this->xss_clean($this->Customer->get_search_suggestions($this->input->get('term'), TRUE));

		echo json_encode($suggestions);
	}

	public function suggest_search()
	{
		$suggestions = $this->xss_clean($this->Customer->get_search_suggestions($this->input->post('term'), FALSE));

		echo json_encode($suggestions);
	}

	/*
	Loads the customer edit form
	*/
	public function view($customer_id = -1)
	{
		$info = $this->Customer->get_info($customer_id);
		foreach(get_object_vars($info) as $property => $value)
		{
			$info->$property = $this->xss_clean($value);
		}
		$data['person_info'] = $info;

		if(empty($info->person_id) || empty($info->date) || empty($info->employee_id))
		{
			$data['person_info']->date = date('Y-m-d H:i:s');
			$data['person_info']->employee_id = $this->Employee->get_logged_in_employee_info()->person_id;
		}

		$employee_info = $this->Employee->get_info($info->employee_id);
		$data['employee'] = $this->xss_clean($employee_info->first_name . ' ' . $employee_info->last_name);

		$tax_code_info = $this->Tax_code->get_info($info->sales_tax_code_id);
		$tax_code_id = $tax_code_info->tax_code_id;

		if($tax_code_info->tax_code != NULL)
		{
			$data['sales_tax_code_label'] = $this->xss_clean($tax_code_info->tax_code . ' ' . $tax_code_info->tax_code_name);
		}
		else
		{
			$data['sales_tax_code_label'] = '';
		}

		$packages = array('' => $this->lang->line('items_none'));
		foreach($this->Customer_rewards->get_all()->result_array() as $row)
		{
			$packages[$this->xss_clean($row['package_id'])] = $this->xss_clean($row['package_name']);
		}
		$data['packages'] = $packages;
		$data['selected_package'] = $info->package_id;

		if($this->config->item('use_destination_based_tax') == '1')
		{
			$data['use_destination_based_tax'] = TRUE;
		}
		else
		{
			$data['use_destination_based_tax'] = FALSE;
		}

		// retrieve the total amount the customer spent so far together with min, max and average values
		$stats = $this->Customer->get_stats($customer_id);
		if(!empty($stats))
		{
			foreach(get_object_vars($stats) as $property => $value)
			{
				$info->$property = $this->xss_clean($value);
			}
			$data['stats'] = $stats;
		}

		// retrieve the info from Mailchimp only if there is an email address assigned
		if(!empty($info->email))
		{
			// collect mailchimp customer info
			if(($mailchimp_info = $this->mailchimp_lib->getMemberInfo($this->_list_id, $info->email)) !== FALSE)
			{
				$data['mailchimp_info'] = $this->xss_clean($mailchimp_info);

				// collect customer mailchimp emails activities (stats)
				if(($activities = $this->mailchimp_lib->getMemberActivity($this->_list_id, $info->email)) !== FALSE)
				{
					if(array_key_exists('activity', $activities))
					{
						$open = 0;
						$unopen = 0;
						$click = 0;
						$total = 0;
						$lastopen = '';

						foreach($activities['activity'] as $activity)
						{
							if($activity['action'] == 'sent')
							{
								++$unopen;
							}
							elseif($activity['action'] == 'open')
							{
								if(empty($lastopen))
								{
									$lastopen = substr($activity['timestamp'], 0, 10);
								}
								++$open;
							}
							elseif($activity['action'] == 'click')
							{
								if(empty($lastopen))
								{
									$lastopen = substr($activity['timestamp'], 0, 10);
								}
								++$click;
							}

							++$total;
						}

						$data['mailchimp_activity']['total'] = $total;
						$data['mailchimp_activity']['open'] = $open;
						$data['mailchimp_activity']['unopen'] = $unopen;
						$data['mailchimp_activity']['click'] = $click;
						$data['mailchimp_activity']['lastopen'] = $lastopen;
					}
				}
			}
		}

		$data['logo_exists'] = $info->pic_filename != '';
		$ext = pathinfo($info->pic_filename, PATHINFO_EXTENSION);
		if($ext == '')
		{
			// if file extension is not found guess it (legacy)
			$images = glob('./uploads/customer_pics/' . $info->pic_filename . '.*');
		}
		else
		{
			// else just pick that file
			$images = glob('./uploads/customer_pics/' . $info->pic_filename);
		}
		$data['image_path'] = sizeof($images) > 0 ? base_url($images[0]) : '';


		$this->load->view("customers/form", $data);
	}

	public function discipline($customer_id)
	{
		$info = $this->Customer->get_info($customer_id);
		foreach(get_object_vars($info) as $property => $value)
		{
			$info->$property = $this->xss_clean($value);
		}
		$data['person_info'] = $info;

		if(empty($info->person_id) || empty($info->date) || empty($info->employee_id))
		{
			$data['person_info']->date = date('Y-m-d H:i:s');
			$data['person_info']->employee_id = $this->Employee->get_logged_in_employee_info()->person_id;
		}

		$employee_info = $this->Employee->get_info($info->employee_id);
		$data['employee'] = $this->xss_clean($employee_info->first_name . ' ' . $employee_info->last_name);

		$items = $this->Item->get_item_memberships();
		$data['items'] = $items;
		$data['selected_item'] = $info->discipline_id;

		$this->load->view("customers/form_discipline", $data);
	}

	public function rehabilitation($customer_id)
	{
		$info = $this->Customer->get_info($customer_id);
		foreach(get_object_vars($info) as $property => $value)
		{
			$info->$property = $this->xss_clean($value);
		}
		$data['person_info'] = $info;

		if(empty($info->person_id) || empty($info->date) || empty($info->employee_id))
		{
			$data['person_info']->date = date('Y-m-d H:i:s');
			$data['person_info']->employee_id = $this->Employee->get_logged_in_employee_info()->person_id;
		}

		$employee_info = $this->Employee->get_info($info->employee_id);
		$data['employee'] = $this->xss_clean($employee_info->first_name . ' ' . $employee_info->last_name);

		$items = $this->Item->get_item_rehabilitations();
		$data['items'] = $items;
		$data['selected_item'] = $info->rehabilitation_id;

		$this->load->view("customers/form_rehabilitation", $data);
	}

	/*
	Inserts/updates a customer
	*/
	public function save($customer_id = -1)
	{

		$this->Customer->set_log("<< Start Log >>");

		$upload_success = $this->_handle_image_upload();
		$upload_data = $this->upload->data();

		$first_name = $this->xss_clean($this->input->post('first_name'));
		$last_name = $this->xss_clean($this->input->post('last_name'));
		$email = $this->xss_clean(strtolower($this->input->post('email')));

		// format first and last name properly
		$first_name = $this->nameize($first_name);
		$last_name = $this->nameize($last_name);

		$person_data = array(
			'dni' => $this->input->post('dni'),
			'first_name' => $first_name,
			'last_name' => $last_name,
			'gender' => $this->input->post('gender'),
			'email' => $email,
			'phone_number' => $this->input->post('phone_number'),
			'address_1' => $this->input->post('address_1'),
			'address_2' => $this->input->post('address_2'),
			'city' => $this->input->post('city'),
			'state' => $this->input->post('state'),
			'zip' => $this->input->post('zip'),
			'country' => $this->input->post('country'),
			'comments' => $this->input->post('comments')
		);

		$date_formatter = date_create_from_format($this->config->item('dateformat') . ' ' . $this->config->item('timeformat'), $this->input->post('date'));

		$customer_data = array(
			'consent' => $this->input->post('consent') != NULL,
			'account_number' => $this->input->post('account_number') == '' ? NULL : $this->input->post('account_number'),
			'tax_id' => $this->input->post('tax_id'),
			'rif' => $this->input->post('rif') == '' ? NULL : $this->input->post('rif'),
			'company_name' => $this->input->post('company_name') == '' ? NULL : $this->input->post('company_name'),
			'discount' => $this->input->post('discount') == '' ? 0.00 : $this->input->post('discount'),
			'discount_type' => $this->input->post('discount_type') == NULL ? PERCENT : $this->input->post('discount_type'),
			'package_id' => $this->input->post('package_id') == '' ? NULL : $this->input->post('package_id'),
			'taxable' => $this->input->post('taxable') != NULL,
			'date' => $date_formatter->format('Y-m-d H:i:s'),
			'employee_id' => $this->input->post('employee_id'),
			'sales_tax_code_id' => $this->input->post('sales_tax_code_id') == '' ? NULL : $this->input->post('sales_tax_code_id'),
			'customer_number' => $this->input->post('customer_number') == '' ? NULL : $this->input->post('customer_number'),
		);

		if(!empty($upload_data['orig_name']))
		{
			// XSS file image sanity check
			if($this->xss_clean($upload_data['raw_name'], TRUE) === TRUE)
			{
				$customer_data['pic_filename'] = $upload_data['raw_name'];
			}
		}

		if($this->Customer->save_customer($person_data, $customer_data, $customer_id))
		{
			// save customer to Mailchimp selected list
			$this->mailchimp_lib->addOrUpdateMember($this->_list_id, $email, $first_name, $last_name, $this->input->post('mailchimp_status'), array('vip' => $this->input->post('mailchimp_vip') != NULL));

			// New customer
			if($customer_id == -1)
			{
				echo json_encode(array('success' => TRUE,
								'message' => $this->lang->line('customers_successful_adding') . ' ' . $first_name . ' ' . $last_name,
								'id' => $this->xss_clean($customer_data['person_id'])));
			}
			else // Existing customer
			{
				echo json_encode(array('success' => TRUE,
								'message' => $this->lang->line('customers_successful_updating') . ' ' . $first_name . ' ' . $last_name,
								'id' => $customer_id));
			}
		}
		else // Failure
		{
			$this->Customer->set_log("<< End Log >>");
			//	Use get_log method for debugg
			// --> $this->Customer->get_log().'<br>'.
			echo json_encode(array('success' => FALSE,
							'message' => $this->lang->line('customers_error_adding_updating') . ' ' . $first_name . ' ' . $last_name,
							'id' => -1));
		}
	}

	public function save_discipline($customer_id)
	{
		$this->Customer->set_log("<< Start Log >>");

		$first_name = $this->xss_clean($this->input->post('first_name'));
		$last_name = $this->xss_clean($this->input->post('last_name'));

		// format first and last name properly
		$first_name = $this->nameize($first_name);
		$last_name = $this->nameize($last_name);

		$duedate_formatter = date_create_from_format($this->config->item('dateformat'), $this->input->post('service_duedate'));

		$customer_data = array(
			'discipline_id' => $this->input->post('discipline_id'),
			'is_exhonerated' => $this->input->post('is_exhonerated') != NULL,
			'service_duedate' => $duedate_formatter->format('Y-m-d'),
			'employee_id' => $this->input->post('employee_id')
		);

		if($this->Customer->save($customer_data, $customer_id))
		{
			echo json_encode(array('success' => TRUE,
								'message' => $this->lang->line('customers_successful_updating') . ' ' . $first_name . ' ' . $last_name,
								'id' => $customer_id));
		}
		else // Failure
		{
			$this->Customer->set_log("<< End Log >>");
			//	Use get_log method for debugg
			// --> $this->Customer->get_log().'<br>'.
			echo json_encode(array('success' => FALSE,
							'message' => $this->lang->line('customers_error_adding_updating') . ' ' . $first_name . ' ' . $last_name,
							'id' => $customer_id));
		}
	}

	public function save_rehabilitation($customer_id)
	{
		$this->Customer->set_log("<< Start Log >>");

		$first_name = $this->xss_clean($this->input->post('first_name'));
		$last_name = $this->xss_clean($this->input->post('last_name'));

		// format first and last name properly
		$first_name = $this->nameize($first_name);
		$last_name = $this->nameize($last_name);

		$customer_data = array(
			'rehabilitation_id' => $this->input->post('rehabilitation_id'),
			'onhand' => $this->input->post('onhand'),
			'used' => $this->input->post('used'),
			'employee_id' => $this->input->post('employee_id')
		);

		if($this->Customer->save($customer_data, $customer_id))
		{
			echo json_encode(array('success' => TRUE,
								'message' => $this->lang->line('customers_successful_updating') . ' ' . $first_name . ' ' . $last_name,
								'id' => $customer_id));
		}
		else // Failure
		{
			$this->Customer->set_log("<< End Log >>");
			//	Use get_log method for debugg
			// --> $this->Customer->get_log().'<br>'.
			echo json_encode(array('success' => FALSE,
							'message' => $this->lang->line('customers_error_adding_updating') . ' ' . $first_name . ' ' . $last_name,
							'id' => $customer_id));
		}
	}

	/*
	AJAX call to verify if an email address already exists
	*/
	public function ajax_check_email()
	{
		$exists = $this->Customer->check_email_exists(strtolower($this->input->post('email')), $this->input->post('person_id'));

		echo !$exists ? 'true' : 'false';
	}

	/*
	AJAX call to verify if an account number already exists
	*/
	public function ajax_check_account_number()
	{
		$exists = $this->Customer->check_account_number_exists($this->input->post('account_number'), $this->input->post('person_id'));

		echo !$exists ? 'true' : 'false';
	}

	/*
	This deletes customers from the customers table
	*/
	public function delete()
	{
		$customers_to_delete = $this->input->post('ids');
		$customers_info = $this->Customer->get_multiple_info($customers_to_delete);

		$count = 0;

		foreach($customers_info->result() as $info)
		{
			if($this->Customer->delete($info->person_id))
			{
				// remove customer from Mailchimp selected list
				$this->mailchimp_lib->removeMember($this->_list_id, $info->email);

				$count++;
			}
		}

		if($count == count($customers_to_delete))
		{
			echo json_encode(array('success' => TRUE,
				'message' => $this->lang->line('customers_successful_deleted') . ' ' . $count . ' ' . $this->lang->line('customers_one_or_multiple')));
		}
		else
		{
			echo json_encode(array('success' => FALSE, 'message' => $this->lang->line('customers_cannot_be_deleted')));
		}
	}

	/*
	Customers import from excel spreadsheet
	*/
	public function excel()
	{
		$name = 'import_customers.csv';
		$data = file_get_contents('../' . $name);
		force_download($name, $data);
	}

	public function excel_import()
	{
		$this->load->view('customers/form_excel_import', NULL);
	}

	public function do_excel_import()
	{
		if($_FILES['file_path']['error'] != UPLOAD_ERR_OK)
		{
			echo json_encode(array('success' => FALSE, 'message' => $this->lang->line('customers_excel_import_failed')));
		}
		else
		{
			if(($handle = fopen($_FILES['file_path']['tmp_name'], 'r')) !== FALSE)
			{
				// Skip the first row as it's the table description
				fgetcsv($handle);
				$i = 1;

				$failCodes = array();

				while(($data = fgetcsv($handle)) !== FALSE)
				{
					// XSS file data sanity check
					$data = $this->xss_clean($data);

					$consent = $data[3] == '' ? 0 : 1;

					if(sizeof($data) >= 16 && $consent)
					{
						$email = strtolower($data[4]);
						$person_data = array(
							'first_name'	=> $data[0],
							'last_name'		=> $data[1],
							'gender'		=> $data[2],
							'email'			=> $email,
							'phone_number'	=> $data[5],
							'address_1'		=> $data[6],
							'address_2'		=> $data[7],
							'city'			=> $data[8],
							'state'			=> $data[9],
							'zip'			=> $data[10],
							'country'		=> $data[11],
							'comments'		=> $data[12]
						);

						$customer_data = array(
							'consent'			=> $consent,
							'company_name'		=> $data[13],
							'discount'			=> $data[15],
							'discount_type'		=> $data[16],
							'taxable'			=> $data[17] == '' ? 0 : 1,
							'date'				=> date('Y-m-d H:i:s'),
							'employee_id'		=> $this->Employee->get_logged_in_employee_info()->person_id
						);
						$account_number = $data[14];

						// don't duplicate people with same email
						$invalidated = $this->Customer->check_email_exists($email);

						if($account_number != '')
						{
							$customer_data['account_number'] = $account_number;
							$invalidated &= $this->Customer->check_account_number_exists($account_number);
						}
					}
					else
					{
						$invalidated = TRUE;
					}

					if($invalidated)
					{
						$failCodes[] = $i;
					}
					elseif($this->Customer->save_customer($person_data, $customer_data))
					{
						// save customer to Mailchimp selected list
						$this->mailchimp_lib->addOrUpdateMember($this->_list_id, $person_data['email'], $person_data['first_name'], '', $person_data['last_name']);
					}
					else
					{
						$failCodes[] = $i;
					}

					++$i;
				}

				if(count($failCodes) > 0)
				{
					$message = $this->lang->line('customers_excel_import_partially_failed') . ' (' . count($failCodes) . '): ' . implode(', ', $failCodes);

					echo json_encode(array('success' => FALSE, 'message' => $message));
				}
				else
				{
					echo json_encode(array('success' => TRUE, 'message' => $this->lang->line('customers_excel_import_success')));
				}
			}
			else
			{
				echo json_encode(array('success' => FALSE, 'message' => $this->lang->line('customers_excel_import_nodata_wrongformat')));
			}
		}
	}

	public function pic_thumb($pic_filename)
	{
		$this->load->helper('file');
		$this->load->library('image_lib');

		// in this context, $pic_filename always has .ext
		$ext = pathinfo($pic_filename, PATHINFO_EXTENSION);
		$images = glob('./uploads/customer_pics/' . $pic_filename);

		// make sure we pick only the file name, without extension
		$base_path = './uploads/customer_pics/' . pathinfo($pic_filename, PATHINFO_FILENAME);
		if(sizeof($images) > 0)
		{
			$image_path = $images[0];
			$thumb_path = $base_path . $this->image_lib->thumb_marker . '.' . $ext;
			if(sizeof($images) < 2)
			{
				$config['image_library'] = 'gd2';
				$config['source_image']  = $image_path;
				$config['maintain_ratio'] = TRUE;
				$config['create_thumb'] = TRUE;
				$config['width'] = 52;
				$config['height'] = 32;
				$this->image_lib->initialize($config);
				$image = $this->image_lib->resize();
				$thumb_path = $this->image_lib->full_dst_path;
			}
			$this->output->set_content_type(get_mime_by_extension($thumb_path));
			$this->output->set_output(file_get_contents($thumb_path));
		}
	}

	public function generate_barcodes($customer_ids)
	{
		$this->load->library('barcode_lib');

		$customer_ids = explode(':', $customer_ids);
		$result = $this->Customer->get_multiple_info($customer_ids)->result_array();
		$config = $this->barcode_lib->get_barcode_config();

		$data['barcode_config'] = $config;

		// check the list of items to see if any item_number field is empty
		foreach($result as &$customer)
		{
			$customer = $this->xss_clean($customer);
			// update the barcode field if empty / NULL with the newly generated barcode
			if(empty($customer['customer_number']) && $this->config->item('barcode_generate_if_empty'))
			{
				// get the newly generated barcode
				$barcode_instance = Barcode_lib::barcode_instance($customer, $config, TRUE);
				$customer['customer_number'] = $barcode_instance->getData();

				$save_customer = array('customer_number' => $customer['customer_number']);
				// update the item in the database in order to save the barcode field
				$this->Customer->save($save_customer, $customer['person_id']);
			}
		}
		$data['items'] = $result;
		$data['customer_barcode'] = TRUE;

		// display barcodes
		$this->load->view('barcodes/barcode_sheet', $data);
	}

	private function _handle_image_upload()
	{
		/* Let files be uploaded with their original name */

		// load upload library
		$config = array('upload_path' => './uploads/customer_pics/',
			'allowed_types' => 'gif|jpg|jpeg|png',
			'max_size' => '0', // 100
			'max_width' => '0', // 640
			'max_height' => '0' // 480
		);
		$this->load->library('upload', $config);
		$this->upload->do_upload('customer_image');

		$this->Customer->set_log($this->upload->display_errors());

		return strlen($this->upload->display_errors()) == 0 || !strcmp($this->upload->display_errors(), '<p>'.$this->lang->line('upload_no_file_selected').'</p>');
	}

	/**
	 * Guess whether file extension is not in the table field, if it isn't, then it's an old-format (formerly pic_id) field, so we guess the right filename and update the table
	 *
	 * @param $item the item to update
	 */
	private function _update_pic_filename($customer)
	{
		$filename = pathinfo($customer->pic_filename, PATHINFO_FILENAME);

		// if the field is empty there's nothing to check
		if(!empty($filename))
		{
			$ext = pathinfo($customer->pic_filename, PATHINFO_EXTENSION);
			if(empty($ext))
			{
				$images = glob('./uploads/customer_pics/' . $customer->pic_filename . '.*');
				if(sizeof($images) > 0)
				{
					$new_pic_filename = pathinfo($images[0], PATHINFO_BASENAME);
					$customer_data = array('pic_filename' => $new_pic_filename);
					$this->Customer->save($customer_data, $customer->person_id);
				}
			}
		}
	}

	/*
	Gives search suggestions based on what is being searched for
	*/
	public function get_status($person_id)
	{
		$suggestions = $this->xss_clean($this->Customer->get_status($person_id));

		echo json_encode($suggestions);
	}

	/*
	Gives search suggestions based on what is being searched for
	*/
	public function check_status($person_id)
	{
		$suggestions = $this->xss_clean($this->Customer->check_status($person_id));

		echo json_encode($suggestions);
	}
}
?>
