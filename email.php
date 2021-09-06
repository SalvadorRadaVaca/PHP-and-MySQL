<?php

    if(!isset($_GET["name"])) {
        die("You need introduce a name");
    }

    if(!isset($_GET["email"])) {
        die("You need introduce a email");
    }

    if(!isset($_GET["message"])) {
        die("You need introduce a message");
    }

    $name = $_GET["name"];
    $email = $_GET["email"];
    $message = $_GET["message"];

    $to      = 'radavacasalvador@gmail.com';
    $subject = 'Consult from the web';
    $body = 'New consult from the web.' . "\r\n";
    $body .= 'Name: ' . $name . "\r\n";
    $body .= 'Email: ' . $email . "\r\n";
    $body .= 'Message: ' . $message . "\r\n";
    
    $headers = 'From: ' . $email . "\r\n" .
                 'Reply-To: ' . $email . "\r\n" .
                 'X-Mailer: PHP/' . phpversion();

    mail($to, $subject, $body, $headers);

?>