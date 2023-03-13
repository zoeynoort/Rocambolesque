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

        public function deleteUser($id)
        {
            $this->db->query("CALL spUserDelete(:id);");

            $this->db->bind(":id", $id);
            
            $this->db->execute();
        }

        public function createUser($data) 
        {
            $this->db->query("CALL spUserAdd(:firstname, :infix, :lastname, :dateOfBirth, :username, :password);");

            $this->db->bind(":firstname", $data["firstname"]);
            $this->db->bind(":infix", $data["infix"]);
            $this->db->bind(":lastname", $data["lastname"]);
            $this->db->bind(":dateOfBirth", $data["dateOfBirth"]);
            $this->db->bind(":username", $data["username"]);
            $this->db->bind(":password", $data["password"]);

            $this->db->execute();
        }
    }