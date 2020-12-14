<?php
$strPageTitle = 'Forside';
require_once $_SERVER['DOCUMENT_ROOT'] . '/assets/incl/header.php';

$dns = "mysql:host=localhost;dbname=songbook;charset=utf8";
$username = "heka";
$password = "password";

try {
    
    $db = new PDO($dns, $username, $password);

    $id = (int)$_GET["id"];
    var_dump($id);

    $sql = "SELECT * FROM song WHERE id = :id";
    $stm = $db->prepare($sql);
    $stm->bindParam(":id", $id);
    $stm->execute();
    $result = $stm->fetchAll(PDO::FETCH_ASSOC);

    var_dump($result);

    $db = null;

} catch(PDOException $error) {
    echo 'Fejl i tilslutning til database: ' . $error;
}

require_once $_SERVER['DOCUMENT_ROOT'] . '/assets/incl/footer.php';