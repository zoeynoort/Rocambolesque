<body id="login">
    <!-- Header-->
    <?php $this->view("partials/header"); ?>

    <!-- Body -->

    <div class="frame">
        <h1>Sign up</h1>
        <a href="<?php URLROOT; ?>/login">already have an account?</a>
        <form action="<?= URLROOT ?>/main/index" method="post">
            <input type="text" name="" id="" placeholder="username">
            <input type="text" name="" id="" placeholder="email">
            <input type="password" name="" id="" placeholder="password">
            <br>
            <button type="submit">Send</button>
        </form>
    </div>





</body>