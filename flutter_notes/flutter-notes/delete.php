<?php 

	include 'database.php';

	$id = $_POST['id'];

	$link->query("DELETE FROM data_notes WHERE id = '".$id."'");

	?>