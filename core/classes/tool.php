<?php
class Tool {
    /**
     * Metode til at inkludere header med
     * @param str title Sidens titel
     */
    public static function Header($title) {
        $strPageTitle = $title;
        require_once $_SERVER['DOCUMENT_ROOT'] . '/assets/incl/header.php';
    }

    /**
     * Metode til at inkludere footer med
     */    
    public static function Footer() {
        require_once $_SERVER['DOCUMENT_ROOT'] . '/assets/incl/footer.php';
    }

    /**
     * Metode til at vise arrays med
     */
    public static function showArray($array) {
        echo '<pre>';
        print_r($array);
        echo '</pre>';
    }
}