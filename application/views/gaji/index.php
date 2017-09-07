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
                            <option value="<?php echo $k->id_karyawan ?>"><?php echo $k->nama_karyawan ?></option>
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
            
            <div class="row">
                
                <div class="col-sm-6">

                    <table class="table table-bordered table-striped" width="100%">
                        <thead>
                            <tr>
                                <th class="text-center" rowspan="2">
                                    No
                                </th>
                                <th class="text-center" rowspan="2">
                                    Tunjangan
                                </th>
                                <th class="text-center" rowspan="2">
                                    Nilai
                                </th>
                                <th class="text-center" colspan="2">
                                    Pilih
                                </th>
                            </tr>
                            <tr>
                                <th class="text-center">Ya</th>
                                <th class="text-center">Tidak</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if( $d_tunjangan->num_rows() > 0 ): ?>
                                <?php foreach( $d_tunjangan->result() as $t ): ?>
                                    <tr>
                                        <td></td>
                                        <td><?php echo $t->nama_tunjangan ?></td>
                                        <td class="text-right"><?php echo 'Rp.' . number_format( $t->nilai_tunjangan , 2 , ',' , '.' ) ?></td>
                                        <td class="text-center">
                                            <input type="radio" name="tunjangan_<?php echo $t->id_tunjangan ?>" id="optionsRadios1" value="1">
                                        </td>
                                        <td class="text-center">
                                            <input type="radio" name="tunjangan_<?php echo $t->id_tunjangan ?>" id="optionsRadios1" value="0">
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            <?php endif; ?>
                        </tbody>
                    </table>

                </div>

                <div class="col-sm-6">
                    <table class="table table-bordered table-striped" width="100%">
                        <thead>
                            <tr>
                                <th class="text-center" rowspan="2">
                                    No
                                </th>
                                <th class="text-center" rowspan="2">
                                    Potongan
                                </th>
                                <th class="text-center" rowspan="2">
                                    Nilai
                                </th>
                                <th class="text-center" colspan="2">
                                    Pilih
                                </th>
                            </tr>
                            <tr>
                                <th class="text-center">Ya</th>
                                <th class="text-center">Tidak</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if( $d_potongan->num_rows() > 0 ): ?>
                                <?php foreach( $d_potongan->result() as $p ): ?>
                                    <tr>
                                        <td></td>
                                        <td><?php echo $p->nama_potongan ?></td>
                                        <td class="text-right"><?php echo 'Rp. ' . number_format( $p->nilai_potongan , 2 , ',' , '.' ); ?></td>
                                        <td class="text-center">
                                            <input type="radio" name="potongan_<?php echo $p->id_potongan; ?>" value="1">
                                        </td>
                                        <td class="text-center">
                                            <input type="radio" name="potongan_<?php echo $p->id_potongan; ?>" value="0">
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            <?php endif; ?>
                        </tbody>
                    </table>
                </div>

            </div>            
            
            <button type="submit" class="btn btn-sm btn-primary" id="hitung" name="hitung_bonus" value="Hitung">Hitung</button>
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