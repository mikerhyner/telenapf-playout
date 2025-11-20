<html>
<body>
<title>Playout Tele Napf / Tele Zentralschweiz</title>
<link rel='stylesheet' type='text/css' href='style.css'>
</head>

<H1>Streaming Dienst neu starten</H1>
Um den Streaming-Dienst (VLC) neu zu starten, weil der Stream nicht mehr funktioniert oder das VLC-Web-GUI nicht mehr reagiert, untenstehenden Knopf dr&uuml;cken und Abfrage best&auml;tigen.
<br><br>
<b>Achtung</b>: L&auml;dt evtl. alten Inhalt, wenn die Playlist nicht angepasst wurde -> Mittels <a href="https://telenapf.medianet.ch/vlc/">VLC-Web GUI</a> aktuellen Inhalt ausw&auml;hlen!
<br><br>
<form method="post" action="restart_vlc.php">
    <input type="submit" name="submit" value="Restart VLC" onclick="return confirm('VLC neu starten?')" />
</form>
<?php
  if ($_POST['submit']) {
	exec ('sudo /etc/init.d/vlc-telenapf stop');
	sleep (5);
	exec ('sudo /etc/init.d/vlc-telenapf start');
	echo "VLC wurde neu gestartet!<br><br>";
  }
echo "<a href='/index.php'>Zur&uuml;ck</a>";
?>
