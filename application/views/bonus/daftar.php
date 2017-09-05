<div class="col-lg-12">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>Daftar Bonus</h5>
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

                    <?php $jumlah = 0; if( $daftar->num_rows() > 0 ): ?>
                        <?php foreach( $daftar->result() as $d ): ?>
                            <tr>
                                <td></td>
                                <td><?php echo $d->NIK ?></td>
                                <td><?php echo $d->nama_karyawan ?></td>
                                <td><?php echo date_translate(date('F Y' , strtotime( $d->bulan ) )  ) ?></td>
                                <td class="text-right"><?php echo 'Rp. '. number_format($d->jumlah , 2 , ',' , '.' );  ?></td>
                                <?php $jumlah += $d->jumlah; ?>
                            </tr>
                        <?php endforeach; ?>
                    <?php endif; ?>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="4">Jumlah</td>
                        <td class="text-right"><?php echo 'Rp. ' .number_format( $jumlah , 2 , ',' , '.' ); ?></td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
</div>