<?
	include('config.php');

	$ip = $_SERVER['REMOTE_ADDR'];

	$query = mysql_query("DELETE FROM games WHERE ip = '$ip'"); 

	mysql_close();
?>