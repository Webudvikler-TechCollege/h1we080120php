<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/assets/incl/init.php';


// Base Route til sang liste
Route::add('/songs', function () {
    $song = new Song;
    $data = $song->list();
    echo json_encode($data);
});

// Sang detaljer
Route::add('/song/([0-9]*)', function ($id) {
    var_dump($id);
});

// Post route example
Route::add('/song/form', function () {
    echo '<form method="post">';
    echo '<label for="title">Titel:</label><input type="text" name="title" id="title" />';
    echo '<label for="content">Tekst:</label><textarea name="content" id="content"></textarea>';
    echo '<input type="submit" value="send" />';
    echo '</form>';
}, 'get');

// Post route example
Route::add('/song/form', function () {
    echo 'Hey! The form has been sent:<br/>';
    print_r($_POST);
}, 'post');

// Accept only numbers as parameter. Other characters will result in a 404 error
Route::add('/foo/([0-9]*)/bar', function ($var1) {
    echo $var1 . ' is a great number!';
});

Route::run('/');
