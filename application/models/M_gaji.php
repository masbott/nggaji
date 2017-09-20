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

	function tunjangan_karyawan( $karyawan ) {
		return $this->db->query("SELECT a.* , b.*
			                     FROM d_karyawan_tunjangan a 
			                     INNER JOIN m_tunjangan b ON a.id_tunjangan = b.id_tunjangan 
			                     WHERE a.id_karyawan=$karyawan ");
	}

	function potongan_karyawan( $karyawan ) {
		return $this->db->query("SELECT a.* , b.*
			                     FROM d_karyawan_potongan a 
			                     INNER JOIN m_potongan b ON a.id_potongan = b.id_potongan
			                     WHERE a.id_karyawan=$karyawan ");
	}

}