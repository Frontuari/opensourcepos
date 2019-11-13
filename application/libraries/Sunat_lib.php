<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Sunat library
 *
 * Library with utilities to send texts via Sunat Gateway (requires proxy implementation)
 */

class Sunat_lib
{
	private $CI;

  	public function __construct()
	{
		$this->CI =& get_instance();
	}

	public function sendInvoice()
	{
		$url   = $this->CI->config->item('sunat_url_fe');
		$token = $this->CI->config->item('sunat_token_fe');

		// if any of the parameters is empty return with a FALSE
		if(empty($url) || empty($token))
		{
		  echo $url . ' ' . $token;
		}
		else
		{
		  // make sure passed string is url encoded
		  $data = rawurlencode($data);
		  $authorization = "Authorization: Bearer ".$token;

		  $args = [
		      "serie_documento" =>  "F001",
		      "numero_documento" =>  "#",
		      "fecha_de_emision" =>  "2018-10-09",
		      "hora_de_emision" =>  "10:11:11",
		      "codigo_tipo_operacion" =>  "0101",
		      "codigo_tipo_documento" => "01",
		      "codigo_tipo_moneda" =>  "PEN",
		      "fecha_de_vencimiento" => "2018-08-30",
		      "numero_orden_de_compra" =>  "0045467898",
		      "datos_del_cliente_o_receptor" => array(
		        "codigo_tipo_documento_identidad" =>  "6",
		        "numero_documento" =>  "10414711225",
		        "apellidos_y_nombres_o_razon_social" =>  "EMPRESA XYZ S.A.",
		        "codigo_pais" =>  "PE",
		        "ubigeo" =>  "150101",
		        "direccion" =>  "Av. 2 de Mayo",
		        "correo_electronico" =>  "demo@gmail.com",
		        "telefono" =>  "427-1148"
		      ),
		      "totales" =>  array(
		        "total_exportacion" =>  0.00,
		        "total_operaciones_gravadas" =>  100.00,
		        "total_operaciones_inafectas" =>  0.00,
		        "total_operaciones_exoneradas" =>  0.00,
		        "total_operaciones_gratuitas" =>  0.00,
		        "total_igv" =>  18.00,
		        "total_impuestos" =>  18.00,
		        "total_valor" =>  100,
		        "total_venta" =>  118
		      ),
		      "items" => [
		        array(
		          "codigo_interno" =>  "P0121",
		          "descripcion" => "Inca Kola 250 ml",
		          "codigo_producto_sunat" =>  "51121703",
		          "unidad_de_medida" =>  "NIU",
		          "cantidad" =>  2,
		          "valor_unitario" =>  50,
		          "codigo_tipo_precio" =>  "01",
		          "precio_unitario" =>  59,
		          "codigo_tipo_afectacion_igv" =>  "10",
		          "total_base_igv" =>  100.00,
		          "porcentaje_igv" =>  18,
		          "total_igv" =>  18,
		          "total_impuestos" =>  18,
		          "total_valor_item" =>  100,
		          "total_item" =>  118
		        )
		      ],
		      "informacion_adicional" =>  "Forma de pago:Efectivo|Caja: 1"
		  ];

		  if(($ch = curl_init()) !== FALSE)
		  {
		    curl_setopt($ch, CURLOPT_URL, $url);
		    curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json', $authorization ));
		    //curl_setopt($ch, CURLOPT_USERPWD, "user:" . $this->_api_key);
		    //curl_setopt($ch, CURLOPT_USERAGENT, 'PHP-MCAPI/3.0');
		    curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
		    curl_setopt($ch, CURLOPT_TIMEOUT, 10);
		    curl_setopt($ch, CURLOPT_POST, FALSE);
		    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
		    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($args));
		    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");

		    $response = curl_exec($ch);

		    curl_close($ch);
		  }
		}

		return $response;
		}

	/*
	 * Sunat sending function
	 * Example of use: $response = sendSunat('4477777777', 'My test message');
	 */
	public function getData($type, $data)
	{
		$url   = $this->CI->config->item('sunat_url');
		$token = $this->CI->config->item('sunat_token');

		// if any of the parameters is empty return with a FALSE
		if(empty($url) || empty($token))
		{
			echo $url . ' ' . $token;
		}
		else
		{
			// make sure passed string is url encoded
			$data = rawurlencode($data);

			$url.= $type.'/'.$data.'?token='.$token;

			if(($ch = curl_init()) !== FALSE)
			{
				curl_setopt($ch, CURLOPT_URL, $url);
				curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json'));
				//curl_setopt($ch, CURLOPT_USERPWD, "user:" . $this->_api_key);
				//curl_setopt($ch, CURLOPT_USERAGENT, 'PHP-MCAPI/3.0');
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
				curl_setopt($ch, CURLOPT_TIMEOUT, 10);
				curl_setopt($ch, CURLOPT_POST, FALSE);
				curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
				//curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($args));
				//curl_setopt($ch, CURLOPT_CUSTOMREQUEST, $httpVerb);

				$response = curl_exec($ch);

				curl_close($ch);
			}
		}

		return $response;
	}
}

?>
