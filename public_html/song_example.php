<?php
//require_once '../core/classes/song.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/assets/incl/init.php';

$strPageTitle = 'Eksempel på brug af en klassefil';
require_once $_SERVER['DOCUMENT_ROOT'] . '/assets/incl/header.php';

$song = new Song();
$song->title = "Let it be";
$song->artist = "The Beatles";
$song->showMeProps();

require_once $_SERVER['DOCUMENT_ROOT'] . '/assets/incl/footer.php';