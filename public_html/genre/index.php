<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/assets/incl/init.php';

/**
 * Get Route: liste af sange
 */
Route::add('/genre/', function () {
    $genre = new Genre;
    $response = $genre->list();
    echo json_encode($response);
});

/**
 * Get Route: genre detaljer ud fra get id
 * @param int $id
 */
Route::add('/genre/([0-9]*)', function ($id) {
    $genre = new Genre;
    $response = $genre->get($id);
    echo json_encode($response);
});

Route::run('/');