<?php
/**
 * init.php indeholder core features som autoloader, db objekt m.m.
 */
require_once $_SERVER['DOCUMENT_ROOT'] . '/assets/incl/init.php';

/**
 * HTML Header
 * Hentes som en statisk metode i klassen Tool
 * Sidens titel sendes med som argument
 */
Tool::Header('Eksempel på brug af en sang klasse');



/**
 * Henter id fra GET param. Sættes til 0 hvis det ikke findes
 */
$id = (isset($_GET["id"]) && !empty($_GET["id"])) ? $_GET["id"] : 0;



/**
 * Eksempel på instans kald af klassen song
 */
$song = new Song(); // Opretter instans af klassen



/**
 * Henter liste
 */
//$data = $song->list(); // Kalder list metode
//Tool::showArray($data); // Udskriver data med array venlig metode fra Tool klasse



/**
 * Henter enkelt sang ud fra id (GET)
 */
//$data = $song->get($id); // Kalder get metode
//Tool::showArray($data); // Udskriver data med array venlig metode fra Tool klasse



/**
 * Opretter sang
 */
//$song->title = "To mus i en spand";
//$song->content = "Der sad tio mus i en spand";
//$song->genre_id = 1;
//$song->create();


/**
 * Sletter sang ud fra id (GET)
 */
//echo $song->delete($id);

/**
 * HTML Footer
 * Hentes som en statisk metode i klassen Tool
 */
Tool::Footer();