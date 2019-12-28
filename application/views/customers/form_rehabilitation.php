<div id="required_fields_message"><?php echo $this->lang->line('common_fields_required_message'); ?></div>

<ul id="error_message_box" class="error_message_box"></ul>

<?php echo form_open($controller_name . '/save_rehabilitation/' . $person_info->person_id, array('id'=>'customer_form', 'class'=>'form-horizontal')); ?>
	<div class="tab-content">
		<div class="tab-pane fade in active" id="customer_basic_info">
			<fieldset>
				<div class="form-group form-group-sm">
					<?php echo form_label($this->lang->line('common_first_name'), 'first_name', array('class' => 'control-label col-xs-3')); ?>
					<div class='col-xs-8'>
						<?php echo form_input(array(
								'name'=>'first_name',
								'id'=>'first_name',
								'class'=>'form-control input-sm',
								'readonly' => TRUE,
								'value'=>$person_info->first_name)
								); ?>
					</div>
				</div>

				<div class="form-group form-group-sm">
					<?php echo form_label($this->lang->line('common_last_name'), 'last_name', array('class' => 'control-label col-xs-3')); ?>
					<div class='col-xs-8'>
						<?php echo form_input(array(
								'name'=>'last_name',
								'id'=>'last_name',
								'class'=>'form-control input-sm',
								'readonly' => TRUE,
								'value'=>$person_info->last_name)
								); ?>
					</div>
				</div>

				<div class="form-group form-group-sm">
					<?php echo form_label($this->lang->line('customers_rehabilitation_id'), 'rehabilitation_id', array('class' => 'control-label col-xs-3')); ?>
					<div class='col-xs-8'>
						<?php echo form_dropdown('rehabilitation_id',$items,$selected_item,array('id' => 'rehabilitation_id', 'class' => 'form-control')); ?>
					</div>
				</div>

				<div class="form-group form-group-sm">
					<?php echo form_label($this->lang->line('customers_qty_onhand'), 'onhand', array('class' => 'control-label col-xs-3')); ?>
					<div class='col-xs-8'>
						<?php echo form_input(array(
								'name'=>'onhand',
								'id'=>'onhand',
								'class'=>'form-control input-sm',
								'type' => 'number',
								'value'=>$person_info->onhand)
								); ?>
					</div>
				</div>

				<div class="form-group form-group-sm">
					<?php echo form_label($this->lang->line('customers_qty_onused'), 'used', array('class' => 'control-label col-xs-3')); ?>
					<div class='col-xs-8'>
						<?php echo form_input(array(
								'name'=>'used',
								'id'=>'used',
								'class'=>'form-control input-sm',
								'type' => 'number',
								'value'=>$person_info->used)
								); ?>
					</div>
				</div>

				<div class="form-group form-group-sm" style="display: <?php echo ($this->config->item('mandatory_password') == 1 ? "block" : "none")?>;">
					<?php echo form_label($this->lang->line('customers_password_rehabilitation'), 'password_rehabilitation', array('class' => 'required control-label col-xs-3')); ?>
					<div class='col-xs-8'>
						<?php echo form_input(array(
								'name'=>'password_rehabilitation',
								'id'=>'password_rehabilitation',
								'class'=>'form-control input-sm',
								'readonly' => TRUE,
								'type' => 'password',
								'value'=>$this->config->item('password_rehabilitation'))
								); ?>
					</div>
				</div>

				<div class="form-group form-group-sm" style="display: <?php echo ($this->config->item('mandatory_password') == 1 ? "block" : "none")?>;">
					<?php echo form_label($this->lang->line('customers_password_rehabilitation_confirm'), 'password_rehabilitation_confirm', array('class' => 'required control-label col-xs-3')); ?>
					<div class='col-xs-8'>
						<?php echo form_input(array(
								'name'=>'password_rehabilitation_confirm',
								'id'=>'password_rehabilitation_confirm',
								'class'=>'form-control input-sm',
								'type' => 'password',
								'value'=>($this->config->item('mandatory_password') == 1 ? "" : $this->config->item('password_rehabilitation')))
								); ?>
					</div>
				</div>

				<div class="form-group form-group-sm">
					<?php echo form_label($this->lang->line('customers_employee'), 'employee', array('class'=>'control-label col-xs-3')); ?>
					<div class='col-xs-8'>
						<?php echo form_input(array(
								'name'=>'employee',
								'id'=>'employee',
								'class'=>'form-control input-sm',
								'value'=>$employee,
								'readonly'=>'true')
								); ?>
					</div>
				</div>

				<?php echo form_hidden('employee_id', $person_info->employee_id); ?>
			</fieldset>
		</div>
	</div>
<?php echo form_close(); ?>

<script type="text/javascript">
//validation and submit handling
$(document).ready(function()
{
	$('#customer_form').validate($.extend({
		submitHandler: function(form) {
			$(form).ajaxSubmit({
				success: function(response)
				{
					dialog_support.hide();
					table_support.handle_submit("<?php echo site_url($controller_name); ?>", response);
				},
				dataType: 'json'
			});
		},

		errorLabelContainer: '#error_message_box',

		rules:
		{
			password:
			{
				<?php
				if($this->config->item('mandatory_password') == 1)
				{
				?>
					required: true,
				<?php
				}
				?>
			},	
			password_rehabilitation_confirm:
			{
				equalTo: '#password_rehabilitation'
			},
		},

		messages:
		{
			password_rehabilitation:
			{
				<?php
				if($this->config->item('mandatory_password') == 1)
				{
				?>
				required: "<?php echo $this->lang->line('customers_password_rehabilitation_required'); ?>",
				<?php
				}
				?>
			},
			password_rehabilitation_confirm:
			{
				equalTo: "<?php echo $this->lang->line('customers_password_rehabilitation_must_match'); ?>"
			},
		}
	}, form_support.error));
});
</script>
