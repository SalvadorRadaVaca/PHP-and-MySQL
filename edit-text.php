<?php
$file = 'text.txt';

if(isset($_GET['file'])) {

    $file = $_GET['file'];

    if($_GET['action'] == 'Save') {
        file_put_contents($file, $_GET['text']);
    }
}

$text = file_get_contents($file);
?>

<h1>Edit text file</h1>

<form>
    <label>File name:</label>
    <input type="text" name="file" value="<?=$file?>" /><br/>
    <textarea name="text"><?=$text?></textarea>
    <br/>
    <input type="submit" value="Save" name="action" />
    <input type="submit" value="Load" name="action" />
</form>

<style>
    textarea {
        margin: 0px; width: 249px; height: 100px;
    }
</style>