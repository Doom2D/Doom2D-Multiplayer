<?
$username="MYSQL_USER";
$password="MYSQL_PASSWORD";
$database="MYSQL_DATABASE";

mysql_connect("MYSQL_SERVER", $username, $password);

mysql_select_db($database) or die( "Unable to select database");
?>