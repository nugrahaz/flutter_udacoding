<?php 

	
require_once("database.php");

	$query = $link->query("SELECT * FROM data_notes");
	$result = array();

	while ($rowData = $query->fetch_assoc()) {
		$result[] = $rowData;
	}


	echo json_encode($result);

?>
