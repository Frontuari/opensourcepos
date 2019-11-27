<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <title>Arqueo de Caja General</title>
	    <style type="text/css">
			#page_title
			{
				font-size: 22px;
				font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
				font-weight: 400;
			}

			table {
			  background-color: transparent;
			}

			.table {
			  width: 100%;
			  max-width: 100%;
			  margin-bottom: 20px;
			}
			.table > thead > tr > th,
			.table > tbody > tr > th,
			.table > tfoot > tr > th,
			.table > thead > tr > td,
			.table > tbody > tr > td,
			.table > tfoot > tr > td {
			  padding: 8px;
			  line-height: 1.42857143;
			  vertical-align: top;
			  border-top: 1px solid #ddd;
			}
			.table > thead > tr > th {
			  vertical-align: bottom;
			  border-bottom: 2px solid #ddd;
			}
			.table > caption + thead > tr:first-child > th,
			.table > colgroup + thead > tr:first-child > th,
			.table > thead:first-child > tr:first-child > th,
			.table > caption + thead > tr:first-child > td,
			.table > colgroup + thead > tr:first-child > td,
			.table > thead:first-child > tr:first-child > td {
			  border-top: 0;
			}
			.table > tbody + tbody {
			  border-top: 2px solid #ddd;
			}
			.table .table {
			  background-color: #fff;
			}

			.table-striped > tbody > tr:nth-of-type(odd) {
			  background-color: #f9f9f9;
			}

			.table-bordered th,
			.table-bordered td {
			  border: 1px solid #ddd !important;
			}

			.table-bordered {
			  border: 1px solid #ddd;
			}
			.table-bordered > thead > tr > th,
			.table-bordered > tbody > tr > th,
			.table-bordered > tfoot > tr > th,
			.table-bordered > thead > tr > td,
			.table-bordered > tbody > tr > td,
			.table-bordered > tfoot > tr > td {
			  border: 1px solid #ddd;
			}
			.table-bordered > thead > tr > th,
			.table-bordered > thead > tr > td {
			  border-bottom-width: 2px;
			}
	    </style>
	</head>
	<body>
		<div id="page_title" class="btn-toolbar">
			<?php echo $this->lang->line('incomes_summary').": ".$subtitle; ?>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div id="table_holder">
						<?php echo $this->lang->line('overall_cashs_openingbalance') . ': ' .to_currency((!empty($overall_cash_summary->startbalance) ? $overall_cash_summary->startbalance : 0)); ?>
						<br>
						<?php echo 'Recibo de '.$this->lang->line('incomes_one_or_multiple') . ': ' .to_currency((!empty($overall_cash_summary->income) ? $overall_cash_summary->income : 0)); ?>
						<br>
						<?php echo 'Recibo de '.$this->lang->line('costs_one_or_multiple') . ': ' .to_currency((!empty($overall_cash_summary->cost) ? $overall_cash_summary->cost : 0)); ?>
						<br>
						<?php echo 'Compras: ' .to_currency((!empty($overall_cash_summary->purchase) ? $overall_cash_summary->purchase : 0)); ?>
						<br>
						<?php echo $this->lang->line('overall_cashs_endingbalance') . ': ' .to_currency((!empty($overall_cash_summary->endingbalance) ? $overall_cash_summary->endingbalance : 0)); ?>
					</div>
				</div>
				<div class="col-md-6">
					<div id="table_holder">
						<?php echo $this->lang->line('overall_cashs_openingbalance') . ': ' .to_usd((!empty($overall_cash_summary->usdstartbalance) ? $overall_cash_summary->usdstartbalance : 0)); ?>
						<br>
						<?php echo 'Recibo de '.$this->lang->line('incomes_one_or_multiple') . ': ' .to_usd((!empty($overall_cash_summary->usdincome) ? $overall_cash_summary->usdincome : 0)); ?>
						<br>
						<?php echo 'Recibo de '.$this->lang->line('costs_one_or_multiple') . ': ' .to_usd((!empty($overall_cash_summary->usdcost) ? $overall_cash_summary->usdcost : 0)); ?>
						<br>
						<?php echo 'Compras: ' .to_usd((!empty($overall_cash_summary->usdpurchase) ? $overall_cash_summary->usdpurchase : 0)); ?>
						<br>
						<?php echo $this->lang->line('overall_cashs_endingbalance') . ': ' .to_usd((!empty($overall_cash_summary->usdendingbalance) ? $overall_cash_summary->usdendingbalance : 0)); ?>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
