<div id="required_fields_message"><?php echo $this->lang->line('common_fields_required_message'); ?></div>

<ul id="error_message_box" class="error_message_box"></ul>

<?php echo form_open('price_conversions/save/'.$price_info->price_id, array('id'=>'price_conversion_edit_form', 'class'=>'form-horizontal')); ?>
	<fieldset id="price_conversions">
		<div class="form-group form-group-sm">
			<?php echo form_label($this->lang->line('price_conversions_valid_from'), 'valid_from', array('class'=>'required control-label col-xs-3')); ?>
			<div class='col-xs-6'>
				<div class="input-group">
					<span class="input-group-addon input-sm"><span class="glyphicon glyphicon-calendar"></span></span>
					<?php echo form_input(array(
							'name'=>'valid_from',
							'id'=>'valid_from',
							'class'=>'form-control input-sm datepicker',
							'value'=>to_datetime(strtotime($price_info->valid_from)))
							);?>
				</div>
			</div>
		</div>

		<div class="form-group form-group-sm">
			<?php echo form_label($this->lang->line('price_conversions_price'), 'price', array('class'=>'required control-label col-xs-3')); ?>
			<div class='col-xs-8'>
				<?php echo form_input(array(
						'name'=>'currency_code',
						'id'=>'currency_code',
						'class'=>'form-control input-sm',
						'type' => 'hidden',
						'value'=>(!empty($price_info->currency_code) ? $price_info->currency_code : $this->config->item('currency_code')))
						);?>
				<?php echo form_input(array(
						'name'=>'price',
						'id'=>'price',
						'class'=>'form-control input-sm',
						'type' => 'number',
						'value'=>$price_info->price)
						);?>
			</div>
		</div>
		
	</fieldset>
<?php echo form_close(); ?>

<script type='text/javascript'>
//validation and submit handling
$(document).ready(function()
{
	<?php $this->load->view('partial/datepicker_locale'); ?>

	$('#valid_from').datetimepicker({
		format: "<?php echo dateformat_bootstrap($this->config->item('dateformat')) . ' ' . dateformat_bootstrap($this->config->item('timeformat'));?>",
		startDate: "<?php echo date($this->config->item('dateformat') . ' ' . $this->config->item('timeformat'), mktime(0, 0, 0, 1, 1, 2010));?>",
		<?php
		$t = $this->config->item('timeformat');
		$m = $t[strlen($t)-1];
		if( strpos($this->config->item('timeformat'), 'a') !== false || strpos($this->config->item('timeformat'), 'A') !== false )
		{
		?>
			showMeridian: true,
		<?php
		}
		else
		{
		?>
			showMeridian: false,
		<?php
		}
		?>
		minuteStep: 1,
		autoclose: true,
		todayBtn: true,
		todayHighlight: true,
		bootcssVer: 3,
		language: '<?php echo current_language_code(); ?>'
	});

	$('#price_conversion_edit_form').validate($.extend({
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
			price: 'required',
			valid_from: 'required'
		},

		messages:
		{
			price: "<?php echo $this->lang->line('price_conversion_price_required'); ?>",
			valid_from: "<?php echo $this->lang->line('price_conversion_valid_from_required'); ?>"
		}
	}, form_support.error));
});
</script>
