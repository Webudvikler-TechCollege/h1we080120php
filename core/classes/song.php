<?php
/**
 * Klasse til at håndtere sange med
 */
class Song {
    private $db; // Private db class property
    public $title;
    public $artist;

    // Constructor
    // Metode der auto eksekveres når der kaldes en instans af klassen
    public function __construct() {
        global $db; // Globaliserer det globale db objekt så det er synligt i denne metode
        $this->db = $db; // Peger class member db objekt til det globale db objekt 
    }

    // List
    // Metode der returnerer et array med rækker 
    public function list() {
        $sql = "SELECT * FROM song";
        return $this->db->query($sql);
    }    

    // Dummy Metode til at illustrere hvordan en klasse virker
    public function showMeProps() {
        echo "<h1>" . $this->title . "</h1>";
        echo "<h2>" . $this->artist . "</h2>";

    }
}