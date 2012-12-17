<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');

$mysqli = new mysqli("127.0.0.1", "root", "", "ge2013", 3306);

/* check connection */
if ($mysqli->connect_errno) {
    printf("Connect failed: %s\n", $mysqli->connect_error);
    exit();
}

if (!$mysqli->set_charset('utf8')) {
    printf("Error loading character set utf8: %s<br/>", $mysqli->error);
} 
/*else {
    printf("Current character set: %s<br/>", $mysqli->character_set_name());
}*/

?>