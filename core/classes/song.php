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
        $sql = 'SELECT s.id, s.title, s.content, g.title AS genre_title, name    
                FROM song s 
                JOIN genre g 
                ON s.genre_id = g.id 
                JOIN song_album_rel x 
                ON s.id = x.song_id 
                JOIN album a 
                ON x.album_id = a.id 
                JOIN artist ar  
                ON a.artist_id = ar.id 
                ';
        return $this->db->query($sql);
    }

    public function get($id) {
        $params = array(
            "id" => array($id, PDO::PARAM_INT)
        );

        $sql = 'SELECT s.id, s.title, s.content, g.title AS genre_title, name    
                FROM song s 
                JOIN genre g 
                ON s.genre_id = g.id 
                JOIN song_album_rel x 
                ON s.id = x.song_id 
                JOIN album a 
                ON x.album_id = a.id 
                JOIN artist ar  
                ON a.artist_id = ar.id 
                WHERE s.id = :id
                ';
        return $this->db->query($sql, $params);

    }    
    
    public function create($title, $content, $genre_id) {
        $params = array(
            "title" => array($title, PDO::PARAM_STR),
            "content" => array($content, PDO::PARAM_STR),
            "genre_id" => array($genre_id, PDO::PARAM_INT)
        );

        $sql = "INSERT INTO song(title, content, genre_id) " . 
                "VALUES(:title, :content, :genre_id)";
        $this->db->query($sql, $params);
        return $this->db->lastInsertId();
    }

    public function update() {

    }
    
    public function delete($id) {
        $params = array(
            "id" => array($id, PDO::PARAM_INT)
        );

        $sql = "DELETE FROM song WHERE id = :id";
        return $this->db->query($sql, $params);
    }
}