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
            $this->view("auth/msg", "l_success");
        }

        /*
            authentication/login
            - username: string
            - password: string
        */
        public function login()
        {
            if($_SERVER["REQUEST_METHOD"] == "POST")
            {
                // Sanitize request
                $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

                // Parameters
                $username = $_POST["username"];
                $password = $_POST["password"];

                // Validations
                if(!isset($username)) return $this->view("auth/msg", "l_username");
                if(!isset($password)) return $this->view("auth/msg", "l_password");
                
                // Get user
                $user = $this->model->getUserByUsername($username);

                // Verify the hash with the given password, if it fails, show a message
                if(!password_verify($password, $user->password)) return $this->view("auth/msg", "l_fail");

                // Set data in the session, we set the id so we can always find the user through our application.
                $_SESSION["user"] = 0;

                // Return to page
                return $this->view("auth/msg", "l_success");
            } 
                else
            {
                // Show page
                return $this->view("auth/login");
            }
            
        }

        /*
            authentication/logout
        */
        public function logout()
        {
            // Remove everything from the session regarding authentication
            session_unset("user");

            // Return to page
            return $this->view("auth/msg?e=logout");
        }

        /*
            authentication/register 
            - firstname: string
            - infix: string nullable
            - lastname: string
            - dateOfBirth: date
            - username: string
            - password: string
        */
        public function register()
        {
            if($_SERVER["REQUEST_METHOD"] == "POST")
            {
                // Sanitize request
                $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

                // Parameters
                $firstname = $_POST["firstname"];
                $infix = $_POST["infix"];
                $lastname = $_POST["lastname"];
                $dateOfBirth = $_POST["dateOfBirth"];
                $username = $_POST["username"];
                $password = $_POST["password"];

                // Validations
                if(!isset($firstname)) return $this->view("auth/msg", "r_firstname");
                // if(!isset($infix)) return $this->view("auth/msg", "r_infix");
                if(!isset($lastname)) return $this->view("auth/msg", "r_lastname");
                if(!isset($dateOfBirth)) return $this->view("auth/msg", "r_dateofbirth");
                if(!isset($username)) return $this->view("auth/msg", "r_username");
                if(!isset($password)) return $this->view("auth/msg", "r_password");
                // TODO: more validations for specific fields

                // Hash password
                $hashedPassword = password_hash($password, PASSWORD_BCRYPT);

                // Create data object with all the parameters
                $data = [
                    "firstname" => $firstname,
                    "infix" => $infix,
                    "lastname" => $lastname,
                    "dateOfBirth" => $dateOfBirth,
                    "username" => $username,
                    "password" => $hashedPassword
                ];

                // Create person and user, if it fails we return to a error
                try {
                    $this->model->createUser($data);
                } 
                    catch(Exception $e) 
                {
                    $this->view("auth/msg", "r_fail");
                }

                // Return to page
                return $this->view("auth/msg", "r_success");
            }
                else
            {
                // Show page
                return $this->view("auth/register");
            }
            
        }
    }
?>