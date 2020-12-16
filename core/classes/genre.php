<?php
/**
 * Klasse til at håndtere Genrer med
 */
class Genre {
    private $db; // Private db class property

    // Constructor
    // Metode der auto eksekveres når der kaldes en instans af klassen
    public function __construct() {
        global $db; // Globaliserer det globale db objekt så det er synligt i denne metode
        $this->db = $db; // Peger class member db objekt til det globale db objekt 
    }

    // List
    // Metode der returnerer et array med rækker 
    public function list() {
        $sql = 'SELECT id, title 
                FROM genre  
                ORDER BY title
                ';
        return $this->db->query($sql);
    }
}