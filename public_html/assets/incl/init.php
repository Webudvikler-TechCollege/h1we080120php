<?php
/**
 * Init fil
 * Sætter globale variabler som filstier og database objekt
 */

// Definerer konstant med sti til document root
define("DOCROOT", $_SERVER["DOCUMENT_ROOT"]); 
// Definerer konstant med sti til core mappe
define("COREROOT", substr(DOCROOT, 0, strrpos(DOCROOT,"/")) . "/core/");

// Inkludere class loader
require_once COREROOT . 'classes/autoload.php';

// Kalder database objekt
$db = new dbconf();

