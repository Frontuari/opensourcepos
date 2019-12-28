<div id="required_fields_message"><?php echo $this->lang->line('common_fields_required_message'); ?></div>

<ul id="error_message_box" class="error_message_box"></ul>

<?php echo form_open($controller_name . '/save_discipline/' . $person_info->person_id, array('id'=>'customer_form', 'class'=>'form-horizontal')); ?>
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
					<?php echo form_label($this->lang->line('customers_discipline_id'), 'discipline_id', array('class' => 'control-label col-xs-3')); ?>
					<div class='col-xs-8'>
						<?php echo form_dropdown('discipline_id',$items,$selected_item,array('id' => 'discipline_id', 'class' => 'form-control')); ?>
					</div>
				</div>

				<div class="form-group form-group-sm">
					<?php echo form_label($this->lang->line('customers_service_duedate'), 'service_duedate', array('class'=>'control-label col-xs-3')); ?>
					<div class='col-xs-8'>
						<div class="input-group">
							<span class="input-group-addon input-sm"><span class="glyphicon glyphicon-calendar"></span></span>
							<?php echo form_input(array(
									'name'=>'service_duedate',
									'id'=>'service_duedate',
									'class'=>'form-control input-sm datepicker',
									'value'=>to_date(strtotime($person_info->service_duedate)))
									); ?>
						</div>
					</div>
				</div>

				<div class="form-group form-group-sm">
					<?php echo form_label($this->lang->line('customers_is_exhonerated'), 'is_exhonerated', array('class' => 'required control-label col-xs-3')); ?>
					<div class='col-xs-1'>
						<?php echo form_checkbox('is_exhonerated', '1', (boolean)$person_info->is_exhonerated); ?>
					</div>
				</div>

				<div class="form-group form-group-sm" style="display: <?php echo ($this->config->item('mandatory_password') == 1 ? "block" : "none")?>;">
					<?php echo form_label($this->lang->line('customers_password_discipline'), 'password_discipline', array('class' => 'required control-label col-xs-3')); ?>
					<div class='col-xs-8'>
						<?php echo form_input(array(
								'name'=>'password_discipline',
								'id'=>'password_discipline',
								'class'=>'form-control input-sm',
								'readonly' => TRUE,
								'type' => 'password',
								'value'=>$this->config->item('password_discipline'))
								); ?>
					</div>
				</div>

				<div class="form-group form-group-sm" style="display: <?php echo ($this->config->item('mandatory_password') == 1 ? "block" : "none")?>;">
					<?php echo form_label($this->lang->line('customers_password_discipline_confirm'), 'password_discipline_confirm', array('class' => 'required control-label col-xs-3')); ?>
					<div class='col-xs-8'>
						<?php echo form_input(array(
								'name'=>'password_discipline_confirm',
								'id'=>'password_discipline_confirm',
								'class'=>'form-control input-sm',
								'type' => 'password',
								'value'=>($this->config->item('mandatory_password') == 1 ? "" : $this->config->item('password_discipline')))
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
	// load the preset datarange picker
	<?php $this->load->view('partial/daterangepicker'); ?>
    // set the beginning of time as starting date
    $('#service_duedate').daterangepicker({
    	singleDatePicker: true,
    	showDropdowns: true,
		locale: {
			format: '<?php echo dateformat_momentjs($this->config->item("dateformat"))?>',
			separator: ' - ',
			applyLabel: '<?php echo $this->lang->line("datepicker_apply"); ?>',
			cancelLabel: '<?php echo $this->lang->line("datepicker_cancel"); ?>',
			fromLabel: '<?php echo $this->lang->line("datepicker_from"); ?>',
			toLabel: '<?php echo $this->lang->line("datepicker_to"); ?>',
			customRangeLabel: '<?php echo $this->lang->line("datepicker_custom"); ?>',
			daysOfWeek: [
				'<?php echo $this->lang->line("cal_su"); ?>',
				'<?php echo $this->lang->line("cal_mo"); ?>',
				'<?php echo $this->lang->line("cal_tu"); ?>',
				'<?php echo $this->lang->line("cal_we"); ?>',
				'<?php echo $this->lang->line("cal_th"); ?>',
				'<?php echo $this->lang->line("cal_fr"); ?>',
				'<?php echo $this->lang->line("cal_sa"); ?>',
				'<?php echo $this->lang->line("cal_su"); ?>'
			],
			monthNames: [
				'<?php echo $this->lang->line("cal_january"); ?>',
				'<?php echo $this->lang->line("cal_february"); ?>',
				'<?php echo $this->lang->line("cal_march"); ?>',
				'<?php echo $this->lang->line("cal_april"); ?>',
				'<?php echo $this->lang->line("cal_may"); ?>',
				'<?php echo $this->lang->line("cal_june"); ?>',
				'<?php echo $this->lang->line("cal_july"); ?>',
				'<?php echo $this->lang->line("cal_august"); ?>',
				'<?php echo $this->lang->line("cal_september"); ?>',
				'<?php echo $this->lang->line("cal_october"); ?>',
				'<?php echo $this->lang->line("cal_november"); ?>',
				'<?php echo $this->lang->line("cal_december"); ?>'
			],
			firstDay: '<?php echo $this->lang->line("datepicker_weekstart"); ?>'
		}
    });


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
			password_discipline_confirm:
			{
				equalTo: '#password_discipline'
			},
		},

		messages:
		{
			password_discipline:
			{
				<?php
				if($this->config->item('mandatory_password') == 1)
				{
				?>
				required: "<?php echo $this->lang->line('customers_password_discipline_required'); ?>",
				<?php
				}
				?>
			},
			password_discipline_confirm:
			{
				equalTo: "<?php echo $this->lang->line('customers_password_discipline_must_match'); ?>"
			},
		}
	}, form_support.error));
});
</script>
