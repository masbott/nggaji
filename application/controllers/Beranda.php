<?php 


/**
* 
*/
class Beranda extends CI_Controller
{
	function __construct()
	{
		parent::__construct();
	}

	function index() {
		//testing masbott
		$this->data['sub'] = ['title' => __CLASS__ , 'sub_title' => 'Dashboard Nggaji'];
		$this->load->view( 'layout/main' , $this->data );
	}
}