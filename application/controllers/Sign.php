<?php 


/**
* 
*/
class Sign extends CI_Controller
{
	
	function __construct()
	{
		# code...
		parent::__construct();
	}


	function index() {
		$this->load->view( 'sign/index' );
	}

	function proses() {
		$username = $this->input->post('username');
		$password = md5($this->input->post('password'));

		$cek = $this->db->get_where( 'd_pengguna' , array( 'username' => $username , 'password' => $password ) );

		if ( $cek->num_rows() > 0 ) {
			$session = array( 
								'username' => $cek->row()->username , 
								'level' => $cek->row()->id_kategori_pengguna, 
								'nama' => $cek->row()->nama_pengguna
							);
			$this->session->set_userdata( $session );
			$this->session->set_userdata( 'sign' , TRUE );
			redirect('beranda');
		} else {
			$this->session->set_flashdata( 'failed', 'Username atau Password salah.');
			redirect('sign');
		}
	}

	function logout(){
		$this->session->unset_userdata('id');
		$this->session->unset_userdata('sign');
		$this->session->sess_destroy();
		redirect('sign');
	}

}

