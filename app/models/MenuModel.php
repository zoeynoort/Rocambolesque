<?php

class MenuModel
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function ReadMenu()
    {
        $this->db->query("SELECT * FROM `person`");

        $result = $this->db->resultSet();

        return $result;
    }
}
