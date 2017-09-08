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
			$bulan = substr($this->input->post('bulan'), 5 , 2 );

			$cek_tunjangan = $this->gaji->cek_ketersediaan_tunjangan( $tahun , $bulan , $karyawan );
			$cek_potongan = $this->gaji->cek_ketersediaan_potongan( $tahun , $bulan , $karyawan );
			if ( $cek_tunjangan->num_rows() > 0 ) {
				// $this->session->set_flashdata( 'failed', 'Data sudah tersedia.');
				// redirect('gaji');
			} else {
				foreach ( $tunjangan as $t ) {
					$tj = array( 
									'bulan' => date('Y-m-d') , 
									'id_tunjangan' => $t , 
									'id_potongan' => '0',
									'id_karyawan' => $karyawan  );
					$this->db->insert( 'd_gaji', $tj );
				}	
			}

			if ( $cek_potongan->num_rows() > 0 ) {
					
			} else {
				foreach ( $potongan as $p ) {
					$pt = array( 
								'bulan' => date('Y-m-d') , 
								'id_karyawan' => $karyawan , 
								'id_potongan' => $p,
								'id_tunjangan' => '0' );
					$this->db->insert( 'd_gaji', $pt );
				}
				$this->session->set_flashdata( 'success', 'Berhasil menyimpan data.');
				//redirect('gaji');
			}
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

		foreach ( $tunjangan->result() as $t) {
			$tun[$t->id_karyawan]['karyawan'] = $t->id_karyawan;
			$tun[$t->id_karyawan]['jml'] += $t->id_tunjangan;
		}
		print_r($tun);exit();
		$this->data['sub'] = ['title' => __CLASS__ , 'sub_title' => ucwords( strtolower( __FUNCTION__ ) ) . ' '.  __CLASS__ ];
		$this->data['content'] = 'gaji/daftar';
		$this->load->view( 'layout/main', $this->data );
	}
}