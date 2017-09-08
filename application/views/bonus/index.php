<div class="col-lg-12">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>Hitung Bonus</h5>
            <div class="ibox-tools">
                <a class="collapse-link">
                    <i class="fa fa-chevron-up"></i>
                </a>
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-wrench"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#">Config option 1</a>
                    </li>
                    <li><a href="#">Config option 2</a>
                    </li>
                </ul>
                <a class="close-link">
                    <i class="fa fa-times"></i>
                </a>
            </div>
        </div>
        <div class="ibox-content">
            <form class="form-horizontal" method="POST" action="" id="form_bonus">
              <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label pull-left">Karyawan</label>
                <div class="col-sm-10">
                  <select name="karyawan" id="" class="form-control" required="">
                    <option value="">-- Pilih Karyawan -- </option>
                    <?php if( $karyawan->num_rows() > 0 ): ?>
                        <?php foreach( $karyawan->result() as $k ): ?>
                            <option value="<?php echo $k->id_karyawan; ?>" <?php if( $this->input->post('karyawan') == $k->id_karyawan ): echo 'selected="selected"'; endif; ?> ><?php echo $k->NIK . ' - ' . $k->nama_karyawan; ?></option>
                        <?php endforeach; ?>
                    <?php endif; ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">Bulan</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="inputPassword3" readonly="" value="<?php echo date_translate(date('F Y' , strtotime(date('d-m-Y')))) ?>">
                  <input type="hidden" name="bulan" value="<?php echo date('Y-m-d H:i:s'); ?>">
                </div>
              </div>

            <hr>
            
            <?php if( $this->session->flashdata('success') ): ?>
                <div class="alert alert-success" role="alert"><?php echo $this->session->flashdata('success'); ?></div>
            <?php endif; ?>

            <table class="table table-bordered table-striped" width="100%">
                <thead>
                    <tr>
                        <th width="2%">#</th>
                        <th class="text-center" width="15%">
                            Kriteria / Sub Kriteria
                        </th>
                        <th class="text-center" width="5%">
                            Skor
                        </th>
                        <th class="text-center" width="5%">
                            Pilih
                        </th>
                    </tr>
                </thead>
                <tbody>
                <?php $n = 1; foreach( $kriteria->result() as $k ): ?>
                    <tr>
                        <td class="text-center"><?php echo $n++ ?></td>
                        <td colspan="3"><?php echo $k->nama_kriteria ?></td>
                    </tr>
                    <?php 
                    $sub = $this->db->query("SELECT a.* , b.*
                                                   FROM m_nilai_kriteria a 
                                                   INNER JOIN m_kriteria b ON a.id_kriteria = b.id_kriteria 
                                                   WHERE a.id_kriteria=$k->id_kriteria "); ?>
                    <?php $m = 1; foreach( $sub->result() as $s ): ?>
                        <tr>
                            <td></td>
                            <td><?php echo $m++ .'. '. $s->nama_nilai_kriteria; ?></td>
                            <td class="text-center"><?php echo $s->nilai_kriteria; ?></td>
                            <td>
                                <div class="radio text-center">
                                  <label>
                                    <input type="radio" required="" name="nilai_<?php echo $k->id_kriteria ?>" value="<?php echo $s->nilai_kriteria ?>">
                                  </label>
                                </div>
                            </td>
                        </tr>   
                    <?php endforeach; ?>
                <?php endforeach; ?>
                </tbody>
            </table>
            <button type="submit" class="btn btn-sm btn-primary" id="hitung" name="hitung" value="Hitung">Hitung</button>
            <input type="hidden" name="id_karyawan">
            </form>
        </div>
    </div>
</div>

<?php 
    if( $this->input->post('hitung') && $jumlah_data->num_rows() != 1 ): 
?>
<div class="col-lg-12">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>Hasil Perhitungan Bonus</h5>
            <div class="ibox-tools">
                <a class="collapse-link">
                    <i class="fa fa-chevron-up"></i>
                </a>
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-wrench"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#">Config option 1</a>
                    </li>
                    <li><a href="#">Config option 2</a>
                    </li>
                </ul>
                <a class="close-link">
                    <i class="fa fa-times"></i>
                </a>
            </div>
        </div>
        <div class="ibox-content">
            <table class="table table-striped">
                    <thead>
                        <tr>
                            <td>NIK</td>
                            <td>:</td>
                            <td><?php echo isset( $getone_karyawan->NIK ) ? $getone_karyawan->NIK : ''; ?></td>
                        </tr> 
                        <tr>
                            <td>Nama Karyawan</td>
                            <td>:</td>
                            <td><?php echo isset( $getone_karyawan->nama_karyawan ) ? $getone_karyawan->nama_karyawan : ''; ?></td>
                        </tr>
                        <tr>
                            <td>Total Nilai Kriteria</td>
                            <td>:</td>
                            <td><?php echo $n_kriteria; ?></td>
                        </tr>
                        <tr>
                            <td>Kriteria Persentase</td>
                            <td>:</td>
                            <td><?php echo $n_persentase; ?> %</td>
                        </tr>
                        <tr>
                            <td>Perhitungan Bonus</td>
                            <td>:</td>
                            <td> Rp. 1.737.600,00 (UMR) x Kriteria Persentase (%) </td>
                        </tr>
                        <tr>
                            <td>Hasil Perhitungan Bonus</td>
                            <td>:</td>
                            <td>
                                <strong><?php echo 'Rp. '. number_format( $hasil_bonus , 2 , ',' , '.' ); ?></strong> 
                            </td>
                        </tr>
                    </thead>
            </table>
        </div>
    </div>
</div>
<?php endif; ?>