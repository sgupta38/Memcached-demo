<?php

/*
 *  Read file
 */

$string_data = file_get_contents("mem_keys.txt");
$arr_data = unserialize($string_data);

echo " Time to add into the memcache: ";

/*
 * Create Memcached Instance here
 */

$mc = new Memcached();
$mc->addServer("127.0.0.1", 11211);

$items = count($arr_data);

for($i = 0; $i < $items; $i++)
{
	echo "Searching for ".$arr_data[$i]."\n";

	$val = $mc->get($arr_data[$i]);
	if($val)
	{
		echo "Success...Found in Memcached -> " .$val."\n";
	}
	else
	{
		echo "Not Found. Need to access DB. Errorcode( ".$mc->getResultCode()." ) \n";
	}
}

?>
