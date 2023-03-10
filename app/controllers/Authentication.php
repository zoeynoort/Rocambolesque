<?php
    // Start sessions
    session_start();

    class Authentication extends Controller
    {

        private $model;

        public function __construct()
        {
            $model = $this->model("UserModel");
        }
        
        public function test() {
            echo "hello testing";
        }
        public function login()
        {
            // Sanitize request
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

            // Parameters
            $username = $_POST["username"];
            $password = $_POST["password"];

            // Validations
            if(!isset($username)) return $this->view("auth/msg?e=username");
            if(!isset($password)) return $this->view("auth/msg?e=password");
            
            // Search for user

            // Authenticate

            // Set data in the session

            // Return
            return $this->view("auth/msg?e=success");
        }

        public function logout()
        {

        }
    }
?>