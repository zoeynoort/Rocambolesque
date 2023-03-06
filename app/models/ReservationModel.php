<?php

    class ReservationModel
    {
        private $db;

        public function __construct()
        {
            $this->db = new Database();
        }

        public function create($personId, $timeslot, $table, $day, $adults, $childs) {
            $this->db->query("CALL   ")
        }

        public function delete($id) {
            $this->db->query("call");
            $this->db->bind(":id", )
        }
    }