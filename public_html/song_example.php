<?php
// Relativ reference til klasse fil
// require_once '../core/classes/song.php';

// Absolut reference til init fil som sikrer vores autoloader
require_once $_SERVER['DOCUMENT_ROOT'] . '/assets/incl/init.php';

$strPageTitle = 'Eksempel på brug af en klassefil';
require_once $_SERVER['DOCUMENT_ROOT'] . '/assets/incl/header.php';

$song = new Song();
$song->title = "Let it be";
$song->artist = "The Beatles";
$song->showMeProps();

require_once $_SERVER['DOCUMENT_ROOT'] . '/assets/incl/footer.php';