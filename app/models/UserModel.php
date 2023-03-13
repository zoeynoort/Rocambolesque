<?php

    class UserModel
    {
        private $db;

        public function __construct()
        {
            $this->db = new Database();
        }

        public function create($name, $email, $password) {
            $this->db->query("CALL spUserAdd(:name, :email, :password);");
            
            $this->db->bind(":name", $name);
            $this->db->bind(":email", $email);
            $this->db->bind(":password", $password);

            $this->db->execute();

        }

        public function delete($id) {
            $this->db->query("CALL spUserDelete(:id);");
            
            $this->db->bind(":id", $id);
            
            $this->db->execute();
        
        }

        public function update($id, $name, $email, $password) {
            $this->db->query("CALL spUserUpdate(:id, :name, :email, :password);");
            
            $this->db->bind(":id", $id);
            $this->db->bind(":name", $name);
            $this->db->bind(":email", $email);
            $this->db->bind(":password", $password);

            $this->db->execute();
        
        }
    }