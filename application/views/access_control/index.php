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
	<div class="panel-heading">
		<div id="lb_name"></div>
	</div>
	<div class="panel-body">
		<img id="pic_filename" src="">
		<br>
		<br>
		<div id="lb_dni"></div>
		<br>
		<div id="lb_dateaccess"></div>
		<br>
	</div>
	<div class="panel-footer">
		<div id="lb_status"></div>
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
					//	CurDate
					var now = new Date();
					var day = ("0" + now.getDate()).slice(-2);
					var month = ("0" + (now.getMonth() + 1)).slice(-2);
					var today = now.getFullYear()+"-"+(month)+"-"+(day)+"T"+now.getHours()+":"+now.getMinutes()+":"+now.getSeconds();
					//	Hidden Fields
		            $('#customer_id').val(resp[0].id);
		            $('#dateaccess').val(today);
		            $('#status').val(resp[0].status);
		            $('#item_id').val(resp[0].item_id);
		            //	V-Card
		            $('#lb_name').html("<b><?php echo $this->lang->line('common_first_name');?>:</b> "+resp[0].name);
		            $('#lb_dateaccess').html("<b><?php echo $this->lang->line('common_date');?>:</b> "+today);
		            $('#lb_dni').html("<b><?php echo $this->lang->line('common_dni');?>:</b> "+resp[0].dni);
		            var status = (resp[0].status == 0 ? "<?php echo $this->lang->line('customers_status_0');?>" : (resp[0].status == 1 ? "<?php echo $this->lang->line('customers_status_1');?>" : "<?php echo $this->lang->line('customers_status_2');?>"));
		            var span = (resp[0].status == 0 ? "<span style='font-size: 135%;' class='label label-danger'>"+status.toUpperCase()+"</span>" : (resp[0].status == 1 ? "<span style='font-size: 135%;' class='label label-success'>"+status.toUpperCase()+"</span>" : "<span style='font-size: 135%;' class='label label-warning'>"+status.toUpperCase()+"</span>"));
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
		source: "<?php echo site_url('customers/suggest'); ?>",
		minChars: 0,
		delay: 15,
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
        $('#lb_name').html("");
        $('#lb_dateaccess').html("");
        $('#lb_dni').html("");
        $('#lb_status').html("");
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
