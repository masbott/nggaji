<div class="col-lg-12">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>Hitung Gaji</h5>
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
                    <?php if( $karyawan->num_rows() > 0 ): ?>
                        <option value="">- PIlih Karyawan -</option>
                        <?php foreach( $karyawan->result() as $k ): ?>
                            <option value="<?php echo $k->id_karyawan ?>" <?php if( $this->input->post('karyawan') == $k->id_karyawan ): echo 'selected="selected"'; else : echo ''; endif; ?> ><?php echo $k->nama_karyawan ?></option>
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
                  <input type="submit" class="btn btn-sm btn-primary" name="hitung_bonus" value="Hitung" style="margin-top: 10px;">
                  <input type="hidden" name="id_karyawan">
                </div>
              </div>
            <hr>
            
            <?php if( $this->session->flashdata('success') ): ?>
                <div class="alert alert-success" role="alert"> <strong>Sukses!</strong> <?php echo $this->session->flashdata('success'); ?></div>
            <?php endif; ?>

            <?php if( $this->session->flashdata('failed') ): ?>
                <div class="alert alert-danger" role="alert"> <strong>Peringatan!</strong> <?php echo $this->session->flashdata('failed'); ?></div>
            <?php endif; ?>
            
            <div class="row">
                
            </div>            
            </form>
        </div>
    </div>
</div>
<?php //print_r( isset( $cek_tunjangan) ? $cek_tunjangan : '' ); ?>
<?php 
    if( $this->input->post('hitung_bonus') ): 
?>
<div class="col-lg-12">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>Hasil Perhitungan Gaji</h5>
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
                            <td width="20%">NIK</td>
                            <td width="5%">:</td>
                            <td><?php echo isset( $kar_jab ) ? $kar_jab->row()->NIK : ''; ?></td>
                            <td>Nama Karyawan</td>
                            <td>:</td>
                            <td><?php echo isset( $kar_jab ) ? $kar_jab->row()->nama_karyawan : ''; ?></td>
                        </tr> 
                        <tr>

                            <td>Nomor Telepon</td>
                            <td>:</td>
                            <td><?php echo isset( $kar_jab ) ? $kar_jab->row()->no_telepon : ''; ?></td>

                            <td>Periode</td>
                            <td>:</td>
                            <td><?php echo date_translate(date('F Y' , strtotime(date('d-m-Y')))) ?></td>

                        </tr>

                        <tr>
                            <td colspan="6"></td>
                        </tr>


                        <tr>
                            <td>Gaji Pokok</td>
                            <td>:</td>
                            <td class="text-right"><?php echo isset( $getone_jabatan ) ? 'Rp. ' .'<strong>' . number_format( $getone_jabatan->row()->gaji_pokok , 2 , ',' , '.' ) . '<strong>' : ''; ?></td>
                        </tr>
                        <tr>
                            <td>Tunjangan</td>
                            <td colspan="2"></td>
                        </tr>
                        <?php if( $get_tunjangan_karyawan->num_rows() > 0 ): ?>
                            <?php $jumlah_tunjangan = 0; ?>
                            <?php foreach( $get_tunjangan_karyawan->result() as $karyawan_tunjangan ): ?>
                                <tr>
                                    <td><?php echo $karyawan_tunjangan->nama_tunjangan ?></td>
                                    <td>:</td>
                                    <td class="text-right"><?php echo 'Rp. '. number_format( $karyawan_tunjangan->nilai_tunjangan , 2 , ',' , '.' ) ?></td>
                                    <?php $jumlah_tunjangan += $karyawan_tunjangan->nilai_tunjangan; ?>
                                </tr>
                            <?php endforeach; ?>
                        <?php else: ?>

                        <?php endif; ?>
                        <tr>
                            <td colspan="2"></td>
                            <td class="text-right"><?php echo 'Rp. '. '<strong>'. number_format( $jumlah_tunjangan , 2 , ',' , '.' ). '</strong>'; ?></td>
                        </tr>

                        <tr>
                            <td>Potongan</td>
                            <td colspan="2"></td>
                        </tr>
                        <?php $jumlah_potongan = 0; ?>
                        <?php if( $get_potongan_karyawan->num_rows() > 0 ): ?>
                            <?php foreach( $get_potongan_karyawan->result() as $p ): ?>
                                <tr>
                                    <td><?php echo $p->nama_potongan ?></td>
                                    <td>:</td>
                                    <td class="text-right"><?php echo 'Rp. ' . number_format( $p->nilai_potongan , 2 , ',' , '.' ); ?></td>
                                    <?php $jumlah_potongan += $p->nilai_potongan; ?>
                                </tr>
                            <?php endforeach; ?>
                        <?php endif; ?>
                        <tr>
                            <td colspan="2"></td>
                            <td class="text-right"><?php echo 'Rp. '. '<strong>' . number_format( $jumlah_potongan , 2 , ',' , '.' ) . '</strong>'; ?></td>
                        </tr>
                    </thead>

            </table>
        </div>
    </div>
</div>
<?php endif; ?>