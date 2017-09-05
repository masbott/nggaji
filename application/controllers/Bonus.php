<?php 


/**
* 
*/
class Bonus extends CI_Controller
{
	
	function __construct()
	{
		parent::__construct();
	}

	function index() {
		$this->load->model( 'm_bonus' , 'bonus' );
		$this->data['karyawan'] = $this->db->get( 'm_karyawan' );
		$get_kriteria = $this->bonus->get_kriteria();
		$kriteria = array();
		foreach ( $get_kriteria->result() as $key => $k ) {
			$kriteria[$k->id_kriteria]['id_kriteria'] = $k->id_kriteria;
			$kriteria[$k->id_kriteria]['kriteria'] = $k->nama_kriteria;
		}

		$get_kriteria = $this->db->get('m_kriteria');

		if ( $this->input->post('hitung') ) {
			//echo '<pre>'; print_r($this->input->post());exit();
			$id_karyawan = $this->input->post('karyawan');
			$tahun = substr($this->input->post('bulan'), 0, 4 );
			$bulan = substr($this->input->post('bulan'), 5 , 2 );

			$jumlah = array();
			$kriteria_nilai = 0;
			$post_nilai = $this->input->post('nilai_');
			$i = 1;
			while ( isset( $_POST['nilai_'.$i] ) ) {
				$jumlah[]  = $_POST['nilai_'.$i];
				$i++;
			}
			//hitung nilai kriteria
			$kriteria_nilai = array_sum( $jumlah ) / $get_kriteria->num_rows();

			$d_persentase = $this->db->get( 'm_persentase' );

			if ( $kriteria_nilai > 80 ) {
				$persen = 20;
				$id_persentase = 1;
			} elseif ( $kriteria_nilai > 60 && $kriteria_nilai <= 80 ) {
				$persen = 16;
				$id_persentase = 2;
			} elseif ( $kriteria_nilai > 40 && $kriteria_nilai <= 60 ) {
				$persen = 12;
				$id_persentase = 3;
			} elseif ( $kriteria_nilai > 20 && $kriteria_nilai <= 40 ) {
				$persen = 8;
				$id_persentas = 1;
			} else {
				$persen = 4;
				$id_persentase = 5;
			}
			//hitung nilai bonus 
			$bonus_nilai = ( $persen * 1737600 ) / 100;

			//
			$cek_d_bonus = $this->bonus->cek_ketersediaan( $tahun , $bulan , $id_karyawan );
			
			if ( $cek_d_bonus->num_rows() > 0  ) {
				//sudah tersedia
				$this->session->set_flashdata( 'success', 'Data sudah tersedia.');
			} else {
				//belum tersedia
				$inserted = array(
									'id_karyawan' => $this->input->post('karyawan'),
									'id_persentase' => $id_persentase,
									'bulan' => $this->input->post('bulan'),
									'jumlah' => $bonus_nilai
									);
				$this->db->insert( 'd_bonus' , $inserted );
				$this->session->set_flashdata( 'success', 'Berhasil menghitung bonus. Untuk meihat hasil, silahkan tarik ke bagian bawah.');
			}
			//hasil hitung bonus
			$this->data['getone_karyawan'] = $this->db->get_where( 'm_karyawan' , array( 'id_karyawan' => $this->input->post('karyawan') ) )->row();
			$this->data['jumlah_data'] = $cek_d_bonus;
			$this->data['n_kriteria'] = array_sum($jumlah);
			$this->data['n_persentase'] = $persen;
			$this->data['hasil_bonus'] = $bonus_nilai;
		}
		
		
		$this->data['kriteria'] = $kriteria;
		$this->data['content'] = 'bonus/index';
		$this->load->view( 'layout/main' , $this->data );
	}

	function daftar() {
		$this->load->model( 'm_bonus' , 'bonus' );
		$this->data['daftar'] = $this->bonus->daftar_bonus();
		$this->data['content'] = 'bonus/daftar';
		$this->load->view( 'layout/main', $this->data );
	}
}