<?php

require_once("database.php");

$email = $_POST["email"];
$name = $_POST["name"];
$pass = $_POST["pass"];

$query = $link->query("SELECT * FROM login_flutter WHERE email LIKE '$email'");

$result = array();

while ($rowData = $query->fetch_assoc()) {
    $result[] = $rowData;
}

if (count($result) == 1) {
    //akun tersedia
    echo json_encode("account already exist");
} else {
    //buat akun
    // $query = $link->query("INSERT INTO login_flutter (id, name, email, pass) VALUES (null, '$name', '$email', '$pass')");

    $query = "INSERT INTO login_flutter (id_login, name, email, pass) VALUES (null, '$name', '$email', '$pass')";
    $res = mysqli_query($link, $query);



    if ($res) {
        echo json_encode("true");
    } else {
        echo json_encode("false");
    }
}
