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
