<?php

    class UserModel
    {
        private $db;

        public function __construct()
        {
            $this->db = new Database();
        }

        public function getUserByUsername($username) 
        {
            $this->db->query("SELECT * FROM User WHERE username = :username;");

            $this->db->bind(":username", $username);

            return $this->db->single();
        }
        
        public function getUserById($id) 
        {
            $this->db->query("SELECT * FROM User WHERE id = :id;");

            $this->db->bind(":id", $id);

            return $this->db->single();
        }

        public function createUser($data) 
        {
            $this->db->query("CALL ");

            $this->db->bind("");
        }
    }