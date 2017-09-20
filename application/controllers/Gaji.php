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
		$this->load->model( 'm_gaji' , 'gaji' );
		//ambil data karyawan, tabel m_karyawan
		$this->data['karyawan'] = $this->db->get( 'm_karyawan' );
		//ambil data tunjangan dari tabel m_tunjangan
		$this->data['d_tunjangan'] = $this->db->get( 'm_tunjangan' );
		//ambil data potongan dari tabel m_potongan
		$this->data['d_potongan'] = $this->db->get( 'm_potongan' );
		//menghitung gaji
		if ( $this->input->post('hitung_bonus') ) {
			$this->data['kar_jab'] = $this->db->get_where( 'm_karyawan' , array('id_karyawan' => $this->input->post('karyawan')) );
			$tunjangan = $this->input->post('tunjangan');
			$potongan  = $this->input->post('potongan');
			$karyawan = $this->input->post('karyawan');
			
			$tahun = substr($this->input->post('bulan'), 0, 4 );
			$bulan = substr( str_replace( '-', '', $this->input->post('bulan')) , 4 , 2 );
			$gabungan = $bulan .'-' .$tahun;
			$this->data['get_bonus'] = $this->gaji->get_bonus( $karyawan,$tahun , $bulan );
			
			$tahun = substr($this->input->post('bulan'), 0, 4 );
			$bulan = substr($this->input->post('bulan'), 5 , 2 );

			$cek_tunjangan = $this->gaji->cek_ketersediaan_tunjangan( $tahun , $bulan , $karyawan );
			$cek_potongan = $this->gaji->cek_ketersediaan_potongan( $tahun , $bulan , $karyawan );
			
			$this->data['get_tunjangan_karyawan'] = $this->gaji->tunjangan_karyawan( $karyawan );
			$this->data['get_potongan_karyawan'] = $this->gaji->potongan_karyawan( $karyawan );
			$this->data['cek_tunjangan'] = $cek_tunjangan;
			$this->data['getone_jabatan'] = $this->db->get_where( 'm_jabatan' , array( 'id_jabatan' => $this->data['kar_jab']->row()->id_jabatan ) );
		}
		
		$this->data['sub'] = ['title' => __CLASS__ , 'sub_title' => ' Hitung' .' '.  __CLASS__ ];
		$this->data['content'] = 'gaji/index';
		$this->load->view( 'layout/main', $this->data );
	}

	function get_tunjangan() {
		$return = array();
		if ( $this->input->post() ) {
			$id_tunjangan = $this->input->post('id_tunjangan');
			$getone_tunjangan = $this->db->get_where( 'm_tunjangan' , array('id_tunjangan' => $id_tunjangan ) );
			$return = array('nilai_tunjangan' => 'Rp. ' . number_format( $getone_tunjangan->row()->nilai_tunjangan , 2 , ',' , '.' ) );
		}
		header("Content-type:application/json");
		echo json_encode($return);
	}

	function daftar() {
		$tunjangan = $this->db->get( 'd_tunjangan' );
		$potongan  = $this->db->get( 'd_potongan' );

		$this->data['sub'] = ['title' => __CLASS__ , 'sub_title' => ucwords( strtolower( __FUNCTION__ ) ) . ' '.  __CLASS__ ];
		$this->data['content'] = 'gaji/daftar';
		$this->load->view( 'layout/main', $this->data );
	}
}