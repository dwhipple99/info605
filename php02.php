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
	$rowNum=0;
    while ( $row = $result->fetch_row() ){
       $table = $row[0];
       echo '<h3>Table #', $rowNum,' is ',$table,'</h3>';
	   $rowNum=$rowNum+1;
	}
}
// echo $mysqli->host_info . "\n";
// mysqli
?>
</p>
