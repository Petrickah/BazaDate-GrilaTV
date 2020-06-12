<?php
    $host='mysql';
    $user='root';
    $pass='toor';
    $connected = true;
    set_error_handler(function($errno, $errstr){
        throw new ErrorException($errstr, 0, $errno);
    });
    try {
        $conn = mysqli_connect($host, $user, $pass, 'grilatv');
    } catch(Exception $e) {
        $connected = false;
        $message = $e->getMessage();
        print("<i style=\"font-size:16pt;\">Connection failed: $message</i>");
    }
    restore_error_handler();
    if($connected) $conn->query("SET autocommit=0;");
?>