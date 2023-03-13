<?php

class User extends Controller
{
    public function __construct()
    {
        
    }

    public function index()
    {
        $this->view("index");
    }

    public function create()
    {
        $this->view("create");
    }

    public function edit()
    {
        $this->view("edit");
    }

    public function delete()
    {
        $this->view("delete");
    }

    public function store()
    {
        $this->view("store");
    }

    public function update()
    {
        $this->view("update");
    }
}