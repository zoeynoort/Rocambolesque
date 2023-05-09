<?php

class Menu extends Controller
{
    private $MenuModel;

    public function __construct()
    {
        $this->MenuModel = $this->Model('MenuModel');
    }

    public function index($id)
    {
        $results = $this->MenuModel->ReadMenu($id);
        $data = [
            'results' => $results
        ];
        $this->view("Menu", $data);
    }
}
