<?php 


/**
* 
*/
class M_gaji extends CI_Model
{
	
	function __construct()
	{
		parent::__construct();
	}

	function cek_ketersediaan_tunjangan( $tahun , $bulan , $id_karyawan ) {
		return $this->db->query("SELECT * FROM d_gaji WHERE YEAR(bulan) = $tahun AND MONTH(bulan) = $bulan AND id_karyawan=$id_karyawan");
	}

	function cek_ketersediaan_potongan( $tahun , $bulan , $id_karyawan ) {
		return $this->db->query("SELECT * FROM d_gaji WHERE YEAR(bulan) = $tahun AND MONTH(bulan) = $bulan AND id_karyawan=$id_karyawan");
	}

	function karyawan_jabatan( $id_karyawan ) {
		return $this->db->query("SELECT a.NIK , a.nama_karyawan, a.no_telepon , a.alamat , b.nama_jabatan
			                     FROM m_karyawan a 
			                     INNER JOIN m_jabatan b ON a.id_jabatan = b.id_jabatan 
			                     WHERE a.id_karyawan=$id_karyawan ");
	}

}