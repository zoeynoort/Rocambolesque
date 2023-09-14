<?php

class Reservation extends Controller
{
	private $ReservationModel;

	public function __construct()
	{
		$this->ReservationModel = $this->Model('ReservationModel');
	}

	public function index()
	{
		// $results = $this->ReservationModel->ReadMenu();
		$data = [
			// 'results' => $results
		];
		$this->view("Reservation", $data);
	}
}
