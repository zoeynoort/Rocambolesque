<?php

class Menu extends Controller
{
    private $MenuModel;

    public function __construct()
    {
        $this->MenuModel = $this->Model('MenuModel');
    }

    public function index()
    {
        $results = $this->MenuModel->ReadMenu();
        $data = [
            'results' => $results
        ];
        $this->view("Menu", $data);
    }
}
