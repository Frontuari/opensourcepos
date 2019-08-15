<?php $this->load->view("partial/header"); ?>

<script type="text/javascript">
	dialog_support.init("a.modal-dlg");
</script>

<h3 class="text-center"><?php echo $this->lang->line('common_search_customers_message'); ?></h3>


<div class='md-form mt-0'>
	<ul id="error_message_box" class="error_message_box"></ul>
	<div class="input-group">
		<span class="input-group-addon input-sm"><span class="glyphicon glyphicon-search"></span></span>
		<input type="search" name="search_key" id="search_key" class="form-control input-sm"  placeholder="<?php echo $this->lang->line('common_search_customers');?>">
	</div>
</div>
<br>
<div class="panel panel-info" id="v-card">
	<div class="panel-body">
		<div class="row">
            <div class="col-md-6">
				<img id="pic_filename" src="">
				<br>
				<br>
				<div id="lb_dni"></div>
				<div id="lb_duedate"></div>
				<div id="lb_dateaccess"></div>
				<div id="lb_exhonerated"></div>
            </div>
            <div class="col-md-6">
				<br>
				<div id="lb_name"></div>
				<br>
				<br>
            	<div id="lb_status"></div>
				<br>
				<br>
				<div id="lb_discipline"></div>
            	<br>
				<div id="lb_deudado"></div>
            </div>
        </div>
	</div>
</div>

<form action="<?php echo site_url($controller_name .'/save'); ?>" method="POST" class="form-horizontal" id="access_control_form">
	<input type="hidden" name="customer_id" id="customer_id">
	<input type="hidden" name="dateaccess" id="dateaccess">
	<input type="hidden" name="status" id="status">
	<input type="hidden" name="item_id" id="item_id">
	<input type="submit" class="btn btn-info" value="Enviar">
</form>

<?php $this->load->view("partial/footer"); ?>

<script type="text/javascript">
//validation and submit handling
$(document).ready(function()
{
	var fill_value = function(event, ui) {
		event.preventDefault();
		$.ajax({
			type: 'GET',
			url: "<?php echo site_url('customers/get_status/"+ui.item.value+"'); ?>",
			dataType: 'json',
			success: function(resp){
				if(resp.length > 0){
					//	Hidden Fields
		            $('#customer_id').val(resp[0].id);
		            $('#dateaccess').val(resp[0].today);
		            $('#status').val(resp[0].status);
		            $('#item_id').val(resp[0].item_id);
		            //	V-Card
		            if(resp[0].is_exhonerated == 1)
		            {
		            	$('#lb_exhonerated').html("<b style='color: green;font-size: x-large;'><?php echo $this->lang->line('customers_exhonerated');?></b>");	
		            }
		            if(resp[0].deudado > 0)
		            {
						$('#lb_deudado').html("<b><?php echo $this->lang->line('sales_due');?>:</b><span style='color: red;font-size: x-large;'>"+resp[0].deudado+"</span>");
		            }
		            else
		            {
		            	$('#lb_deudado').html("");
		            }
		            $('#lb_name').html("<b><?php echo $this->lang->line('common_first_name');?>:</b> <span style='color: black;font-size: x-large;'>"+resp[0].name+"</span>");
		            $('#lb_discipline').html("<b><?php echo $this->lang->line('customers_discipline_id');?>:</b> <span style='color: black;font-size: large;'>"+resp[0].item_name+"</span>");
		            $('#lb_dateaccess').html("<b><?php echo $this->lang->line('common_date');?>:</b> "+resp[0].today);
		            $('#lb_duedate').html("<b><?php echo $this->lang->line('customers_service_duedate');?>:</b> "+resp[0].service_duedate);
		            $('#lb_dni').html("<b><?php echo $this->lang->line('common_dni');?>:</b> "+resp[0].dni);
		            var status = (resp[0].status == 0 ? "<?php echo $this->lang->line('customers_status_0');?>" : (resp[0].status == 1 ? "<?php echo $this->lang->line('customers_status_1');?>" : "<?php echo $this->lang->line('customers_status_2');?>"));
		            var span = (resp[0].status == 0 ? "<span style='font-size: 500%;' class='label label-bs label-danger'>"+status.toUpperCase()+"</span>" : (resp[0].status == 1 ? (resp[0].daysplace > 5 ? "<span style='font-size: 500%;' class='label label-bs label-success'>"+status.toUpperCase()+"</span>" : "<span style='font-size: 500%;' class='label label-bs label-warning'>"+status.toUpperCase()+"</span>") : "<span style='font-size: 400%;' class='label label-bs label-warning'>"+status.toUpperCase()+"</span>"));
		            $('#lb_status').html("<b><?php echo $this->lang->line('common_state');?>:</b> "+span);
		            if(resp[0].pic_filename.length > 0)
		            {
		            	$('#pic_filename').attr("src","./uploads/customer_pics/"+resp[0].pic_filename);
		            	$('#pic_filename').css('width',150);
		            	$('#pic_filename').css('height',150);
		            }
		            else
		            {
		            	if(resp[0].gender == 0)
		            	{
		            		$('#pic_filename').attr("src","./uploads/customer_pics/woman.png");
			            	$('#pic_filename').css('width',150);
			            	$('#pic_filename').css('height',150);	
		            	}
		            	else
		            	{
		            		$('#pic_filename').attr("src","./uploads/customer_pics/men.png");
			            	$('#pic_filename').css('width',150);
			            	$('#pic_filename').css('height',150);	
		            	}
		            }
				}
				else{
	    			$.notify("<?php echo $this->lang->line('customers_none_records') ?>", { type: 'warning' });
				}
	        },
	        error: function(jqXHR, textStatus, errorThrown){
	            console.log(jqXHR);
	        }
		});
	};

	$('#search_key').autocomplete({
		source: "<?php echo site_url('customers/suggest_accesscontrol'); ?>",
		minChars: 0,
		delay: 0,
		cacheLength: 1,
		select: fill_value
	});

	$('#access_control_form').submit(function(/*DOMEvent*/ e){
	  e.preventDefault();

	  var url = $(this).attr('action'),
	      data = $(this).serialize();
	  $.post(url, data, function(response){
	    /* Do something with the response, here we'll just log it to the console */
	    response = JSON.parse(response);
	    //	Clear V-Card
	    $('#lb_exhonerated').html("");
        $('#lb_name').html("");
        $('#lb_deudado').html("");
        $('#lb_dateaccess').html("");
        $('#lb_dni').html("");
        $('#lb_status').html("");
        $('#lb_discipline').html("");
        $('#lb_duedate').html("");
        $('#pic_filename').attr("src","");
    	$('#pic_filename').css('width','');
    	$('#pic_filename').css('height','');
		//	Clear Hidden Fields
        $('#customer_id').val("");
        $('#dateaccess').val("");
        $('#status').val("");
        $('#item_id').val("");
        //	Clear search field
        $('#search_key').val("");
	    $.notify(response[0].message, { type: response[0].success ? 'success' : 'danger' });
        $('#search_key').focus();
	  });
	});

});
</script>
