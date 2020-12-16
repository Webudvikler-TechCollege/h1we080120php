<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/assets/incl/init.php';

/**
 * Get Route: liste af sange
 */
Route::add('/songs', function () {
    $song = new Song;
    $response = $song->list();
    echo json_encode($response);
});

/**
 * Get Route: sang detaljer ud fra get id
 * @param int $id
 */
Route::add('/song/([0-9]*)', function ($id) {
    $song = new Song;
    $response = $song->get($id);
    echo json_encode($response);
});

/**
 * Get Route: Form til oprettelse af ny sang
 * Input felter er struktureret i et array
 */
Route::add('/song/form', function () {
    Tool::Header('Tilføj ny sang');

    // Henter liste af genrer til select box
    $genre = new Genre;
    $genre_list = $genre->list();

    // Deklarerer string var til html output
    $accHtml = '<form method="post">';

    // Deklarerer array var til input felter
    $arrFields = array(
        'title' => array('Titel', 'text', ''),
        'content' => array('Tekst', 'textarea', ''),
        'genre_id' => array('Genre', 'select', $genre_list)
    );

    // Looper input array og bygger formular
    foreach($arrFields as $key => $arrFieldValues) {
        switch($arrFieldValues[1]) {
            default:
            case "text":
                $accHtml .= '<div><label for="' . $key . '">' . $arrFieldValues[0] . ':</label>' . 
                            '  <input type="text" name="' . $key . '" id="' . $key . '" />' . 
                            '</div>';
                break;
            case "textarea":
                $accHtml .= '<div><label for="' . $key . '">' . $arrFieldValues[0] . ':</label>' . 
                            '  <textarea name="' . $key . '" id="' . $key . '"></textarea>' . 
                            '</div>';
                break;
            case "select":
                $accHtml .= '<div><label for="' . $key . '">' . $arrFieldValues[0] . ':</label>' . 
                            '<select name="' . $key . '" id="' . $key . '">';
                foreach($arrFieldValues[2] as $fieldValue) {
                    $accHtml .= '<option value="' . $fieldValue['id'] . '">' . $fieldValue['title'] . '</option>';
                }
                $accHtml .= '</select>' . 
                            '</div>';
                break;
        }
    }
    $accHtml .= '<input type="submit" value="send" />';
    $accHtml .= '</form>';

    // Udskriver html var
    echo $accHtml;

    Tool::Footer();
}, 'get');

/**
 * Post Route: Opretter ny sang
 */
Route::add('/song/form', function () {
    $song = new Song;
    $song->title = (string)$_POST['title'];
    $song->content = (string)$_POST['content'];
    $song->genre_id = (int)$_POST['genre_id'];
    $id = $song->create();

    $response = array(
        "id" => $id
    );
    echo json_encode($response);
}, 'post');

/**
 * Get Route: Sletter sang ud fra get id
 * @param int $id
 */
Route::add('/song/delete/([0-9]*)', function ($id) {
    $song = new Song;
    $song->delete($id);
    $response = array(
        'message' => 'delete ok'
    );
    echo json_encode($response);
}, 'get');

Route::run('/');
