<?php 

	$hostname = 'localhost';
	$username = 'root';
	$pass = '';
	$dbname = 'db_notes';

	$link = new mysqli($hostname,$username,$pass,$dbname);


	if ($link->connect_errno) {
		printf('gagal koneksi ke database', $link->connect_errno);
		exit();
	}

?>