<?php
session_start();

$servername = "localhost";
$username = "root"; 
$password = ""; 
$dbname = "baza"; 

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $stmt = $conn->prepare("SELECT id, password, is_admin FROM korisnik WHERE username = ?");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $stmt->bind_result($id, $hashed_password, $is_admin);
    $stmt->fetch();

    if (password_verify($password, $hashed_password)) {
        $_SESSION['username'] = $username;
        $_SESSION['is_admin'] = $is_admin;
        header("Location: administrator.php");
    } else {
        echo "Invalid username or password.";
    }

    $stmt->close();
}

$conn->close();
?>
