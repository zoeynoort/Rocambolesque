<?php
    /*
        This piece of code is for translating codes to messages for
    */

    $code = $_GET["e"];

    // Default message
    $message = "Onbekend bericht";

    // List of messages
    $messages = [
        "r_fail" => "Er is een fout opgetreden bij het registeren, probeer het later opnieuw.",
        "r_success" => "Het registreren is successvol gegaan!",
        "l_fail" => "Er is een fout opgetreden bij het inloggen, probeer het later opnieuw.",
        "l_success" => "Het inloggen is gelukt!"
    ];

    $message = $messages[$code];


?>