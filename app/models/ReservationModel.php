<?php

    class ReservationModel
    {
        private $db;

        public function __construct()
        {
            $this->db = new Database();
        }

        public function create($personId, $timeslot, $table, $day, $adults, $children) {
            $this->db->query("CALL spReservationAdd(:personId, :timeslot, :tableId, :day, :adults, :children);");
            
            $this->db->bind(":personId", $personId);
            $this->db->bind(":timeslot", $timeslot);
            $this->db->bind(":table", $table);
            $this->db->bind(":day", $day);
            $this->db->bind(":adults", $adults);
            $this->db->bind(":children", $children);

            $this->db->execute();

        }

        public function delete($id) {
            $this->db->query("CALL spReservationDelete(:id);");
            
            $this->db->bind(":id", $id);
            
            $this->db->execute();
        }
    }