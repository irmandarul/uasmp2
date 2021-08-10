<?php


define('HOST', 'localhost');
define('USER', 'u5038943_dkm');
define('PASS', 'Jazman99');
define('DB', 'u5038943_zakat');

$con = mysqli_connect(HOST, USER, PASS, DB) or die('tidak bisa konek');


if($_SERVER['REQUEST_METHOD'] == "POST"){
    $response = array();
    $email = $_POST['email'];
    $password = md5($_POST['password']);
    $nama = $_POST['nama'];
    $no_hp = $_POST['no_hp'];
    $cek = "SELECT * FROM users WHERE email='$email'";
    $result = mysqli_fetch_array(mysqli_query($con, $cek));

    if(isset($result)){
        $response['value'] = 2;
        $response['message'] = 'email telah digunakan';
        echo json_encode($response);

    } else{
        $insert = "INSERT INTO users (nama, email, password) VALUES ('$nama', '$email','$password')";
        if(mysqli_query($con, $insert)){
            $response ['value'] = 1;
            $response ['message'] = "Berhasil didaftarkan";
            echo json_encode($response);

        }else{
            $response['value'] = 0;
            $response['message'] = "gagal didaftarkan";
            echo json_encode($response);
        }
    }
}

?>