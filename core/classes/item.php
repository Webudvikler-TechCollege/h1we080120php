<?php
 /**
 * Eksempel på håndtering af crud funktioner ved hjælp af objektorienteret programmering
 * @author Heinz K, September 2019
 * 
 * @property object $db | Egenskab med globalt DB objekt
 * @property array $columns | Egenskab med emnets felter
 * @property int $id | Egenskab med emnets id
 * @property string $title | Egenskab med emnets titel
 * @property int $created | Egenskab med timestamp af tidspunkt for oprettelse
 * @property bool $deleted | Egenskab med boolsk værdi der angiver om bruger er slettet eller ej
 */

class Item {
    private $db;
    private $columns;
    
	public $id;
	public $title;
	public $created;
    public $deleted;

    // Class constructor
    public function __construct() {
        // Globaliserer db objekt og tildeler det til klassens db egenskab
    	global $db;
        $this->db = $db;
        
        // Sætter columns array med PDO datatyper
    	$this->columns = [
		    "id" => [PDO::PARAM_INT],
		    "title" => [PDO::PARAM_STR],
		    "created" => [PDO::PARAM_INT]
	    ];        
    }
        
    /**
     * READ MULTIPLE
     * Metode til at hente alle rækker med
     * @param $key | Sorteringsnøgle - default er id
     * @param $dir | Sorteringsretninger - ASC for stigende og DESC for faldende
     * @return array | Returnerer et array med alle emnets rækker
     */
    public function getAllRecords($skey = "id", $sdir = "ASC") {
        $sql = "SELECT id, title " .
               "FROM item " .
               "WHERE deleted = 0 " .
               "ORDER BY " . $skey . " " . $sdir;
        return $this->db->query($sql);
    }
	
	/**
     * READ SINGLE
	 * Henter en række ud fra et id
	 * @param $id | Det pågældende emnes id
	 * @return array | Returnerer felterne i den pågældende række
	 */
	public function getRecordById($id) {
		$params = array(
            "id" => array($id, PDO::PARAM_INT)
		);
        $sql = "SELECT title, created " .
                "FROM item " .
                "WHERE id = :id";
        $row = $this->db->query($sql, $params, Db::RESULT_SINGLE);
        // Looper columns og sætter værdier på klassens egenskaber
        foreach($this->columns as $key => $value) {
            if(isset($row[$key])) {
                $this->$key = $row[$key];
            }
        } 
        return $row;       
    }

    /**
     * CREATE
     * Opretter en række
     * @return int | Returnerer id på den nye række
     */
    public function createRecord($title, $created) {
        $this->title = (string)$title;

		$params = array(
            "title" => array($this->title, PDO::PARAM_STR)
		);

        $sql = "INSERT INTO item(title) " . 
                "VALUES(:title)";
        $this->db->query($sql, $params);
        return $this->db->lastInsertId();
    }    

    /**
     * UPDATE
     * Opdaterer en række
     * @return int | Returnerer id på den nye række
     */
    public function updateRecord() {
		$params = array(
            "id" => array($this->id, PDO::PARAM_INT),
            "title" => array($this->title, PDO::PARAM_STR)
		);
        $sql = "UPDATE item SET " . 
                "title = :title " . 
                "WHERE id = :id";
        return $this->db->query($sql, $params);
    }

    /**
     * DELETE
     * Sletter en række
     * @return bool | Returnerer sandt hvis det går godt - falsk hvis ikke
     */
    public function deleteRecord() {
		$params = array(
            "id" => array($this->id, PDO::PARAM_INT)
        );
        
        $sql = "DELETE FROM item WHERE id = :id";
        return $this->db->query($sql, $params);
    }

}