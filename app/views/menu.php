<body class="flex menu-body">
    <!-- Header-->
    <?php $this->view("partials/header"); ?>

    <!-- Body -->



    <div class="header">
        <h1><?= $data['results'][0]->menuName ?></h1>
    </div>


    <?php
    foreach ($data['results'] as $item) {
        echo " <div class='menuitem'> <div> $item->itemName </div> <br> <small>$item->ingredients </small> </div> ";
    }
    ?>



</body>