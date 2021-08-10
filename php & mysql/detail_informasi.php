<?php


define('HOST', 'localhost');
define('USER', 'u5038943_dkm');
define('PASS', '');
define('DB', 'u5038943_zakat');

$conn = new mysqli('localhost', 'project', 'Jazman99', 'u5038943_zakat');

$uriSegments = explode("/", parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH));
$id = $uriSegments[4];
$sql = "SELECT * FROM informasi WHERE id = '$id' ";
$result = mysqli_query($conn, $sql);

$array = array();
if (mysqli_num_rows($result) > 0) {
    
    while($row = mysqli_fetch_array($result)) {
        $data = array(
            'id' => intval($row['id']),
            'judul' => $row['judul'],
            'deskripsi' => $row['deskripsi']
        );
        echo json_encode($data);
    }
}


?>