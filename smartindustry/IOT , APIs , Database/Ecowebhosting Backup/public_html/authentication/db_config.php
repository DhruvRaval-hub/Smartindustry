<?php

$servername = "sdb-d.hosting.stackcp.net";

$username = "smart_industry-31373343df";

$password = "Ike_2qNxa#Is";

$dbname = "smart_industry-31373343df";

$conn = new mysqli($servername, $username, $password, $dbname);

if (!$conn){

	die("Connection Failed: ". mysqli_connect_error());

}//else{
 //   echo"connected...";
//}

?>

