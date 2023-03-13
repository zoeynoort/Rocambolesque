<?php
    /*
        This piece of code is for translating codes to messages for
    */

    $code = $data;

    // List of messages
    $messages = [
        "r_fail" => "Er is een fout opgetreden bij het registeren, probeer het later opnieuw.",
        "r_success" => "Het registreren is successvol gegaan!",
        "l_fail" => "Er is een fout opgetreden bij het inloggen, probeer het later opnieuw.",
        "l_success" => "Het inloggen is gelukt!"
    ];

    // Decide which message to show based on the code
    $message = (isset($code) && in_array($code, $messages, true)) ? "Onbekend" :  $messages[$code];
    var_dump($message);
?>