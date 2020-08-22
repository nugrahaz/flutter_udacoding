<?php 

	include 'database.php';

	$title = $_POST['title'];
	$description = $_POST['description'];

	$link->query("INSERT INTO data_notes(title,description)VALUES('".$title."','".$description."')");

?>