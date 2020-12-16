<?php
/**
 * Sætter DB Credentials
 */
$dns = "mysql:host=localhost;dbname=songbook;charset=utf8";
$username = "heka";
$password = "password";

/**
 * Connector med errorhandling
 */
try {
    
    // Opretter forbindelse med PDO klassen
    $db = new PDO($dns, $username, $password);

    // Henter og typecaster GET parameter id som et tal
    $id = (int)$_GET["id"];

    // SQL Query
    $sql = "SELECT * FROM song WHERE id = :id";
    // Prepare statement
    $stm = $db->prepare($sql);
    // Binder parametre
    $stm->bindParam(":id", $id);
    // Eksekverer forespørgsel
    $stm->execute();
    // Sætter result til resultatet af en fetchAll
    $result = $stm->fetchAll(PDO::FETCH_ASSOC);
    // Dumåper result
    var_dump($result);
    // Nulstiller forbindelsen
    $db = null;

} catch(PDOException $error) {
    echo 'Fejl i tilslutning til database: ' . $error;
}