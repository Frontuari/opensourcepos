<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Fiscal Printer views helper
 */

/*
Basic fiscal printer function
*/
function transform_cmd_fiscal_printer($data,$type,$line = '00')
{
	$cmd = "";
	switch ($type) 
	{
		case 'RIF':
			$cmd = "iR*".$data[0];
			if(strlen($cmd) > 40)
			{
				$cmd = substr($str, 0, 40);
			}
			break;
		case 'RS': 
			$cmd = "iS*".$data[0];
			if(strlen($cmd) > 40)
			{
				$cmd = substr($str, 0, 40);
			}
			break;
		case 'IA': 
			$cmd = "i".$line.$data[0];
			if(strlen($cmd) > 40)
			{
				$cmd = substr($str, 0, 40);
			}
			break;
		case 'CM': 
			//	Invoice => @
			//	Credit Note => A
			//	Debit Note => B
			$cmd = $data[0].$data[1];
			if(strlen($cmd) > 40)
			{
				$cmd = substr($str, 0, 40);
			}
			break;
		case 'PR': 

			if($data[0] == 0)
			{
				$tax = " ";
			}
			elseif($data[0] == 16)
			{
				$tax = "!";
			}
			elseif($data[0] == 8)
			{
				$tax = "“";
			}
			else
			{
				$tax = "#";
			}

			$price = sprintf("%010d", str_replace('.', '', number_format($data[1], 2, '.', '')));
			$cantidad = sprintf("%08d", str_replace('.', '', number_format($data[2], 3, '.', '')));
			$codigo = (!empty($data[3]) ? "|".$data[3]."|" : "");
			$description = (strlen($data[4]) > 127 ? substr($data[4], 0, 127) : $data[4]);

			$cmd = $tax.$price.$cantidad.$codigo.$description;
			break;
		case 'FX': 
			$cmd = "k";
			break;
		case 'VO': 
			$cmd = "7";
			break;
		case 'ST': 
			//	SubTotal Printed => 3
			//	Show SubTotal into Display => 4
			$cmd = $data[0];
			break;
		case 'DR': 
			//	Discount or Recharge
			//	By Percent => p
			if($data[0] == "p")
			{
				$cmd = $data[0].$data[1].sprintf("%04d", str_replace('.', '', number_format($data[3], 2, '.', '')));
			}
			//	By Amount => q
			else
			{
				$cmd = $data[0].$data[1].sprintf("%09d", str_replace('.', '', number_format($data[3], 2, '.', '')));
			}
			break;
		case 'VP': 

			if($data[0] == 0)
			{
				$tax = "(0xA0h)";
			}
			elseif($data[0] == 16)
			{
				$tax = "¡";
			}
			elseif($data[0] == 8)
			{
				$tax = "¢";
			}
			else
			{
				$tax = "£";
			}

			$price = sprintf("%010d", str_replace('.', '', number_format($data[1], 2, '.', '')));
			$cantidad = sprintf("%08d", str_replace('.', '', number_format($data[2], 3, '.', '')));
			$codigo = (!empty($data[3]) ? "|".$data[3]."|" : "");
			$description = (strlen($data[4]) > 127 ? substr($data[4], 0, 127) : $data[4]);

			$cmd = $tax.$price.$cantidad.$codigo.$description;
			break;
		case 'AI': 
			$cmd = "iF*".$data[0];
			if(strlen($cmd) > 11)
			{
				$cmd = substr($str, 0, 11);
			}
			$cmd = $cmd."\n";
			break;
		case 'DI': 
			$cmd = "iD*".date('d-m-Y',strtotime($data[0]));
			$cmd = $cmd."\n";
			break;
		case 'FP': 
			$cmd = "iI*".$data[0]."\n";
			break;
		case 'NCPR': 

			if($data[0] == 0)
			{
				$tax = "d0";
			}
			elseif($data[0] == 16)
			{
				$tax = "d1";
			}
			elseif($data[0] == 8)
			{
				$tax = "d2";
			}
			else
			{
				$tax = "d3";
			}

			$price = sprintf("%010d", str_replace('.', '', number_format($data[1], 2, '.', '')));
			$cantidad = sprintf("%08d", str_replace('.', '', number_format($data[2], 3, '.', '')));
			$codigo = (!empty($data[3]) ? "|".$data[3]."|" : "");
			$description = (strlen($data[4]) > 127 ? substr($data[4], 0, 127) : $data[4]);

			$cmd = $tax.$price.$cantidad.$codigo.$description;
			break;
		case 'NCVP': 

			if($data[0] == 0)
			{
				$tax = "ä0";
			}
			elseif($data[0] == 16)
			{
				$tax = "ä1";
			}
			elseif($data[0] == 8)
			{
				$tax = "ä2";
			}
			else
			{
				$tax = "ä3";
			}

			$price = sprintf("%010d", str_replace('.', '', number_format($data[1], 2, '.', '')));
			$cantidad = sprintf("%08d", str_replace('.', '', number_format($data[2], 3, '.', '')));
			$codigo = (!empty($data[3]) ? "|".$data[3]."|" : "");
			$description = (strlen($data[4]) > 127 ? substr($data[4], 0, 127) : $data[4]);

			$cmd = $tax.$price.$cantidad.$codigo.$description;
			break;
		case 'NDPR': 

			if($data[0] == 0)
			{
				$tax = "`0";
			}
			elseif($data[0] == 16)
			{
				$tax = "`1";
			}
			elseif($data[0] == 8)
			{
				$tax = "`2";
			}
			else
			{
				$tax = "`3";
			}

			$price = sprintf("%010d", str_replace('.', '', number_format($data[1], 2, '.', '')));
			$cantidad = sprintf("%08d", str_replace('.', '', number_format($data[2], 3, '.', '')));
			$codigo = (!empty($data[3]) ? "|".$data[3]."|" : "");
			$description = (strlen($data[4]) > 127 ? substr($data[4], 0, 127) : $data[4]);

			$cmd = $tax.$price.$cantidad.$codigo.$description;
			break;
		case 'NDVP': 

			if($data[0] == 0)
			{
				$tax = "à0";
			}
			elseif($data[0] == 16)
			{
				$tax = "à1";
			}
			elseif($data[0] == 8)
			{
				$tax = "à2";
			}
			else
			{
				$tax = "à3";
			}

			$price = sprintf("%010d", str_replace('.', '', number_format($data[1], 2, '.', '')));
			$cantidad = sprintf("%08d", str_replace('.', '', number_format($data[2], 3, '.', '')));
			$codigo = (!empty($data[3]) ? "|".$data[3]."|" : "");
			$description = (strlen($data[4]) > 127 ? substr($data[4], 0, 127) : $data[4]);

			$cmd = $tax.$price.$cantidad.$codigo.$description;
			break;
		default:
			break;
	}

	return $cmd;
}
?>
