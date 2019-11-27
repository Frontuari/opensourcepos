<?php
defined('BASEPATH') OR exit('No direct script access allowed');
// Al requerir el autoload, cargamos todo lo necesario para trabajar
require_once realpath(APPPATH."../vendor/dompdf/dompdf/autoload.inc.php");
use Dompdf\Dompdf;
class Pdfgenerator_lib {
// por defecto, usaremos papel A4 en vertical, salvo que digamos otra cosa al momento de generar un PDF
public function generate($html, $filename='', $stream=TRUE, $paper = 'A4', $orientation = "portrait", $preview = 1)
  {
    $dompdf = new DOMPDF();
    $dompdf->loadHtml($html);
    $dompdf->setPaper($paper, $orientation);
    $dompdf->render();
if ($stream) {
        // "Attachment" => 1 hará que por defecto los PDF se descarguen en lugar de presentarse en pantalla.
        $dompdf->stream($filename, array("Attachment" => $preview));
    }
else
    {
      return $dompdf->output();
    }
  }
}
?>
