<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="css/table.css">

    <title>Point Table</title>
</head>
<body>
<a href="http://localhost" class="back">back</button></a>
<h1><center>Dungeon Point Info</center></h1>


<div class="main">
<?php
require_once "./Connect/MssqlConnect.php";
$db = new MssqlConnect();
$result = $db->fetch_all("select DungeonName, Wpoint from Server01.dbo.Dungeonrewards");

echo "<table>";
echo "<tr>";
echo "<th>DungeonName</th>";
echo "<th>WorldPoint</th>";
echo "</tr>";

foreach ($result as $row) {
    echo "<tr>";
    echo "<td>" . $row['DungeonName'] . "</td>";
    echo "<td>" . $row['Wpoint'] . "</td>";
    echo "</tr>";
}

echo "</table>";
?>
</body>
</html>
