<?php
// CORE FEATURES - init.php
require_once $_SERVER['DOCUMENT_ROOT'] . '/assets/incl/init.php';

// Eksempel på db liste udtræk uden parametre
$sql1 = "SELECT * FROM song";
$row1 = $db->query($sql1);
//var_dump($row1);


// Eksempel på db række udtræk med parametre
$params = array(
    "id" => array(3, PDO::PARAM_INT) 
);
$sql2 = "SELECT * FROM song WHERE id = :id";
$row2 = $db->query($sql2, $params, Db::RESULT_SINGLE);
//var_dump($row2);

// Eksempel på db feltværdi udtræk med parametre
$sql3 = "SELECT title FROM song WHERE id = :id";
$row3 = $db->query($sql3, $params, Db::RESULT_VALUE);
//echo $row3;

// Eksempel på kald af sang klasse og list metode
$song = new Song;
var_dump($song->list());