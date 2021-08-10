<?php


define('HOST', 'localhost');
define('USER', 'u5038943_dkm');
define('PASS', '');
define('DB', 'u5038943_zakat');

$conn = new mysqli('localhost', 'u5038943_dkm', 'Jazman99', 'u5038943_zakat');

$sql = "SELECT * FROM informasi";
$result = mysqli_query($conn, $sql);

$array = array();
if (mysqli_num_rows($result) > 0) {
    
    while($row = mysqli_fetch_array($result)) {
        $data = array(
            'id' => intval($row['id']),
            'judul' => $row['judul'],
            'deskripsi' => $row['deskripsi']
        );
        array_push($array, $data);
    }
}

echo json_encode($array);

?>