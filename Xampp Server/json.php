<?php
    $link = mysql_pconnect("localhost", "root", "") or die("Could not connect");
    mysql_select_db("Nagam") or die("Could not select database");
    
    $arr = array();
    
    $rs = mysql_query("SELECT * FROM data");
    
    while($obj = mysql_fetch_object($rs)) {
        $arr[] = $obj;
    }
    echo '{"members":'.json_encode($arr).'}';
    ?>
