<?php
$arrNav = array(
    'home' => array('Forside','/'),
    'pdo' => array('Eksempel på PDO kald','/procedural-pdo.php'),
    'dbclass' => array('Eksempel på DB klasse','/how-to-use-db-class.php'),
    'songclass' => array('Eksempel på Sang klasse','/how-to-use-song-class.php'),
    'songlist' => array('API Data - Sang Liste','/song/'),
    'songdetails' => array('API Data - Sang Detaljer','/song/1'),
    'songadd' => array('API Data - Opret sang','/song/form'),
);

$accHtml = '<ul>';

foreach($arrNav as $key => $values) {
    $accHtml .= '<li><a href="' . $values[1] . '">' . $values[0] . '</a></li>';
}
$accHtml .= '</ul>';

echo $accHtml;