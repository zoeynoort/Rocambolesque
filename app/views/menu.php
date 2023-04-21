<body class="flex">
    <!-- Header-->
    <?php $this->view("partials/header"); ?>

    <!-- Body -->



    WELCOME TO THE COOL MENU
    <div class="header">
        <h1>Main dish</h1>
    </div>


    <?php
    foreach ($data['results'] as $item) {
        echo " <div class='menuitem'> <div> $item->firstname </div> </div> ";
    }
    ?>



</body>