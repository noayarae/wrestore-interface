<?php
require("db_info.php");

function parseToXML($htmlStr)
{
	$xmlStr=str_replace('<','&lt;',$htmlStr);
	$xmlStr=str_replace('>','&gt;',$xmlStr);
	$xmlStr=str_replace('"','&quot;',$xmlStr);
	$xmlStr=str_replace("'",'&#39;',$xmlStr);
	$xmlStr=str_replace("&",'&amp;',$xmlStr);
	return $xmlStr;
}

// Opens a connection to a MySQL server and Set the MySQL database

$connection = mysqli_connect (SERVER, USERNAME, PASSWORD, DATABASE, 3306)
or die("Unable to connect to server<br>\n");


// Select all the rows in the markers table

$query = ("SELECT * FROM markers WHERE 1");
//$result = mysqli_query($query);
$result = mysqli_query($connection, $query);
if (!$result) {
	die('Invalid query: ' . mysqli_error());
}

header("Content-type: text/xml");

// Start XML file, echo parent node
echo "<?xml version='1.0' ?>";
echo '<markers>';
$ind=0;
// Iterate through the rows, printing XML nodes for each
while ($row = @mysqli_fetch_assoc($result)){
	// Add to XML document node
	echo '<marker ';
	echo 'id="' . $row['id'] . '" ';
	echo 'name="' . parseToXML($row['name']) . '" ';
	echo 'address="' . parseToXML($row['address']) . '" ';
	echo 'lat="' . $row['lat'] . '" ';
	echo 'lng="' . $row['lng'] . '" ';
	echo 'type="' . $row['type'] . '" ';
	echo '/>';
	$ind = $ind + 1;
}

// End XML file
echo '</markers>';

?>

