<?php
$host = "192.168.56.23"; 
$port = "5432";
$dbname = "juegosdb";
$user = "vagrant";
$password = "vagrant";

$conn = pg_connect("host=$host port=$port dbname=$dbname user=$user password=$password");

if (!$conn) {
    die("Error al conectar a la base de datos.");
}

$result = pg_query($conn, "SELECT * FROM juegos;");
if (!$result) {
    die("Error en la consulta: " . pg_last_error());
}

echo "<h1>Wishlist de Juan David Lasso</h1>";
echo "<table border='1'>
<tr><th>ID</th><th>Nombre</th><th>Precio</th></tr>";

while ($row = pg_fetch_assoc($result)) {
    echo "<tr><td>{$row['id']}</td><td>{$row['nombre']}</td><td>{$row['precio']}</td></tr>";
}

echo "</table>";

pg_close($conn);
?>