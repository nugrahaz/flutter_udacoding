<?php 

	include 'database.php';

	$id = $_POST['id'];
	$title = $_POST['title'];
	$description = $_POST['description'];

	$link->query("UPDATE data_notes SET title = '".$title."',description = '".$description."' WHERE id = '".$id."'");


?>