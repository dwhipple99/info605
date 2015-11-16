<h1>Testing the Web Servers Connection to the Database<h1>
<p>
<?php
$mysqli = new MySQLi('localhost', 'root', '9VscstwVczNo', 'info605');
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}
else {
	echo "Connected Succesfully to MySQL ";
	$serverVersion = $mysqli->server_info;
	echo "version ".$serverVersion."\n";
}
// echo $mysqli->host_info . "\n";
// mysqli
?>
</p>
<p>The database is MySQL, running locally on this VM
The database created is called info605 in MySQL</p>
