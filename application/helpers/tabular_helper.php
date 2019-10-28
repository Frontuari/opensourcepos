<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Tabular views helper
 */

/*
Basic tabular headers function
*/
function transform_headers_readonly($array)
{
	$result = array();

	foreach($array as $key => $value)
	{
		$result[] = array('field' => $key, 'title' => $value, 'sortable' => $value != '', 'switchable' => !preg_match('(^$|&nbsp)', $value));
	}

	return json_encode($result);
}

/*
Basic tabular headers function
*/
function transform_headers($array, $readonly = FALSE, $editable = TRUE)
{
	$result = array();

	if(!$readonly)
	{
		$array = array_merge(array(array('checkbox' => 'select', 'sortable' => FALSE)), $array);
	}

	if($editable)
	{
		$array[] = array('edit' => '');
	}

	foreach($array as $element)
	{
		reset($element);
		$result[] = array('field' => key($element),
			'title' => current($element),
			'switchable' => isset($element['switchable']) ? $element['switchable'] : !preg_match('(^$|&nbsp)', current($element)),
			'sortable' => isset($element['sortable']) ? $element['sortable'] : current($element) != '',
			'checkbox' => isset($element['checkbox']) ? $element['checkbox'] : FALSE,
			'class' => isset($element['checkbox']) || preg_match('(^$|&nbsp)', current($element)) ? 'print_hide' : '',
			'sorter' => isset($element['sorter']) ? $element ['sorter'] : '');
	}

	return json_encode($result);
}


/*
Get the header for the sales tabular view
*/
function get_sales_manage_table_headers()
{
	$CI =& get_instance();

	$headers = array(
		array('sale_id' => $CI->lang->line('common_id')),
		array('sale_time' => $CI->lang->line('sales_sale_time')),
		array('customer_name' => $CI->lang->line('customers_customer')),
		array('amount_due' => $CI->lang->line('sales_amount_due')),
		array('amount_tendered' => $CI->lang->line('sales_amount_tendered')),
		array('change_due' => $CI->lang->line('sales_change_due')),
		array('payment_type' => $CI->lang->line('sales_payment_type'))
	);

	if($CI->config->item('invoice_enable') == TRUE)
	{
		$headers[] = array('invoice_number' => $CI->lang->line('sales_invoice_number'));
		$headers[] = array('invoice' => '&nbsp', 'sortable' => FALSE);
	}

	$headers[] = array('receipt' => '&nbsp', 'sortable' => FALSE);

	return transform_headers($headers);
}

/*
Get the html data row for the sales
*/
function get_sale_data_row($sale)
{
	$CI =& get_instance();

	$controller_name = $CI->uri->segment(1);

	$row = array (
		'sale_id' => $sale->sale_id,
		'sale_time' => to_datetime(strtotime($sale->sale_time)),
		'customer_name' => $sale->customer_name,
		'amount_due' => to_currency($sale->amount_due),
		'amount_tendered' => to_currency($sale->amount_tendered),
		'change_due' => to_currency($sale->change_due),
		'payment_type' => $sale->payment_type
	);

	if($CI->config->item('invoice_enable'))
	{
		$row['invoice_number'] = $sale->invoice_number;
		$row['invoice'] = empty($sale->invoice_number) ? '' : anchor($controller_name."/invoice/$sale->sale_id", '<span class="glyphicon glyphicon-list-alt"></span>',
			array('title'=>$CI->lang->line('sales_show_invoice'))
		);
	}

	$row['receipt'] = anchor($controller_name."/receipt/$sale->sale_id", '<span class="glyphicon glyphicon-usd"></span>',
		array('title' => $CI->lang->line('sales_show_receipt'))
	);
	$row['edit'] = anchor($controller_name."/edit/$sale->sale_id", '<span class="glyphicon glyphicon-edit"></span>',
		array('class' => 'modal-dlg print_hide', 'data-btn-delete' => $CI->lang->line('common_delete'), 'data-btn-submit' => $CI->lang->line('common_submit'), 'title' => $CI->lang->line($controller_name.'_update'))
	);

	return $row;
}

/*
Get the html data last row for the sales
*/
function get_sale_data_last_row($sales)
{
	$CI =& get_instance();

	$sum_amount_due = 0;
	$sum_amount_tendered = 0;
	$sum_change_due = 0;

	foreach($sales->result() as $key=>$sale)
	{
		$sum_amount_due += $sale->amount_due;
		$sum_amount_tendered += $sale->amount_tendered;
		$sum_change_due += $sale->change_due;
	}

	return array(
		'sale_id' => '-',
		'sale_time' => '<b>'.$CI->lang->line('sales_total').'</b>',
		'amount_due' => '<b>'.to_currency($sum_amount_due).'</b>',
		'amount_tendered' => '<b>'. to_currency($sum_amount_tendered).'</b>',
		'change_due' => '<b>'.to_currency($sum_change_due).'</b>'
	);
}

/*
Get the sales payments summary
*/
function get_sales_manage_payments_summary($payments, $sales)
{
	$CI =& get_instance();

	$table = '<div id="report_summary">';

	foreach($payments as $key=>$payment)
	{
		$amount = $payment['payment_amount'];

		// WARNING: the strong assumption here is that if a change is due it was a cash transaction always
		// therefore we remove from the total cash amount any change due
		if($payment['payment_type'] == $CI->lang->line('sales_cash'))
		{
			foreach($sales->result_array() as $key=>$sale)
			{
				$amount -= $sale['change_due'];
			}
		}
		$table .= '<div class="summary_row">' . $payment['payment_type'] . ': ' . to_currency($amount) . '</div>';
	}
	$table .= '</div>';

	return $table;
}


/*
Get the header for the people tabular view
*/
function get_people_manage_table_headers()
{
	$CI =& get_instance();

	$headers = array(
		array('people.person_id' => $CI->lang->line('common_id')),
		array('last_name' => $CI->lang->line('common_last_name')),
		array('first_name' => $CI->lang->line('common_first_name')),
		array('email' => $CI->lang->line('common_email')),
		array('phone_number' => $CI->lang->line('common_phone_number'))
	);

	if($CI->Employee->has_grant('messages', $CI->session->userdata('person_id')))
	{
		$headers[] = array('messages' => '', 'sortable' => FALSE);
	}

	return transform_headers($headers);
}

/*
Get the html data row for the person
*/
function get_person_data_row($person)
{
	$CI =& get_instance();
	$controller_name = strtolower(get_class($CI));

	return array (
		'people.person_id' => $person->person_id,
		'last_name' => $person->last_name,
		'first_name' => $person->first_name,
		'email' => empty($person->email) ? '' : mailto($person->email, $person->email),
		'phone_number' => $person->phone_number,
		'messages' => empty($person->phone_number) ? '' : anchor("Messages/view/$person->person_id", '<span class="glyphicon glyphicon-phone"></span>',
			array('class'=>'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title'=>$CI->lang->line('messages_sms_send'))),
		'edit' => anchor($controller_name."/view/$person->person_id", '<span class="glyphicon glyphicon-edit"></span>',
			array('class'=>'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title'=>$CI->lang->line($controller_name.'_update'))
		)
	);
}


/*
Get the header for the customer tabular view
*/
function get_customer_manage_table_headers()
{
	$CI =& get_instance();

	$headers = array(
		array('people.person_id' => $CI->lang->line('common_id')),
		array('last_name' => $CI->lang->line('common_last_name')),
		array('first_name' => $CI->lang->line('common_first_name')),
		array('email' => $CI->lang->line('common_email')),
		array('phone_number' => $CI->lang->line('common_phone_number')),
		array('total' => $CI->lang->line('common_total_spent'), 'sortable' => FALSE)
	);

	if($CI->Employee->has_grant('messages', $CI->session->userdata('person_id')))
	{
		$headers[] = array('messages' => '', 'sortable' => FALSE);
	}

	return transform_headers($headers);
}

/*
Get the html data row for the customer
*/
function get_customer_data_row($person, $stats)
{
	$CI =& get_instance();

	$controller_name = strtolower(get_class($CI));

	return array (
		'people.person_id' => $person->person_id,
		'last_name' => $person->last_name,
		'first_name' => $person->first_name,
		'email' => empty($person->email) ? '' : mailto($person->email, $person->email),
		'phone_number' => $person->phone_number,
		'total' => to_currency($stats->total),
		'messages' => empty($person->phone_number) ? '' : anchor("Messages/view/$person->person_id", '<span class="glyphicon glyphicon-phone"></span>',
			array('class'=>'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title'=>$CI->lang->line('messages_sms_send'))),
		'edit' => anchor($controller_name."/view/$person->person_id", '<span class="glyphicon glyphicon-edit"></span>',
			array('class'=>'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title'=>$CI->lang->line($controller_name.'_update'))
	));
}


/*
Get the header for the suppliers tabular view
*/
function get_suppliers_manage_table_headers()
{
	$CI =& get_instance();

	$headers = array(
		array('people.person_id' => $CI->lang->line('common_id')),
		array('company_name' => $CI->lang->line('suppliers_company_name')),
		array('agency_name' => $CI->lang->line('suppliers_agency_name')),
		array('category' => $CI->lang->line('suppliers_category')),
		array('last_name' => $CI->lang->line('common_last_name')),
		array('first_name' => $CI->lang->line('common_first_name')),
		array('email' => $CI->lang->line('common_email')),
		array('phone_number' => $CI->lang->line('common_phone_number'))
	);

	if($CI->Employee->has_grant('messages', $CI->session->userdata('person_id')))
	{
		$headers[] = array('messages' => '');
	}

	return transform_headers($headers);
}

/*
Get the html data row for the supplier
*/
function get_supplier_data_row($supplier)
{
	$CI =& get_instance();

	$controller_name = strtolower(get_class($CI));

	return array (
		'people.person_id' => $supplier->person_id,
		'company_name' => $supplier->company_name,
		'agency_name' => $supplier->agency_name,
		'category' => $supplier->category,
		'last_name' => $supplier->last_name,
		'first_name' => $supplier->first_name,
		'email' => empty($supplier->email) ? '' : mailto($supplier->email, $supplier->email),
		'phone_number' => $supplier->phone_number,
		'messages' => empty($supplier->phone_number) ? '' : anchor("Messages/view/$supplier->person_id", '<span class="glyphicon glyphicon-phone"></span>',
			array('class'=>"modal-dlg", 'data-btn-submit' => $CI->lang->line('common_submit'), 'title'=>$CI->lang->line('messages_sms_send'))),
		'edit' => anchor($controller_name."/view/$supplier->person_id", '<span class="glyphicon glyphicon-edit"></span>',
			array('class'=>"modal-dlg", 'data-btn-submit' => $CI->lang->line('common_submit'), 'title'=>$CI->lang->line($controller_name.'_update')))
	);
}


/*
Get the header for the items tabular view
*/
function get_items_manage_table_headers()
{
	$CI =& get_instance();

	$definition_names = $CI->Attribute->get_definitions_by_flags(Attribute::SHOW_IN_ITEMS);

	$headers = array(
		array('items.item_id' => $CI->lang->line('common_id')),
		array('item_number' => $CI->lang->line('items_item_number')),
		array('name' => $CI->lang->line('items_name')),
		array('category' => $CI->lang->line('items_category')),
		array('company_name' => $CI->lang->line('suppliers_company_name')),
		array('cost_price' => $CI->lang->line('items_cost_price')),
		array('unit_price' => $CI->lang->line('items_unit_price')),
		array('quantity' => $CI->lang->line('items_quantity'))
	);

	if($CI->config->item('use_destination_based_tax') == '1')
	{
		$headers[] = array('tax_percents' => $CI->lang->line('items_tax_category'), 'sortable' => FALSE);
	}
	else
	{
		$headers[] = array('tax_percents' => $CI->lang->line('items_tax_percents'), 'sortable' => FALSE);

	}

	$headers[] = array('item_pic' => $CI->lang->line('items_image'), 'sortable' => FALSE);

	foreach($definition_names as $definition_id => $definition_name)
	{
		$headers[] = array($definition_id => $definition_name);
	}

	$headers[] = array('inventory' => '');
	$headers[] = array('stock' => '');

	return transform_headers($headers);
}

/*
Get the html data row for the item
*/
function get_item_data_row($item)
{
	$CI =& get_instance();

	if($CI->config->item('use_destination_based_tax') == '1')
	{
		if($item->tax_category_id == NULL)
		{
			$tax_percents = '-';
		}
		else
		{
			$tax_category_info = $CI->Tax_category->get_info($item->tax_category_id);
			$tax_percents = $tax_category_info->tax_category;
		}
	}
	else
	{
		$item_tax_info = $CI->Item_taxes->get_info($item->item_id);
		$tax_percents = '';
		foreach($item_tax_info as $tax_info)
		{
			$tax_percents .= to_tax_decimals($tax_info['percent']) . '%, ';
		}
		// remove ', ' from last item
		$tax_percents = substr($tax_percents, 0, -2);
		$tax_percents = !$tax_percents ? '-' : $tax_percents;
	}

	$controller_name = strtolower(get_class($CI));

	$image = NULL;
	if($item->pic_filename != '')
	{
		$ext = pathinfo($item->pic_filename, PATHINFO_EXTENSION);
		if($ext == '')
		{
			// legacy
			$images = glob('./uploads/item_pics/' . $item->pic_filename . '.*');
		}
		else
		{
			// preferred
			$images = glob('./uploads/item_pics/' . $item->pic_filename);
		}

		if(sizeof($images) > 0)
		{
			$image .= '<a class="rollover" href="'. base_url($images[0]) .'"><img src="'.site_url('items/pic_thumb/' . pathinfo($images[0], PATHINFO_BASENAME)) . '"></a>';
		}
	}

	if($CI->config->item('multi_pack_enabled') == '1')
	{
		$item->name .= NAME_SEPARATOR . $item->pack_name;
	}

	$definition_names = $CI->Attribute->get_definitions_by_flags(Attribute::SHOW_IN_ITEMS);

	$columns = array (
		'items.item_id' => $item->item_id,
		'item_number' => $item->item_number,
		'name' => $item->name,
		'category' => $item->category,
		'company_name' => $item->company_name,
		'cost_price' => to_currency($item->cost_price),
		'unit_price' => to_currency($item->unit_price),
		'quantity' => to_quantity_decimals($item->quantity),
		'tax_percents' => !$tax_percents ? '-' : $tax_percents,
		'item_pic' => $image
	);

	$icons = array(
		'inventory' => anchor($controller_name."/inventory/$item->item_id", '<span class="glyphicon glyphicon-pushpin"></span>',
			array('class' => 'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title' => $CI->lang->line($controller_name.'_count'))
		),
		'stock' => anchor($controller_name."/count_details/$item->item_id", '<span class="glyphicon glyphicon-list-alt"></span>',
			array('class' => 'modal-dlg', 'title' => $CI->lang->line($controller_name.'_details_count'))
		),
		'edit' => anchor($controller_name."/view/$item->item_id", '<span class="glyphicon glyphicon-edit"></span>',
			array('class' => 'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title' => $CI->lang->line($controller_name.'_update'))
		)
	);

	return $columns + expand_attribute_values($definition_names, (array) $item) + $icons;

}


/*
Get the header for the giftcard tabular view
*/
function get_giftcards_manage_table_headers()
{
	$CI =& get_instance();

	$headers = array(
		array('giftcard_id' => $CI->lang->line('common_id')),
		array('last_name' => $CI->lang->line('common_last_name')),
		array('first_name' => $CI->lang->line('common_first_name')),
		array('giftcard_number' => $CI->lang->line('giftcards_giftcard_number')),
		array('value' => $CI->lang->line('giftcards_card_value'))
	);

	return transform_headers($headers);
}

/*
Get the html data row for the giftcard
*/
function get_giftcard_data_row($giftcard)
{
	$CI =& get_instance();

	$controller_name=strtolower(get_class($CI));

	return array (
		'giftcard_id' => $giftcard->giftcard_id,
		'last_name' => $giftcard->last_name,
		'first_name' => $giftcard->first_name,
		'giftcard_number' => $giftcard->giftcard_number,
		'value' => to_currency($giftcard->value),
		'edit' => anchor($controller_name."/view/$giftcard->giftcard_id", '<span class="glyphicon glyphicon-edit"></span>',
			array('class'=>'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title'=>$CI->lang->line($controller_name.'_update'))
		)
	);
}

/*
Get the header for the item kits tabular view
*/
function get_item_kits_manage_table_headers()
{
	$CI =& get_instance();

	$headers = array(
		array('item_kit_id' => $CI->lang->line('item_kits_kit')),
		array('name' => $CI->lang->line('item_kits_name')),
		array('description' => $CI->lang->line('item_kits_description')),
		array('total_cost_price' => $CI->lang->line('items_cost_price'), 'sortable' => FALSE),
		array('total_unit_price' => $CI->lang->line('items_unit_price'), 'sortable' => FALSE)
	);

	return transform_headers($headers);
}

/*
Get the html data row for the item kit
*/
function get_item_kit_data_row($item_kit)
{
	$CI =& get_instance();

	$controller_name = strtolower(get_class($CI));

	return array (
		'item_kit_id' => $item_kit->item_kit_id,
		'name' => $item_kit->name,
		'description' => $item_kit->description,
		'total_cost_price' => to_currency($item_kit->total_cost_price),
		'total_unit_price' => to_currency($item_kit->total_unit_price),
		'edit' => anchor($controller_name."/view/$item_kit->item_kit_id", '<span class="glyphicon glyphicon-edit"></span>',
			array('class'=>'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title'=>$CI->lang->line($controller_name.'_update'))
		)
	);
}

function parse_attribute_values($columns, $row) {
	$attribute_values = array();
	foreach($columns as $column) {
		if (array_key_exists($column, $row))
		{
			$attribute_value = explode('|', $row[$column]);
			$attribute_values = array_merge($attribute_values, $attribute_value);
		}
	}
	return $attribute_values;
}

function expand_attribute_values($definition_names, $row)
{
	$values = parse_attribute_values(array('attribute_values', 'attribute_dtvalues', 'attribute_dvalues'), $row);

	$indexed_values = array();
	foreach($values as $attribute_value)
	{
		$exploded_value = explode('_', $attribute_value);
		if(sizeof($exploded_value) > 1)
		{
			$indexed_values[$exploded_value[0]] = $exploded_value[1];
		}
	}

	$attribute_values = array();
	foreach($definition_names as $definition_id => $definition_name)
	{
		if(isset($indexed_values[$definition_id]))
		{
			$attribute_value = $indexed_values[$definition_id];
			$attribute_values["$definition_id"] = $attribute_value;
		}
	}

	return $attribute_values;
}

function get_attribute_definition_manage_table_headers()
{
	$CI =& get_instance();

	$headers = array(
		array('definition_id' => $CI->lang->line('attributes_definition_id')),
		array('definition_name' => $CI->lang->line('attributes_definition_name')),
		array('definition_type' => $CI->lang->line('attributes_definition_type')),
		array('definition_flags' => $CI->lang->line('attributes_definition_flags')),
		array('definition_group' => $CI->lang->line('attributes_definition_group')),
	);

	return transform_headers($headers);
}

function get_attribute_definition_data_row($attribute)
{
	$CI =& get_instance();

	$controller_name = strtolower(get_class($CI));

	if(count($attribute->definition_flags) == 0)
	{
		$definition_flags = $CI->lang->line('common_none_selected_text');
	}
	else if($attribute->definition_type == GROUP)
	{
		$definition_flags = "-";
	}
	else
	{
		$definition_flags = implode(', ', $attribute->definition_flags);
	}

	return array (
		'definition_id' => $attribute->definition_id,
		'definition_name' => $attribute->definition_name,
		'definition_type' => $attribute->definition_type,
		'definition_group' => $attribute->definition_group,
		'definition_flags' => $definition_flags,
		'edit' => anchor("$controller_name/view/$attribute->definition_id", '<span class="glyphicon glyphicon-edit"></span>',
			array('class'=>'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title'=>$CI->lang->line($controller_name.'_update'))
		)
	);
}

/*
Get the header for the expense categories tabular view
*/
function get_expense_category_manage_table_headers()
{
	$CI =& get_instance();

	$headers = array(
		array('expense_category_id' => $CI->lang->line('expenses_categories_category_id')),
		array('category_name' => $CI->lang->line('expenses_categories_name')),
		array('category_description' => $CI->lang->line('expenses_categories_description'))
	);

	return transform_headers($headers);
}

/*
Gets the html data row for the expenses category
*/
function get_expense_category_data_row($expense_category)
{
	$CI =& get_instance();

	$controller_name = strtolower(get_class($CI));

	return array (
		'expense_category_id' => $expense_category->expense_category_id,
		'category_name' => $expense_category->category_name,
		'category_description' => $expense_category->category_description,
		'edit' => anchor($controller_name."/view/$expense_category->expense_category_id", '<span class="glyphicon glyphicon-edit"></span>',
			array('class'=>'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title'=>$CI->lang->line($controller_name.'_update'))
		)
	);
}


/*
Get the header for the expenses tabular view
*/
/*function get_expenses_manage_table_headers()
{
	$CI =& get_instance();

	$headers = array(
		array('expense_id' => $CI->lang->line('expenses_expense_id')),
		array('date' => $CI->lang->line('expenses_date')),
		array('supplier_name' => $CI->lang->line('expenses_supplier_name')),
		array('supplier_tax_code' => $CI->lang->line('expenses_supplier_tax_code')),
		array('amount' => $CI->lang->line('expenses_amount')),
		array('tax_amount' => $CI->lang->line('expenses_tax_amount')),
		array('payment_type' => $CI->lang->line('expenses_payment')),
		array('category_name' => $CI->lang->line('expenses_categories_name')),
		array('description' => $CI->lang->line('expenses_description')),
		array('created_by' => $CI->lang->line('expenses_employee'))
	);

	return transform_headers($headers);
}
*/
/*
Gets the html data row for the expenses
*/
/*function get_expenses_data_row($expense)
{
	$CI =& get_instance();

	$controller_name = strtolower(get_class($CI));

	return array (
		'expense_id' => $expense->expense_id,
		'date' => to_datetime(strtotime($expense->date)),
		'supplier_name' => $expense->supplier_name,
		'supplier_tax_code' => $expense->supplier_tax_code,
		'amount' => to_currency($expense->amount),
		'tax_amount' => to_currency($expense->tax_amount),
		'payment_type' => $expense->payment_type,
		'category_name' => $expense->category_name,
		'description' => $expense->description,
		'created_by' => $expense->first_name.' '. $expense->last_name,
		'edit' => anchor($controller_name."/view/$expense->expense_id", '<span class="glyphicon glyphicon-edit"></span>',
			array('class'=>'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title'=>$CI->lang->line($controller_name.'_update'))
		)
	);
}*/

/*
Get the header for the growing areas tabular view
*/
function get_cash_concept_manage_table_headers()
{
	$CI =& get_instance();

	$headers = array(
		array('cash_concept_id' => $CI->lang->line('cash_concepts_cash_concept_id')),
		array('code' => $CI->lang->line('cash_concepts_code')),
		array('name' => $CI->lang->line('cash_concepts_name')),
		array('concept_type' => $CI->lang->line('cash_concepts_concept_type')),
		array('description' => $CI->lang->line('cash_concepts_description')),
		array('is_cash_general_used' => $CI->lang->line('cash_concepts_is_cash_general_used'))
	);

	$headers[] = array('see' => '');

	return transform_headers($headers);
}

/*
Gets the html data row for the growing areas
*/
function get_cash_concept_data_row($cash_concept)
{
	$CI =& get_instance();
	$controller_name = strtolower(get_class($CI));

	return array (
		'cash_concept_id' => $cash_concept->cash_concept_id,
		'code' => $cash_concept->code,
		'name' => $cash_concept->name,
		'concept_type' => ($cash_concept->concept_type=="1" ? $CI->lang->line($controller_name.'_income') : ($cash_concept->concept_type=="2" ? $CI->lang->line($controller_name.'_cost') : ($cash_concept->concept_type=="3" ? $CI->lang->line($controller_name.'_expense') : $CI->lang->line($controller_name.'_notdefined')))),
		'description' => $cash_concept->description,
		'is_cash_general_used' => ($cash_concept->is_cash_general_used == 1 ? $CI->lang->line('common_yes') : $CI->lang->line('common_no')),
		'edit' => ($cash_concept->concept_type=="1" ? anchor($controller_name."/view/$cash_concept->cash_concept_id", '<span class="glyphicon glyphicon-edit"></span>',
				array('class'=>'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title'=>$CI->lang->line($controller_name.'_update'))
			) : ($cash_concept->concept_type=="2" ? anchor($controller_name."/view_cost/$cash_concept->cash_concept_id", '<span class="glyphicon glyphicon-edit"></span>',
				array('class'=>'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title'=>$CI->lang->line($controller_name.'_update_cost'))
			) : anchor($controller_name."/view_expense/$cash_concept->cash_concept_id", '<span class="glyphicon glyphicon-edit"></span>',
				array('class'=>'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title'=>$CI->lang->line($controller_name.'_update_expense'))
			))),
		'see' => ($cash_concept->concept_type=="1" ? anchor($controller_name."/subconcept/$cash_concept->cash_concept_id", '<span class="glyphicon glyphicon-list-alt"></span>',
				array('title'=>$CI->lang->line($controller_name.'_update'))
			) : ($cash_concept->concept_type=="2" ? anchor($controller_name."/subconcept/$cash_concept->cash_concept_id", '<span class="glyphicon glyphicon-list-alt"></span>',
				array('title'=>$CI->lang->line($controller_name.'_update_cost'))
			) : anchor($controller_name."/subconcept/$cash_concept->cash_concept_id", '<span class="glyphicon glyphicon-list-alt"></span>',
				array('title'=>$CI->lang->line($controller_name.'_update_expense'))
			)))
		);
}

/*
Get the header for the growing areas tabular view
*/
function get_cash_concept_parent_manage_table_headers()
{
	$CI =& get_instance();

	$headers = array(
		array('cash_concept_id' => $CI->lang->line('cash_concepts_cash_concept_id')),
		array('code' => $CI->lang->line('cash_concepts_code')),
		array('name' => $CI->lang->line('cash_concepts_name')),
		array('description' => $CI->lang->line('cash_concepts_description')),
		array('document_sequence' => $CI->lang->line('cash_concepts_document_sequence')),
		array('cash_concept_parent_name' => $CI->lang->line('cash_concepts_cash_concept_parent_id')),
		array('is_summary' => $CI->lang->line('cash_concepts_summary'))
	);

	return transform_headers($headers);
}

/*
Gets the html data row for the growing areas
*/
function get_cash_concept_parent_data_row($cash_concept)
{
	$CI =& get_instance();
	$controller_name = strtolower(get_class($CI));

	return array (
		'cash_concept_id' => $cash_concept->cash_concept_id,
		'code' => $cash_concept->code,
		'name' => $cash_concept->name,
		'description' => $cash_concept->description,
		'document_sequence' => $cash_concept->document_sequence,
		'cash_concept_parent_name' => $cash_concept->cash_concept_parent_name,
		'is_summary' => ($cash_concept->is_summary==1 ? $CI->lang->line('common_yes') : $CI->lang->line('common_no')),
		'edit' => ($cash_concept->concept_type=="1" ? anchor($controller_name."/view_subconcept/$cash_concept->parent_id/$cash_concept->cash_concept_id", '<span class="glyphicon glyphicon-edit"></span>',
				array('class'=>'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title'=>$CI->lang->line($controller_name.'_update'))
			) : ($cash_concept->concept_type=="2" ? anchor($controller_name."/view_subconcept/$cash_concept->parent_id/$cash_concept->cash_concept_id", '<span class="glyphicon glyphicon-edit"></span>',
				array('class'=>'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title'=>$CI->lang->line($controller_name.'_update_cost'))
			) : anchor($controller_name."/view_subconcept/$cash_concept->parent_id/$cash_concept->cash_concept_id", '<span class="glyphicon glyphicon-edit"></span>',
				array('class'=>'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title'=>$CI->lang->line($controller_name.'_update_expense'))
			)))
		);
}

/*
Get the header for the growing areas tabular view
*/
function get_cash_book_manage_table_headers()
{
	$CI =& get_instance();

	$headers = array(
		array('cash_book_id' => $CI->lang->line('cash_books_cash_book_id')),
		array('code' => $CI->lang->line('cash_books_code')),
		array('location_name' => $CI->lang->line('cash_books_stock_location_id')),
		array('username' => $CI->lang->line('cash_books_user_id')),
		array('address' => $CI->lang->line('cash_books_address')),
		array('is_cash_general' => $CI->lang->line('cash_books_is_cash_general'))
	);

	return transform_headers($headers);
}

/*
Gets the html data row for the growing areas
*/
function get_cash_book_data_row($cash_book)
{
	$CI =& get_instance();
	$controller_name = strtolower(get_class($CI));

	return array (
		'cash_book_id' => $cash_book->cash_book_id,
		'code' => $cash_book->code,
		'location_name' => $cash_book->location_name,
		'username' => $cash_book->username,
		'address' => $cash_book->address,
		'is_cash_general' => ($cash_book->is_cash_general == 1 ? $CI->lang->line('common_yes') : $CI->lang->line('common_no')),
		'edit' => anchor($controller_name."/view/$cash_book->cash_book_id", '<span class="glyphicon glyphicon-edit"></span>',
				array('class'=>'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title'=>$CI->lang->line($controller_name.'_update'))
			)
		);
}

/*
Get the header for the growing areas tabular view
*/
function get_overall_cash_manage_table_headers()
{
	$CI =& get_instance();

	$headers = array(
		array('overall_cash_id' => $CI->lang->line('overall_cashs_overall_cash_id')),
		array('opendate' => $CI->lang->line('overall_cashs_opendate')),
		array('income_currency' => $CI->lang->line('overall_cashs_income_currency')),
		array('cost_currency' => $CI->lang->line('overall_cashs_cost_currency')),
		array('balance_currency' => $CI->lang->line('overall_cashs_balance_currency')),
		array('income_usd' => $CI->lang->line('overall_cashs_income_usd')),
		array('cost_usd' => $CI->lang->line('overall_cashs_cost_usd')),
		array('balance_usd' => $CI->lang->line('overall_cashs_balance_usd')),
		array('state' => $CI->lang->line('common_state'))
	);

	$headers[] = array('close' => '');
	$headers[] = array('detail' => '');
	$headers[] = array('print' => '');

	return transform_headers($headers);
}

/*
Gets the html data row for the growing areas
*/
function get_overall_cash_data_row($overall_cash)
{
	$CI =& get_instance();
	$controller_name = strtolower(get_class($CI));

	return array (
		'overall_cash_id' => $overall_cash->overall_cash_id,
		'opendate' => to_date(strtotime($overall_cash->opendate)),
		'income_currency' => to_currency($overall_cash->income),
		'cost_currency' => to_currency($overall_cash->cost),
		'balance_currency' => to_currency(($overall_cash->income-$overall_cash->cost)),
		'income_usd' => to_usd($overall_cash->usdincome),
		'cost_usd' => to_usd($overall_cash->usdcost),
		'balance_usd' => to_usd(($overall_cash->usdincome-$overall_cash->usdcost)),
		'state' => ($overall_cash->state==0 ? $CI->lang->line('common_opened') : $CI->lang->line('common_closed')),
		'close' => ($overall_cash->state==0 ? anchor($controller_name."/close/$overall_cash->overall_cash_id", '<span class="glyphicon glyphicon-folder-close"></span>',
			array('class'=>'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title'=>$CI->lang->line($controller_name.'_close'))
		) : ''),
		'detail' => anchor($controller_name."/detail/$overall_cash->overall_cash_id", '<span class="glyphicon glyphicon-list-alt"></span>',
			array('title'=>$CI->lang->line($controller_name.'_showdetail'))
		),
		'print' => anchor($controller_name."/print_report/$overall_cash->overall_cash_id", '<span class="glyphicon glyphicon-print"></span>',
			array('title'=>$CI->lang->line($controller_name.'_print'))
		),
		'edit' => ''
		);
}

/*
Get the header for the growing areas tabular view
*/
function get_cash_flow_manage_table_headers()
{
	$CI =& get_instance();

	$headers = array(
		array('overall_cash_id' => $CI->lang->line('overall_cashs_overall_cash_id')),
		array('movementdate' => $CI->lang->line('overall_cashs_movementdate')),
		array('currency' => $CI->lang->line('overall_cashs_currency')),
		array('cash_concept_id' => $CI->lang->line('overall_cashs_cash_concept_id')),
		array('cash_book_id' => $CI->lang->line('overall_cashs_cash_book_id')),
		array('operation_type' => $CI->lang->line('overall_cashs_operation_type')),
		array('description' => $CI->lang->line('overall_cashs_description')),
		array('amount' => $CI->lang->line('overall_cashs_amount')),
		array('reference_id' => $CI->lang->line('overall_cashs_reference_id'))
	);

	return transform_headers($headers);
}

/*
Gets the html data row for the growing areas
*/
function get_cash_flow_data_row($cash_flow)
{
	$CI =& get_instance();
	$controller_name = strtolower(get_class($CI));

	return array (
		'overall_cash_id' => $cash_flow->cash_flow_id,
		'movementdate' => to_datetime(strtotime($cash_flow->movementdate)),
		'currency' => ($cash_flow->currency == CURRENCY ? CURRENCY_LABEL : USDCURRENCY_LABEL),
		'cash_concept_id' => $cash_flow->cash_concept_name,
		'cash_book_id' => $cash_flow->cash_book_name,
		'operation_type' => $cash_flow->movementtype,
		'description' => $cash_flow->description,
		'amount' => ($cash_flow->currency == CURRENCY ? to_currency($cash_flow->amount) : to_usd($cash_flow->amount)),
		'reference_id' => $cash_flow->referenceno
		);
}

/*
Get the header for the growing areas tabular view
*/
function get_cash_daily_manage_table_headers()
{
	$CI =& get_instance();

	$headers = array(
		array('cashup_id' => $CI->lang->line('overall_cashs_overall_cash_id')),
		array('movementdate' => $CI->lang->line('overall_cashs_movementdate')),
		array('currency' => $CI->lang->line('overall_cashs_currency')),
		array('cash_concept_id' => $CI->lang->line('overall_cashs_cash_concept_id')),
		array('cash_book_id' => $CI->lang->line('overall_cashs_cash_book_id')),
		array('operation_type' => $CI->lang->line('overall_cashs_operation_type')),
		array('description' => $CI->lang->line('overall_cashs_description')),
		array('amount' => $CI->lang->line('overall_cashs_amount')),
		array('reference_id' => $CI->lang->line('overall_cashs_reference_id'))
	);

	return transform_headers($headers);
}

/*
Gets the html data row for the growing areas
*/
function get_cash_daily_data_row($cash_daily)
{
	$CI =& get_instance();
	$controller_name = strtolower(get_class($CI));

	return array (
		'overall_cash_id' => $cash_daily->cash_daily_id,
		'movementdate' => to_datetime(strtotime($cash_daily->movementdate)),
		'currency' => ($cash_daily->currency == CURRENCY ? CURRENCY_LABEL : USDCURRENCY_LABEL),
		'cash_concept_id' => $cash_daily->cash_concept_name,
		'cash_book_id' => $cash_daily->cash_book_name,
		'operation_type' => $cash_daily->movementtype,
		'description' => $cash_daily->description,
		'amount' => ($cash_daily->currency == CURRENCY ? to_currency($cash_daily->amount) : to_usd($cash_daily->amount)),
		'reference_id' => $cash_daily->referenceno
		);
}

/*
Get the header for the growing areas tabular view
*/
function get_bank_manage_table_headers()
{
	$CI =& get_instance();

	$headers = array(
		array('bank_id' => $CI->lang->line('banks_bank_id')),
		array('ruc' => $CI->lang->line('banks_ruc')),
		array('name' => $CI->lang->line('banks_name')),
		array('account_type' => $CI->lang->line('banks_account_type')),
		array('account_number' => $CI->lang->line('banks_account_number'))
	);

	return transform_headers($headers);
}

/*
Gets the html data row for the growing areas
*/
function get_bank_data_row($bank)
{
	$CI =& get_instance();
	$controller_name = strtolower(get_class($CI));

	return array (
		'bank_id' => $bank->bank_id,
		'ruc' => $bank->ruc,
		'name' => $bank->name,
		'account_type' => $bank->currency,
		'account_number' => $bank->account_number,
		'edit' => anchor($controller_name."/view_bank/$bank->bank_id", '<span class="glyphicon glyphicon-edit"></span>',
			array('class'=>'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title'=>$CI->lang->line($controller_name.'_update'))
		)
		);
}

/*
Get the header for the growing areas tabular view
*/
function get_income_manage_table_headers($cashmovements = 0)
{
	$CI =& get_instance();

	if($cashmovements == 0)
	{
		$headers = array(
			array('income_id' => $CI->lang->line('incomes_income_id')),
			array('documentdate' => $CI->lang->line('incomes_documentdate')),
			array('documentno' => $CI->lang->line('incomes_documentno')),
			array('name' => $CI->lang->line('common_person_name')),
			array('bank' => $CI->lang->line('overall_cashs_financialentity')),
			array('detail' => $CI->lang->line('incomes_detail')),
			array('cash_currency' => $CI->lang->line('incomes_cash_currency')),
			array('bank_currency' => $CI->lang->line('incomes_bank_currency')),
			array('cash_usd' => $CI->lang->line('incomes_cash_usd')),
			array('bank_usd' => $CI->lang->line('incomes_bank_usd'))
		);
	}
	else
	{
		$headers = array(
			array('income_id' => $CI->lang->line('incomes_income_id')),
			array('documentdate' => $CI->lang->line('incomes_documentdate')),
			array('documentno' => $CI->lang->line('incomes_documentno')),
			array('name' => $CI->lang->line('common_person_name')),
			array('cash_concept' => $CI->lang->line('incomes_cash_concept_id')),
			array('cash_subconcept' => $CI->lang->line('incomes_cash_subconcept_id')),
			array('detail' => $CI->lang->line('incomes_detail')),
			array('cash' => $CI->lang->line('common_cash')),
			array('bank' => $CI->lang->line('common_bank'))
		);
	}

	$headers[] = array('delete' => '');

	return transform_headers($headers);
}

/*
Gets the html data row for the growing areas
*/
function get_income_data_row($income,$cashmovements = 0)
{
	$CI =& get_instance();
	$controller_name = strtolower(get_class($CI));

	if($cashmovements == 0)
	{
		return array (
			'income_id' => $income->income_id,
			'documentdate' => to_datetime(strtotime($income->documentdate)),
			'documentno' => $income->documentno,
			'name' => $income->name,
			'bank' => $income->bank,
			'detail' => $income->detail,
			'cash_currency' => to_currency($income->cash_amount),
			'bank_currency' => to_currency($income->check_amount),
			'cash_usd' => to_usd($income->cash_usdamount),
			'bank_usd' => to_usd($income->check_usdamount),
			'delete' => ($income->readonly == 0 ? anchor($controller_name."/delete_income/$income->income_id", '<span class="glyphicon glyphicon-trash"></span>',
				array('class'=>'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title'=>$CI->lang->line('incomes_delete'))
			) : ''),
			'edit' => ($income->readonly == 0 ? anchor($controller_name."/view_income/$income->income_id", '<span class="glyphicon glyphicon-edit"></span>',
				array('class'=>'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title'=>$CI->lang->line('incomes_update'))
			) : '')
			);
	}
	else
	{
		return array (
			'income_id' => $income->income_id,
			'documentdate' => to_datetime(strtotime($income->documentdate)),
			'documentno' => $income->documentno,
			'name' => $income->name,
			'cash_concept' => $income->cash_concept,
			'cash_subconcept' => $income->cash_subconcept,
			'detail' => $income->detail,
			'cash' => to_currency($income->cash_amount),
			'bank' => to_currency($income->check_amount),
			'delete' => ($income->readonly == 0 ? anchor($controller_name."/delete_income/$income->income_id", '<span class="glyphicon glyphicon-trash"></span>',
				array('class'=>'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title'=>$CI->lang->line('incomes_delete'))
			) : ''),
			'edit' => ($income->readonly == 0 ? anchor($controller_name."/view_income/$income->income_id", '<span class="glyphicon glyphicon-edit"></span>',
				array('class'=>'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title'=>$CI->lang->line('incomes_update'))
			) : '')
			);
	}
}

/*
Get the header for the growing areas tabular view
*/
function get_cost_manage_table_headers($cashmovement = 0)
{
	$CI =& get_instance();

	if($cashmovement == 0)
	{
		$headers = array(
			array('cost_id' => $CI->lang->line('costs_cost_id')),
			array('documentdate' => $CI->lang->line('costs_documentdate')),
			array('documentno' => $CI->lang->line('costs_documentno')),
			array('name' => $CI->lang->line('common_person_name')),
			array('concept' => $CI->lang->line('costs_cash_concept_id')),
			array('detail' => $CI->lang->line('costs_detail')),
			array('cash_currency' => $CI->lang->line('costs_cash_currency')),
			array('bank_currency' => $CI->lang->line('costs_bank_currency'))
		);
	}
	else
	{
		$headers = array(
			array('cost_id' => $CI->lang->line('costs_cost_id')),
			array('documentdate' => $CI->lang->line('costs_documentdate')),
			array('documentno' => $CI->lang->line('costs_documentno')),
			array('name' => $CI->lang->line('common_person_name')),
			array('concept' => $CI->lang->line('costs_cash_concept_id')),
			array('subconcept' => $CI->lang->line('costs_cash_subconcept_id')),
			array('detail' => $CI->lang->line('costs_detail')),
			array('cash_currency' => $CI->lang->line('costs_cash_currency')),
			array('bank_currency' => $CI->lang->line('costs_bank_currency'))
		);
	}

	$headers[] = array('delete' => '');

	return transform_headers($headers);
}

/*
Gets the html data row for the growing areas
*/
function get_cost_data_row($cost,$cashmovement = 0)
{
	$CI =& get_instance();
	$controller_name = strtolower(get_class($CI));

	if($cashmovement == 0)
	{
		return array (
			'cost_id' => $cost->cost_id,
			'documentdate' => to_datetime(strtotime($cost->documentdate)),
			'documentno' => $cost->documentno,
			'name' => $cost->name,
			'concept' => $cost->cash_subconcept_name,
			'detail' => $cost->detail,
			'cash_currency' => to_currency($cost->cash_amount),
			'bank_currency' => to_currency($cost->check_amount),
			'delete' => ($cost->readonly == 0 ? anchor($controller_name."/delete_cost/$cost->cost_id", '<span class="glyphicon glyphicon-trash"></span>',
				array('class'=>'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title'=>$CI->lang->line('costs_delete'))
			) : ''),
			'edit' => ($cost->readonly == 0 ? anchor($controller_name."/view_cost/$cost->cost_id", '<span class="glyphicon glyphicon-edit"></span>',
				array('class'=>'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title'=>$CI->lang->line('costs_update'))
			) : '')
			);
	}
	else
	{
		return array (
		'cost_id' => $cost->cost_id,
		'documentdate' => to_datetime(strtotime($cost->documentdate)),
		'documentno' => $cost->documentno,
		'name' => $cost->name,
		'concept' => $cost->cash_concept_name,
		'subconcept' => $cost->cash_subconcept_name,
		'detail' => $cost->detail,
		'cash_currency' => to_currency($cost->cash_amount),
		'bank_currency' => to_currency($cost->check_amount),
		'delete' => ($cost->readonly == 0 ? anchor($controller_name."/delete_cost/$cost->cost_id", '<span class="glyphicon glyphicon-trash"></span>',
			array('class'=>'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title'=>$CI->lang->line('costs_delete'))
		) : ''),
		'edit' => ($cost->readonly == 0 ? anchor($controller_name."/view_cost/$cost->cost_id", '<span class="glyphicon glyphicon-edit"></span>',
			array('class'=>'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title'=>$CI->lang->line('costs_update'))
		) : '')
		);
	}
}

/*
Get the header for the growing areas tabular view
*/
function get_expense_manage_table_headers($cashmovement = 0)
{
	$CI =& get_instance();

	$headers = array(
		array('expense_id' => $CI->lang->line('expenses_expense_id')),
		array('documentdate' => $CI->lang->line('expenses_documentdate')),
		array('documentno' => $CI->lang->line('expenses_documentno')),
		array('name' => $CI->lang->line('common_person_name')),
		array('concept' => $CI->lang->line('expenses_cash_concept_id')),
		array('detail' => $CI->lang->line('expenses_detail')),
		array('doctype' => $CI->lang->line('expenses_doctype')),
		array('docnumber' => $CI->lang->line('expenses_docnumber')),
		array('cash_currency' => $CI->lang->line('expenses_cash_currency')),
		array('bank_currency' => $CI->lang->line('expenses_bank_currency'))
	);

	$headers[] = array('delete' => '');

	return transform_headers($headers);
}

/*
Gets the html data row for the growing areas
*/
function get_expense_data_row($expense,$cashmovement = 0)
{
	$CI =& get_instance();
	$controller_name = strtolower(get_class($CI));

	return array (
		'expense_id' => $expense->expense_id,
		'documentdate' => to_datetime(strtotime($expense->documentdate)),
		'documentno' => $expense->documentno,
		'name' => $expense->name,
		'concept' => $expense->cash_concept_name,
		'detail' => $expense->detail,
		'doctype' => $expense->doctype,
		'docnumber' => $expense->docnumber,
		'cash_currency' => to_currency($expense->cash_amount),
		'bank_currency' => to_currency($expense->check_amount),
		'delete' => ($expense->readonly == 0 ? anchor($controller_name."/delete_expense/$expense->expense_id", '<span class="glyphicon glyphicon-trash"></span>',
			array('class'=>'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title'=>$CI->lang->line('expenses_delete'))
		) : ''),
		'edit' => ($expense->readonly == 0 ? anchor($controller_name."/view_expense/$expense->expense_id", '<span class="glyphicon glyphicon-edit"></span>',
			array('class'=>'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title'=>$CI->lang->line('expenses_update'))
		) : '')
	);
}

/*
Get the html data last row for the expenses
*/
function get_expenses_data_last_row($expense)
{
	$CI =& get_instance();

	$table_data_rows = '';
	$sum_amount_expense = 0;
	$sum_tax_amount_expense = 0;

	foreach($expense->result() as $key=>$expense)
	{
		$sum_amount_expense += $expense->amount;
		$sum_tax_amount_expense += $expense->tax_amount;
	}

	return array(
		'expense_id' => '-',
		'date' => '<b>'.$CI->lang->line('sales_total').'</b>',
		'amount' => '<b>'. to_currency($sum_amount_expense).'</b>',
		'tax_amount' => '<b>'. to_currency($sum_tax_amount_expense).'</b>'
	);
}

/*
Get the expenses payments summary
*/
function get_expenses_manage_payments_summary($payments, $expenses)
{
	$CI =& get_instance();

	$table = '<div id="report_summary">';

	foreach($payments as $key=>$payment)
	{
		$amount = $payment['amount'];
		$table .= '<div class="summary_row">' . $payment['payment_type'] . ': ' . to_currency($amount) . '</div>';
	}

	$table .= '</div>';

	return $table;
}

/*
Get the header for the cashup tabular view
*/
function get_cashups_manage_table_headers()
{
	$CI =& get_instance();

	$headers = array(
		array('cashup_id' => $CI->lang->line('cashups_id')),
		array('cash_book_id' => $CI->lang->line('cashups_cash_book_id')),
		array('open_employee_id' => $CI->lang->line('cashups_open_employee')),
		array('open_date' => $CI->lang->line('cashups_opened_date')),
		array('income' => $CI->lang->line('cashups_income')),
		array('cost_cash' => $CI->lang->line('cashups_cost_cash')),
		array('cost_bank' => $CI->lang->line('cashups_cost_bank')),
		array('expense' => $CI->lang->line('cashups_expense')),
		array('balance' => $CI->lang->line('cashups_balance')),
		array('state' => $CI->lang->line('common_state')),
		array('close_date' => $CI->lang->line('cashups_closed_date'))
	);

	$headers[] = array('close' => '');
	$headers[] = array('detail' => '');
	$headers[] = array('print' => '');

	return transform_headers($headers);
}

/*
Gets the html data row for the cashups
*/
function get_cash_up_data_row($cash_up)
{
	$CI =& get_instance();

	$controller_name = strtolower(get_class($CI));

	return array (
		'cashup_id' => $cash_up->cashup_id,
		'cash_book_id' => $cash_up->cash_book,
		'open_employee_id' => $cash_up->open_first_name . ' ' . $cash_up->open_last_name,
		'open_date' => to_datetime(strtotime($cash_up->open_date)),
		'income' => to_currency($cash_up->income),
		'cost_cash' => to_currency($cash_up->cost_cash),
		'cost_bank' => to_currency($cash_up->cost_bank),
		'expense' => to_currency($cash_up->expense),
		'balance' => to_currency($cash_up->closed_amount_total),
		'state' => ($cash_up->state==0 ? $CI->lang->line('common_opened') : $CI->lang->line('common_closed')),
		'close_date' => (!empty($cash_up->close_date) ? to_datetime(strtotime($cash_up->close_date)) : ''),
		'close' => ($cash_up->state==0 ? anchor($controller_name."/close/$cash_up->cashup_id", '<span class="glyphicon glyphicon-folder-close"></span>',
			array('class'=>'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title'=>$CI->lang->line($controller_name.'_close'))
		) : ''),
		'detail' => anchor($controller_name."/detail/$cash_up->cashup_id", '<span class="glyphicon glyphicon-list-alt"></span>',
			array('title'=>$CI->lang->line($controller_name.'_showdetail'))
		),
		'print' => anchor($controller_name."/print_report/$cash_up->cashup_id", '<span class="glyphicon glyphicon-print"></span>',
			array('title'=>$CI->lang->line($controller_name.'_print'))
		),
		'edit' => ''
	);
}

/*
Get the header for the cashup tabular view
*/
/*function get_cashups_manage_table_headers()
{
	$CI =& get_instance();

	$headers = array(
		array('cashup_id' => $CI->lang->line('cashups_id')),
		array('open_date' => $CI->lang->line('cashups_opened_date')),
		array('open_employee_id' => $CI->lang->line('cashups_open_employee')),
		array('open_amount_cash' => $CI->lang->line('cashups_open_amount_cash')),
		array('transfer_amount_cash' => $CI->lang->line('cashups_transfer_amount_cash')),
		array('close_date' => $CI->lang->line('cashups_closed_date')),
		array('close_employee_id' => $CI->lang->line('cashups_close_employee')),
		array('closed_amount_cash' => $CI->lang->line('cashups_closed_amount_cash')),
		array('note' => $CI->lang->line('cashups_note')),
		array('closed_amount_due' => $CI->lang->line('cashups_closed_amount_due')),
		array('closed_amount_card' => $CI->lang->line('cashups_closed_amount_card')),
		array('closed_amount_check' => $CI->lang->line('cashups_closed_amount_check')),
		array('closed_amount_total' => $CI->lang->line('cashups_closed_amount_total'))
	);

	return transform_headers($headers);
}*/

/*
Gets the html data row for the cashups
*/
/*function get_cash_up_data_row($cash_up)
{
	$CI =& get_instance();

	$controller_name = strtolower(get_class($CI));

	return array (
		'cashup_id' => $cash_up->cashup_id,
		'open_date' => to_datetime(strtotime($cash_up->open_date)),
		'open_employee_id' => $cash_up->open_first_name . ' ' . $cash_up->open_last_name,
		'open_amount_cash' => to_currency($cash_up->open_amount_cash),
		'transfer_amount_cash' => to_currency($cash_up->transfer_amount_cash),
		'close_date' => to_datetime(strtotime($cash_up->close_date)),
		'close_employee_id' => $cash_up->close_first_name . ' ' . $cash_up->close_last_name,
		'closed_amount_cash' => to_currency($cash_up->closed_amount_cash),
		'note' => $cash_up->note ? '<span class="glyphicon glyphicon-ok"></span>' : '<span class="glyphicon glyphicon-remove"></span>',
		'closed_amount_due' => to_currency($cash_up->closed_amount_due),
		'closed_amount_card' => to_currency($cash_up->closed_amount_card),
		'closed_amount_check' => to_currency($cash_up->closed_amount_check),
		'closed_amount_total' => to_currency($cash_up->closed_amount_total),
		'edit' => anchor($controller_name."/view/$cash_up->cashup_id", '<span class="glyphicon glyphicon-edit"></span>',
			array('class'=>'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title'=>$CI->lang->line($controller_name.'_update'))
		)
	);
}*/

/*
Get the header for the doctypesequence tabular view
*/
function get_doctypesequence_manage_table_headers()
{
	$CI =& get_instance();

	$headers = array(
		array('sequence_id' => $CI->lang->line('doctypesequences_sequence_id')),
		array('name' => $CI->lang->line('doctypesequences_name')),
		array('doctype' => $CI->lang->line('doctypesequences_doctype')),
		array('prefix' => $CI->lang->line('doctypesequences_prefix')),
		array('suffix' => $CI->lang->line('doctypesequences_suffix')),
		array('next_sequence' => $CI->lang->line('doctypesequences_next_sequence')),
		array('number_incremental' => $CI->lang->line('doctypesequences_number_incremental')),
		array('is_cashup' => $CI->lang->line('doctypesequences_is_cashup'))
	);

	return transform_headers($headers);
}

/*
Gets the html data row for the doctypesequence
*/
function get_doctypesequence_data_row($doctypesequence)
{
	$CI =& get_instance();
	$controller_name = strtolower(get_class($CI));

	return array (
		'sequence_id' => $doctypesequence->sequence_id,
		'name' => $doctypesequence->name,
		'doctype' => $CI->lang->line('doctypesequences_doctype_'.substr($doctypesequence->doctype,0,-1)),
		'prefix' => $doctypesequence->prefix,
		'suffix' => $doctypesequence->suffix,
		'next_sequence' => $doctypesequence->next_sequence,
		'number_incremental' => $doctypesequence->number_incremental,
		'is_cashup' => ($doctypesequence->is_cashup == 0 ? $CI->lang->line('common_no') : $CI->lang->line('common_yes')),
		'edit' => anchor($controller_name."/view/$doctypesequence->sequence_id", '<span class="glyphicon glyphicon-edit"></span>',
			array('class'=>'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title'=>$CI->lang->line($controller_name.'_update'))
		));
}

?>
