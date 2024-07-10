<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "jago3";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$weapon = $_GET['weapon'] ?? 'all';
$stat = $_GET['stat'] ?? 'win';

$sql = "SELECT player_name, $stat FROM battlefieldv";
if ($weapon !== 'all') {
    $sql .= " WHERE weapon_used = '$weapon'";
}

$result = $conn->query($sql);

$data = array();
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
}

$conn->close();

echo json_encode($data);
?>
