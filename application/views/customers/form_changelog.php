<?php echo form_open('customers', array('id'=>'customer_form', 'class'=>'form-horizontal')); ?>
	<fieldset id="count_customer_basic_info">
		<div class="form-group form-group-sm">
			<?php echo form_label($this->lang->line('customers_customer_number'), 'customer_number', array('class'=>'control-label col-xs-3')); ?>
			<div class="col-xs-8">
				<div class="input-group">
					<span class="input-group-addon input-sm"><span class="glyphicon glyphicon-barcode"></span></span>
					<?php echo form_input(array(
							'name'=>'customer_number',
							'id'=>'customer_number',
							'class'=>'form-control input-sm',
							'disabled'=>'',
							'value'=>$customer_info->customer_number)
							);?>
				</div>
			</div>
		</div>

		<div class="form-group form-group-sm">
			<?php echo form_label($this->lang->line('customers_company_name'), 'company_name', array('class' => 'control-label col-xs-3')); ?>
			<div class='col-xs-8'>
				<?php echo form_input(array(
						'name'=>'company_name',
						'id'=>'company_name',
						'class'=>'form-control input-sm',
						'disabled'=>'',
						'value'=>$customer_info->company_name)
						); ?>
			</div>
		</div>

		<div class="form-group form-group-sm">	
			<?php echo form_label($this->lang->line('common_dni'), 'dni', array('class'=>'required control-label col-xs-3')); ?>
			<div class='col-xs-8'>
				<?php echo form_input(array(
						'name'=>'dni',
						'id'=>'dni',
						'class'=>'form-control input-sm',
						'disabled'=>'',
						'value'=>$customer_info->dni)
						);?>
			</div>
		</div>

		<div class="form-group form-group-sm">	
			<?php echo form_label($this->lang->line('common_first_name'), 'first_name', array('class'=>'required control-label col-xs-3')); ?>
			<div class='col-xs-8'>
				<?php echo form_input(array(
						'name'=>'first_name',
						'id'=>'first_name',
						'class'=>'form-control input-sm',
						'disabled'=>'',
						'value'=>$customer_info->first_name)
						);?>
			</div>
		</div>

		<div class="form-group form-group-sm">	
			<?php echo form_label($this->lang->line('common_last_name'), 'last_name', array('class'=>'required control-label col-xs-3')); ?>
			<div class='col-xs-8'>
				<?php echo form_input(array(
						'name'=>'last_name',
						'id'=>'last_name',
						'class'=>'form-control input-sm',
						'disabled'=>'',
						'value'=>$customer_info->last_name)
						);?>
			</div>
		</div>
	</fieldset>
<?php echo form_close(); ?>

<table id="customers_count_details" class="table table-striped table-hover">
	<thead>
		<tr style="background-color: #999 !important;">
			<th colspan="3"><?php echo $this->lang->line('customers_changelog'); ?></th>
		</tr>
		<tr>
			<th width="30%"><?php echo $this->lang->line('customers_changelog_date'); ?></th>
			<th width="20%"><?php echo $this->lang->line('customers_changelog_employee'); ?></th>
			<th width="50%"><?php echo $this->lang->line('customers_changelog_remarks'); ?></th>
		</tr>
	</thead>
	<tbody id="inventory_result">
		<?php
		/*
		 * the tbody content of the table will be filled in by the javascript (see bottom of page)
		*/

		$inventory_array = $this->Changelog->get_changelog_data_for_customer($customer_info->person_id)->result_array();
		$employee_name = array();

		foreach($inventory_array as $row)
		{
			$employee = $this->Employee->get_info($row['trans_user']);
			array_push($employee_name, $employee->first_name . ' ' . $employee->last_name);
		}
		?>
	</tbody>
</table>

<script type="text/javascript">
$(document).ready(function()
{
    display_stock();
});

function display_stock()
{
    var inventory_data = <?php echo json_encode($inventory_array); ?>;
    var employee_data = <?php echo json_encode($employee_name); ?>;

    var table = document.getElementById("inventory_result");

    // Remove old query from tbody
    var rowCount = table.rows.length;
    for (var index = rowCount; index > 0; index--)
    {
        table.deleteRow(index-1);
    }

    // Add new query to tbody
    for (var index = 0; index < inventory_data.length; index++)
    {
        var data = inventory_data[index];
        var tr = document.createElement('tr');

        var td = document.createElement('td');
        td.appendChild(document.createTextNode(data['trans_date']));
        tr.appendChild(td);

        td = document.createElement('td');
        td.appendChild(document.createTextNode(employee_data[index]));
        tr.appendChild(td);

        td = document.createElement('td');
        td.appendChild(document.createTextNode(data['trans_comment']));
        tr.appendChild(td);

        table.appendChild(tr);
    }
}
</script>
