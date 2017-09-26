<div class="col-lg-12">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>Daftar Gaji</h5>
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
            <form action="" method="POST">
                <table class="table table-striped">
                    <tr>
                        <td>Per Bulan / Tahun</td>
                        <td>:</td>
                        <td>
                            <input type="text" name="periode" class="form-control datepicker">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"></td>
                        <td>
                            <input type="submit" class="btn btn-sm btn-primary" name="btn_lihat" value="Lihat">
                        </td>
                    </tr>
                </table>
            </form>
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">#</th>
                        <th class="text-center">NIK</th>
                        <th class="text-center">Nama Karyawan</th>                        
                        <th class="text-center">Bulan</th>
                        <th class="text-center">Jumlah Bonus (Rp)</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $this->load->model('m_gaji' , 'gaji' ); if( $this->input->post('btn_lihat') ): ?>

                        <?php 
                         list( $bulan , $tahun ) = explode( '/', $this->input->post('periode'));
                         $gaji =  $this->gaji->data_gaji( $tahun , $bulan );
                        ?>
                        <?php $no = 1; foreach( $gaji->result() as $g ): ?>
                            <tr>
                                <td class="text-center"><?php echo $no++ ?></td>
                                <td><?php echo $g->NIK ?></td>
                                <td><?php echo $g->nama_karyawan ?></td>
                                <td><?php echo date_translate(date('F Y' , strtotime( $g->bulan )))  ?></td>
                                <td class="text-right"><?php echo 'Rp.' . number_format( $g->total_gaji , 2 , ',' , '.' ) ?></td>
                            </tr>
                        <?php endforeach; ?>
                    <?php else: ?>
                        <tr>
                            <td colspan="5">SILAHKAN PILIH BULAN TERLEBIH DAHULU</td>
                        </tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>