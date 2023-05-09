<?php

class MenuModel
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function ReadMenu($id)
    {
        $this->db->query("CALL `spReadMenu`(:id);");
        $this->db->bind("id", $id);

        $result = $this->db->resultSet();

        return $result;
    }
}
