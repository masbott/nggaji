<?php 

/**
* 
*/
class Master_data extends CI_Controller
{
	
	function __construct()
	{
		parent::__construct();
	}

	function  karyawan( $param = '' , $key = null ) {
		$this->load->model('m_master_data' , 'master_data' );
		//tambah data karyawan
		if ( $this->input->post('submit') ) {
			$karyawan = array( 
								 'NIK' 				=> $this->input->post('nik'), 
								 'nama_karyawan' 	=> $this->input->post('nama_karyawan'),
								 'jenis_kelamin'	=> $this->input->post('jenis_kelamin'),
								 'no_telepon'		=> $this->input->post('nomor_telepon'),
								 'alamat'			=> $this->input->post('alamat'),
								 'id_jabatan'		=> $this->input->post('jabatan')
							 );
			$this->db->insert( 'm_karyawan', $karyawan );
			$this->session->set_flashdata( 'success', 'Berhasil menginputkan data.');
			redirect( 'master_data/karyawan' );
		}
		//hapus data karyawan
		if ( $param == 'delete' ) {
			$this->db->where( 'id_karyawan', $key)->delete( 'm_karyawan' );
			$this->session->set_flashdata( 'success', 'Berhasil menghapus data.');
			redirect( 'master_data/karyawan' );
		}

		//edit data karyawan
		if ( $this->input->post('submit_edit') ) {
			$update = array( 
								 'NIK' 				=> $this->input->post('nik'), 
								 'nama_karyawan' 	=> $this->input->post('nama_karyawan'),
								 'jenis_kelamin'	=> $this->input->post('jenis_kelamin'),
								 'no_telepon'		=> $this->input->post('nomor_telepon'),
								 'alamat'			=> $this->input->post('alamat'),
								 'id_jabatan'		=> $this->input->post('jabatan')
							 );

			$this->db->where( 'id_karyawan', $this->input->post('id_karyawan'))->update( 'm_karyawan' , $update );
			$this->session->set_flashdata( 'success', 'Berhasil menyimpan data.');
			redirect( 'master_data/karyawan' );
		}

		$this->data['jabatan'] = $this->db->get( 'm_jabatan' );
		$this->data['get_data'] = $this->master_data->get_karyawan();
		$this->data['sub'] = [ 'title' => ucwords( strtolower( str_replace('_', ' ', __CLASS__) ) ) , 'sub_title' => ucwords( strtolower( __FUNCTION__ ) ) ];
		$this->data['content'] = 'master_data/karyawan';
		$this->load->view( 'layout/main' , $this->data );
	}

	function edit_karyawan() {
		$return = array();
		if ( $this->input->post() ) {
			$id = $this->input->post('id');

			$getone_karayawan = $this->db->get_where( 'm_karyawan' , array( 'id_karyawan' => $id ) );

			$return = array(
								'id_karyawan' 	=> $getone_karayawan->row()->id_karyawan,
								'NIK' 			=> $getone_karayawan->row()->NIK,
								'nama_karyawan' => $getone_karayawan->row()->nama_karyawan,
								'jenis_kelamin'	=> $getone_karayawan->row()->jenis_kelamin,
								'jabatan'		=> $getone_karayawan->row()->id_jabatan,
								'no_telepon'	=> $getone_karayawan->row()->no_telepon,
								'alamat'		=> $getone_karayawan->row()->alamat
							);
		}

		header("Content-type:application/json");
		echo json_encode($return);
	}

	function jabatan( $param = '' , $key = null ) {
		//tambah data jabatan
		if ( $this->input->post('submit') ) {
			$insert = array(
							'nama_jabatan' => $this->input->post('nama_jabatan'),
							'gaji_pokok'   => $this->input->post('gaji_pokok')
							);
			$this->db->insert( 'm_jabatan', $insert );
			$this->session->set_flashdata( 'success', 'Berhasil menginputkan data.');
			redirect( 'master_data/jabatan' );
		}

		//hapus data jabatan
		if ( $param == 'delete' ) {
			$this->db->where( 'id_jabatan', $key)->delete( 'm_jabatan' );	
			$this->session->set_flashdata( 'success', 'Berhasil menghapus data.');
			redirect( 'master_data/jabatan' );
		}

		//edit data jabatan
		if ( $this->input->post('submit_edit') ) {
			$edit = array(
							'nama_jabatan' => $this->input->post('nama_jabatan'),
							'gaji_pokok'   => $this->input->post('gaji_pokok')
						);
			$this->db->where( 'id_jabatan', $this->input->post('id_jabatan'))->update( 'm_jabatan' , $edit );
			$this->session->set_flashdata( 'success', 'Berhasil menyimpan data.');
			redirect( 'master_data/jabatan' );
		}

		//tampil data jabatan
		$this->data['jabatan'] = $this->db->get( 'm_jabatan' );
		$this->data['sub'] = [ 'title' => ucwords( strtolower( str_replace('_', ' ', __CLASS__) ) ) , 'sub_title' => ucwords( strtolower( __FUNCTION__ ) ) ];
		$this->data['content'] = 'master_data/jabatan';
		$this->load->view( 'layout/main', $this->data );
	}

	function edit_jabatan() {
		$return = array();
		
		if ( $this->input->post() ) {
			$id = $this->input->post('id');
			$getone_jabatan = $this->db->get_where( 'm_jabatan' , array( 'id_jabatan' => $id ) );
			$return = array( 'id_jabatan' => $getone_jabatan->row()->id_jabatan , 'nama_jabatan' => $getone_jabatan->row()->nama_jabatan , 'gaji_pokok' => $getone_jabatan->row()->gaji_pokok );
		}
		header("Content-type:application/json");
		echo json_encode($return);
	}

	function kriteria( $param = '' , $key = null ) {
		//tambah data kriteria
		if ( $this->input->post('submit') ) {
			$insert = array(
								'nama_kriteria' => $this->input->post('nama_kriteria')
							);
			$this->db->insert( 'm_kriteria', $insert );
			$this->session->set_flashdata( 'success', 'Berhasil menginputkan data.');
			redirect( 'master_data/kriteria' );
		}
		//hapus data kriteria
		if ( $param == 'delete' ) {
			$this->db->where( 'id_kriteria', $key )->delete( 'm_kriteria' );
			$this->session->set_flashdata( 'success', 'Berhasil menghapus data.');
			redirect( 'master_data/kriteria' );
		}

		//edit data kriteria
		if ( $this->input->post('submit_edit') ) {
			$edit = array( 'nama_kriteria' => $this->input->post('nama_kriteria') );
			$this->db->where( 'id_kriteria', $this->input->post('id_kriteria'))->update( 'm_kriteria' , $edit );
			$this->session->set_flashdata( 'success', 'Berhasil menyimpan data.');
			redirect( 'master_data/kriteria' );
		}
		//tampil data kriteria
		$this->data['kriteria'] = $this->db->get( 'm_kriteria' );
		$this->data['sub'] = [ 'title' => ucwords( strtolower( str_replace('_', ' ', __CLASS__) ) ) , 'sub_title' => ucwords( strtolower( __FUNCTION__ ) ) ];
		$this->data['content'] = 'master_data/kriteria';
		$this->load->view( 'layout/main', $this->data );
	}

	function getone_kriteria() {
		$return = array();
		if ( $this->input->post() ) {
			$id = $this->input->post('id');
			
			$getone_kriteria = $this->db->get_where( 'm_kriteria' , array('id_kriteria' => $id ) );
			$return = array( 'id_kriteria' => $getone_kriteria->row()->id_kriteria , 'nama_kriteria' => $getone_kriteria->row()->nama_kriteria );
		}
		header("Content-type:application/json");
		echo json_encode($return);
	}

	function nilai_kriteria( $param = '' , $key = null ) {
		if ( $this->input->post('submit') ) {
			$insert = array(
								'id_kriteria' => $this->input->post('kriteria'),
								'nama_nilai_kriteria' => $this->input->post('nama_sub_kriteria'),
								'nilai_kriteria' => $this->input->post('nilai')
							);
			$this->db->insert( 'm_nilai_kriteria', $insert );
			$this->session->set_flashdata( 'success', 'Berhasil menyimpan data.');
			redirect( 'master_data/nilai_kriteria' );
		}

		//hapus data nilai kriteria
		if ( $param == 'delete' ) {
			$this->db->where('id_nilai_kriteria', $key)->delete( 'm_nilai_kriteria' );
			$this->session->set_flashdata( 'success', 'Berhasil menghapus data.');
			redirect( 'master_data/nilai_kriteria' );
		}
		$this->load->model( 'm_master_data' , 'master_data' );
		$this->data['kriteria'] = $this->db->get( 'm_kriteria' );
		$this->data['sub'] = [ 'title' => ucwords( strtolower( str_replace('_', ' ', __CLASS__) ) ) , 'sub_title' => ucwords( str_replace('_', ' ',  strtolower( __FUNCTION__ ) )  ) ];
		$this->data['content'] = 'master_data/nilai_kriteria';
		$this->load->view( 'layout/main', $this->data );	
	}
}