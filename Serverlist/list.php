<? 
	include('config.php');

	$query = "SELECT ip,name,player FROM games WHERE last_update >= NOW() - INTERVAL 100 SECOND"; 
	$result=mysql_query($query);

	if($_GET['ingame'] == '1') {
		while($row = mysql_fetch_array($result)){
			echo $row['name']."|". $row['player']."|".$row['ip'];
			echo("\n");
		}
	}
	else {
		echo('<table border="1">');
		while($row = mysql_fetch_array($result)){
			echo("<tr>");
			echo "<td>".$row['name']."</td><td>".$row['player']."</td><td>".$row['ip']."</td>";
			echo("</tr>");
		}
		echo("</table>");
	}
	
	mysql_close();
?>