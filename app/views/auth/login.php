<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rocambolesque</title>
    <link rel="stylesheet" href="../public/css/style.css">
</head>

<body id="login">
    <!-- Header-->
    <?php $this->view("partials/header"); ?>

    <!-- Body -->
    <div class="frame">
        <h1>log in</h1>
        <a href="<?php URLROOT; ?>/authentication/register">no account?</a>

        <form action="<?= URLROOT; ?>/authentication/login" method="post">
            <input type="text" name="Email" value="" placeholder="Email">

            <input type="text" name="Password" value="" placeholder="Password">

            <input class="enterbtn" type="submit" name="submit" value="Enter">
        </form>

    </div>

    <!-- Footer -->
    <?php $this->view("partials/footer"); ?>
</body>