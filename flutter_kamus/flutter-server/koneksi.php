<?php
	
	$connect = new mysqli("localhost","root", "", "db_kamus");

	if ($connect) {
		// echo "database terkoneksi";
	} else {
		// echo "database error";
	}

?>
