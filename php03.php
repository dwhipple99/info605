<h1>Listing Tables in the database</h1>
<p>
<?php
$mysqli = new MySQLi('localhost', 'root', '9VscstwVczNo', 'info605');
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}
else {
	echo "Connected Succesfully\n";
    $result = $mysqli->query("SHOW TABLES");
    while ( $row = $result->fetch_row() ){
    $table = $row[0];
 echo '<h3>',$table,'</h3>';
$result1 = $mysqli->query("SELECT * FROM $table");
if($result1) {
    echo '<table cellpadding="0" cellspacing="0" class="db-table">';
    $column = $mysqli->query("SHOW COLUMNS FROM $table");
echo '<tr>';
    while($row3 = $column->fetch_row() ) {
    echo '<th>'.$row3[0].'</th>';
}
echo '</tr>';
    while($row2 = $result1->fetch_row() ) {
      echo '<tr>';
      foreach($row2 as $key=>$value) {
        echo '<td>',$value,'</td>';
      }
      echo '</tr>';
    }
    echo '</table><br />';
  }
  }
$mysqli->close();
}
// echo $mysqli->host_info . "\n";
// mysqli
?>
</p>
