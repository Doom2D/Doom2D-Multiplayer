<?
	include('config.php');

	$ip = $_SERVER['REMOTE_ADDR'];

	$query = mysql_query("SELECT ip FROM games WHERE ip = '$ip'"); 
	$found=mysql_num_rows($query);

	if($found > 0) {
		mysql_query("UPDATE games set name = '$_GET[name]', player = '$_GET[player]', last_update = NOW() WHERE ip = '$ip'") or die(mysql_error());
	}
	else {
		mysql_query("INSERT INTO games (ip, name, player, last_update) VALUES('$ip', '$_GET[name]', '$_GET[player]', NOW()) ") or die(mysql_error());
	}

	mysql_close();
?>