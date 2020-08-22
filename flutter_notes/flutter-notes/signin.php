<?php

require_once("database.php");

$email = $_POST["email"];
$pass = $_POST["pass"];

$query = $link->query("SELECT * FROM login_flutter WHERE email LIKE '$email'");

$result = array();

while ($rowData = $query->fetch_assoc()) {
    $result[] = $rowData;
}


//data[0] = id, data[1] = name, data[2] = email, data[3] = pass, 
if (count($result) == 1) {
    //akun tersedia
    // $query = $link->query("SELECT * FROM login_flutter WHERE email LIKE '$email'");


    $query = "SELECT * FROM login_flutter WHERE email LIKE '$email' and pass LIKE '$pass'";
    $query2 = $link->query("SELECT * FROM login_flutter WHERE email LIKE '$email' and pass LIKE '$pass'");

    $res = mysqli_query($link, $query);
    $data = mysqli_fetch_array($res);

    $result2 = array();

	while ($rowData2 = $query2->fetch_assoc()) {
	    $result2[] = $rowData2;
	}


    if (count($result2) == 1) {
        //password sama
        $resarr = array();

        array_push($resarr, array("id_login" => $data['0'], "name" => $data['1'], "email" => $data['2'], "pass" => $data['3'],));

        echo json_encode(array("result" => $resarr));
    } else {
        //password salah
        echo json_encode("false");
    }
} else {
    // akun tidak terdaftar
    echo json_encode("dont have account");
}
