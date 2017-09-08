<?php 


/**
* 
*/
class M_master_data extends CI_Model
{
	
	function __construct()
	{
		parent::__construct();
	}

	function get_nilai_kriteria( $id_kriteria ) {
		return $this->db->query("SELECT a.* , b.*
			                     FROM m_nilai_kriteria a 
			                     INNER JOIN m_kriteria b ON a.id_kriteria = b.id_kriteria 
			                     WHERE a.id_kriteria = $id_kriteria ");
	}
}