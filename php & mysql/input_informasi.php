<?php
define('HOST', 'localhost');
define('USER', 'u5038943_dkm');
define('PASS', 'Jazman99');
define('DB', 'u5038943_zakat');

$con = mysqli_connect(HOST, USER, PASS, DB) or die('tidak bisa konek');


if($_SERVER['REQUEST_METHOD'] == "POST"){
    $response = array();
    $deskripsi = $_POST['deskripsi'];
    $judul = $_POST['judul'];
    $cek = "SELECT * FROM informasi WHERE judul='$judul'";
    $result = mysqli_fetch_array(mysqli_query($con, $cek));

    if(isset($result)){
        $response['value'] = 2;
        $response['message'] = 'judul telah digunakan';
        echo json_encode($response);

    } else{
        $insert = "INSERT INTO informasi (judul, deskripsi) VALUES ('$judul', '$deskripsi')";
        if(mysqli_query($con, $insert)){
            $response ['value'] = 1;
            $response ['message'] = "Berhasil disimpan";
            echo json_encode($response);

        }else{
            $response['value'] = 0;
            $response['message'] = "gagal disimpan";
            echo json_encode($response);
        }
    }
}

?>