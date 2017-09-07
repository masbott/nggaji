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
		$this->data['get_data'] = $this->db->get( 'm_karyawan' );
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
}