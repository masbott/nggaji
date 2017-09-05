<?php 

/**
* 
*/
class M_bonus extends CI_model
{
	
	function __construct()
	{
		parent::__construct();
	}

	function get_kriteria() {
		return $this->db->query("SELECT a.* , b.nama_kriteria , c.nama_nilai_kriteria, c.nilai_kriteria
								 FROM m_trans_kriteria_nilai a
								 INNER JOIN m_kriteria b ON a.id_kriteria = b.id_kriteria
								 INNER JOIN m_nilai_kriteria c ON a.id_nilai_kriteria = c.id_nilai_kriteria
								 ORDER BY id_nilai_kriteria ASC
								 ");

	}

	function cek_ketersediaan( $tahun , $bulan , $id_karyawan ) {
		return $this->db->query("SELECT * FROM d_bonus WHERE YEAR(bulan) = $tahun AND MONTH(bulan) = $bulan AND id_karyawan =  $id_karyawan");
	}

	function daftar_bonus() {
		return $this->db->query("SELECT a.bulan , a.jumlah , b.NIK , b.nama_karyawan
								FROM d_bonus a 
								INNER JOIN m_karyawan b ON a.id_karyawan = b.id_karyawan ");
	}

}