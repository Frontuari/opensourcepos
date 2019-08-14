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
		<div class="row">
            <div class="col-md-6">
				<img id="pic_filename" src="">
				<br>
				<br>
				<div id="lb_dni"></div>
				<div id="lb_discipline"></div>
				<div id="lb_sales"></div>
				<div id="lb_dateaccess"></div>
            </div>
            <div class="col-md-6">
				<br>
				<br>
            	<div id="lb_onhand"></div>
				<br>
				<br>
            	<div id="lb_used"></div>
            </div>
        </div>
	</div>
</div>

<form action="<?php echo site_url($controller_name .'/save'); ?>" method="POST" class="form-horizontal" id="access_control_form">
	<input type="hidden" name="customer_id" id="customer_id">
	<input type="hidden" name="dateaccess" id="dateaccess">
	<input type="hidden" name="onhand" id="onhand">
	<input type="hidden" name="used" id="used">
	<input type="hidden" name="item_id" id="item_id">
	<input type="hidden" name="sale_id" id="sale_id">
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
			url: "<?php echo site_url('customers/check_status/"+ui.item.value+"'); ?>",
			dataType: 'json',
			success: function(resp){
				if(resp[0].item_id.length > 0){
					//	Hidden Fields
		            $('#customer_id').val(resp[0].id);
		            $('#dateaccess').val(resp[0].today);
		            $('#onhand').val(resp[0].onhand);
		            $('#used').val(resp[0].used);
		            $('#item_id').val(resp[0].item_id);
		            $('#sale_id').val(resp[0].sale_id);
		            //	V-Card
		            $('#lb_name').html("<b><?php echo $this->lang->line('common_first_name');?>:</b> "+resp[0].name);
		            $('#lb_discipline').html("<b><?php echo $this->lang->line('customers_rehabilitation_id');?>:</b> "+resp[0].item_name);
		            $('#lb_dateaccess').html("<b><?php echo $this->lang->line('common_date');?>:</b> "+resp[0].today);
		            $('#lb_sales').html("<b><?php echo $this->lang->line('reports_sale_id');?>:</b> POS "+resp[0].sale_id);
		            $('#lb_dni').html("<b><?php echo $this->lang->line('common_dni');?>:</b> "+resp[0].dni);
		            var onhand = (resp[0].onhand == 0 ? "<span style='font-size: 300%;' class='label label-bs label-danger'>"+resp[0].onhand+"</span>" : ((resp[0].onhand > 0 && resp[0].onhand <= 3) ? "<span style='font-size: 300%;' class='label label-bs label-warning'>"+resp[0].onhand+"</span>" : "<span style='font-size: 300%;' class='label label-bs label-success'>"+resp[0].onhand+"</span>"));
		            var used = "<span style='font-size: 200%;' class='label label-bs label-info'>"+resp[0].used+"</span>";
		            $('#lb_onhand').html("<b>Sesiones Disponibles:</b> "+onhand);
		            $('#lb_used').html("<b>Sesiones Usadas:</b> "+used);
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
	    			//	Clear V-Card
			        $('#lb_name').html("");
			        $('#lb_dateaccess').html("");
			        $('#lb_dni').html("");
			        $('#lb_onhand').html("");
			        $('#lb_used').html("");
			        $('#lb_sales').html("");
			        $('#lb_discipline').html("");
			        $('#pic_filename').attr("src","");
			    	$('#pic_filename').css('width','');
			    	$('#pic_filename').css('height','');
					//	Clear Hidden Fields
			        $('#customer_id').val("");
			        $('#dateaccess').val("");
			        $('#onhand').val("");
			        $('#used').val("");
			        $('#sale_id').val("");
			        $('#item_id').val("");
			        //	Clear search field
			        $('#search_key').val("");
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
        $('#lb_onhand').html("");
        $('#lb_used').html("");
        $('#lb_sales').html("");
        $('#lb_discipline').html("");
        $('#pic_filename').attr("src","");
    	$('#pic_filename').css('width','');
    	$('#pic_filename').css('height','');
		//	Clear Hidden Fields
        $('#customer_id').val("");
        $('#dateaccess').val("");
        $('#onhand').val("");
        $('#used').val("");
        $('#sale_id').val("");
        $('#item_id').val("");
        //	Clear search field
        $('#search_key').val("");
	    $.notify(response[0].message, { type: response[0].success ? 'success' : 'danger' });
        $('#search_key').focus();
	  });
	});

});
</script>
