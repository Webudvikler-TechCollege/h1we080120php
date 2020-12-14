<?php
class Song {
    public $title;
    public $artist;

    public function showMeProps() {
        echo "<h1>" . $this->title . "</h1>";
        echo "<h2>" . $this->artist . "</h2>";

    }
}