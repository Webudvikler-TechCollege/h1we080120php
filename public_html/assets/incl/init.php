<?php
/**
 * Init fil
 * Sætter globale variabler som filstier og database objekt
 */
define("DOCROOT", $_SERVER["DOCUMENT_ROOT"]); 
define("COREROOT", substr(DOCROOT, 0, strrpos(DOCROOT,"/")) . "/core/");

// Inkludere class loader
require_once COREROOT . 'classes/autoload.php';

// Kalder instans af db klasse
$db = new dbconf();

$params = array(
            'id' => array(1, PDO::PARAM_INT)
        );
$sql = "SELECT * FROM user WHERE id = :id";
$row = $db->query($sql);
var_dump($row);