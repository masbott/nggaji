<?php 


/**
* 
*/
class Gaji extends CI_Controller
{
	
	function __construct()
	{
		parent::__construct();
	}

	function index() {
		//ambil data karyawan, tabel m_karyawan
		$this->data['karyawan'] = $this->db->get( 'm_karyawan' );
		//ambil data tunjangan dari tabel m_tunjangan
		$this->data['d_tunjangan'] = $this->db->get( 'm_tunjangan' );
		//ambil data potongan dari tabel m_potongan
		$this->data['d_potongan'] = $this->db->get( 'm_potongan' );

		if ( $this->input->post('hitung_bonus') ) {
			echo '<pre>'; print_r($this->input->post());exit();
		}
		$this->data['sub'] = ['title' => __CLASS__ , 'sub_title' => ' Hitung' .' '.  __CLASS__ ];
		$this->data['content'] = 'gaji/index';
		$this->load->view( 'layout/main', $this->data );
	}

	function daftar() {
		$this->data['sub'] = ['title' => __CLASS__ , 'sub_title' => ucwords( strtolower( __FUNCTION__ ) ) . ' '.  __CLASS__ ];
		$this->data['content'] = 'gaji/daftar';
		$this->load->view( 'layout/main', $this->data );
	}
}