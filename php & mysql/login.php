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
    
    $cek = "SELECT * FROM users WHERE email='$email' and password='$password'";
    $result = mysqli_fetch_array(mysqli_query($con, $cek));

    if(isset($result)){
        $response['value'] = 1;
        $response['message'] = 'Login Berhasil';
        echo json_encode($response);

    } else{
    
            $response['value'] = 0;
            $response['message'] = "login gagal";
            echo json_encode($response);
        }
    }


?>