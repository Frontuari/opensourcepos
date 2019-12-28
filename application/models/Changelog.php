<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Changelog class
 */

class Changelog extends CI_Model
{
	public function insert($changelog_data)
	{
		return $this->db->insert('customer_changelog', $changelog_data);
	}

	public function get_changelog_data_for_customer($customer_id)
	{
		$this->db->from('customer_changelog');
		$this->db->where('trans_customer', $customer_id);
		$this->db->order_by('trans_date', 'desc');

		return $this->db->get();
	}
}
?>
