<?php echo form_open('config/save_sunat/', array('id' => 'sunat_config_form', 'enctype' => 'multipart/form-data', 'class' => 'form-horizontal')); ?>
	<div id="config_wrapper">
		<fieldset id="config_info">
			<div id="required_fields_message"><?php echo $this->lang->line('common_fields_required_message'); ?></div>
			<div id="integrations_header"><?php echo $this->lang->line('config_sunat_configuration')?></div>
			<ul id="sunat_error_message_box" class="error_message_box"></ul>

      <div class="form-group form-group-sm">
				<?php echo form_label($this->lang->line('config_sunat_enable'), 'sunat_enable', array('class' => 'control-label col-xs-2')); ?>
				<div class='col-xs-1'>
					<?php echo form_checkbox(array(
						'name' => 'sunat_enable',
						'value' => 'sunat_enable',
						'id' => 'sunat_enable',
						'checked' => $this->config->item('sunat_enable')));?>
  					<label class="control-label">
  						<a href="https://www.apisperu.com/" target="_blank"><span class="glyphicon glyphicon-info-sign" data-toggle="tooltip" data-placement="right" title="<?php echo $this->lang->line('config_sunat_tooltip'); ?>"></span></a>
  					</label>
				</div>
			</div>

			<div class="form-group form-group-sm">
				<?php echo form_label($this->lang->line('config_sunat_url'), 'sunat_url', array('class' => 'control-label col-xs-2')); ?>
				<div class="col-xs-4">
					<div class="input-group">
						<span class="input-group-addon input-sm"><span class="glyphicon glyphicon-globe"></span></span>
						<?php echo form_input(array(
							'name' => 'sunat_url',
							'id' => 'sunat_url',
							'class' => 'form-control input-sm',
							'value' => $this->config->item('sunat_url'))); ?>
					</div>
				</div>
			</div>

			<div class="form-group form-group-sm">
				<?php echo form_label($this->lang->line('config_sunat_token'), 'sunat_token', array('class' => 'control-label col-xs-2')); ?>
				<div class="col-xs-4">
					<div class="input-group">
						<span class="input-group-addon input-sm"><span class="glyphicon glyphicon-cloud"></span></span>
						<?php echo form_input(array(
							'name' => 'sunat_token',
							'id' => 'sunat_token',
							'class' => 'form-control input-sm',
							'value' => $this->config->item('sunat_token'))); ?>
					</div>
				</div>
			</div>

			<div id="integrations_header"><?php echo $this->lang->line('config_sunat_configuration_fe')?></div>



			<div class="form-group form-group-sm">
				<?php echo form_label($this->lang->line('config_sunat_url_fe'), 'sunat_url_fe', array('class' => 'control-label col-xs-2')); ?>
				<div class="col-xs-4">
					<div class="input-group">
						<span class="input-group-addon input-sm"><span class="glyphicon glyphicon-globe"></span></span>
						<?php echo form_input(array(
							'name' => 'sunat_url_fe',
							'id' => 'sunat_url_fe',
							'class' => 'form-control input-sm',
							'value' => $this->config->item('sunat_url_fe'))); ?>
					</div>
				</div>
			</div>

			<div class="form-group form-group-sm">
				<?php echo form_label($this->lang->line('config_sunat_token_fe'), 'sunat_token_fe', array('class' => 'control-label col-xs-2')); ?>
				<div class="col-xs-4">
					<div class="input-group">
						<span class="input-group-addon input-sm"><span class="glyphicon glyphicon-cloud"></span></span>
						<?php echo form_input(array(
							'name' => 'sunat_token_fe',
							'id' => 'sunat_token_fe',
							'class' => 'form-control input-sm',
							'value' => $this->config->item('sunat_token_fe'))); ?>
					</div>
				</div>
			</div>

			<?php echo form_submit(array(
				'name' => 'submit_sunat',
				'id' => 'submit_sunat',
				'value' => $this->lang->line('common_submit'),
				'class' => 'btn btn-primary btn-sm pull-right')); ?>
		</fieldset>
	</div>
<?php echo form_close(); ?>

<script type="text/javascript">
//validation and submit handling
$(document).ready(function()
{
	$('#sunat_config_form').validate($.extend(form_support.handler, {
		submitHandler: function(form) {
			$(form).ajaxSubmit({
				success: function(response) {
					$.notify(response.message, { type: response.success ? 'success' : 'danger'} );
				},
				dataType: 'json'
			});
		},

		errorLabelContainer: '#sunat_error_message_box'
	}));
});
</script>
