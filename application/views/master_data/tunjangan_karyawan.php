<div class="col-lg-12">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>Daftar Tunjangan Karyawan</h5>
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
            <?php if( $this->session->flashdata('success') ): ?>
                <div class="alert alert-success" role="alert"><strong>Sukses!</strong> <?php echo $this->session->flashdata('success'); ?></div>
            <?php endif; ?>
            <form class="form-horizontal" method="POST">
              <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">NIK</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" value="<?php echo isset( $karyawan ) ? $karyawan->row()->NIK : ''; ?>" readonly="">
                  <input type="hidden" name="id_karyawan" value="<?php echo isset( $karyawan ) ? $karyawan->row()->id_karyawan : ''; ?>">
                </div>
              </div>
              <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">Nama Karyawan</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="inputPassword3" placeholder="Password" value="<?php echo isset( $karyawan ) ? $karyawan->row()->nama_karyawan : ''; ?>">
                </div>
              </div>
              <div class="form-group">
              </div>
              <div class="form-group">
              <?php if( $tunjangan->num_rows() > 0 ): ?>
                
                <label for="inputPassword3" class="col-sm-2 control-label">Tunjangan</label>

                <?php foreach( $tunjangan->result_array() as $index => $t ): ?>
                  <?php 
                    if( $get_one_tunjangan->num_rows() > 0 ): 
                          foreach( $get_one_tunjangan->result_array() as $index => $result_getone ):
                            $r_g[] = $result_getone['id_tunjangan'];
                          endforeach;
                    else:
                      $r_g = array();
                    endif;
                  $select =( in_array( $t['id_tunjangan'] , $r_g )) ? 'checked="checked"' : '';
                  ?>
                  
                    <div class="col-sm-offset-2 col-sm-10">
                      <div class="checkbox">
                        <label>
                          <input type="checkbox" name="tunjangan[]" value="<?php echo $t['id_tunjangan'] ?>" <?php echo $select ?>> <?php echo $t['nama_tunjangan'] . ' ( Rp. ' . number_format( $t['nilai_tunjangan'] , 2 , ',' , '.' ) . ' )'; ?>
                        </label>
                      </div>
                    </div>

                <?php endforeach; ?>
              <?php endif;?>
              </div>
              <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">Potongan</label>
                <div class="col-sm-offset-2 col-sm-10">
                  <?php if( $potongan->num_rows() > 0 ): ?>
                    <?php foreach( $potongan->result_array() as $p ):
                      if( $get_one_potongan->num_rows() > 0 ):
                        foreach( $get_one_potongan->result_array() as $result_potongan ):
                          $r_p[] = $result_potongan['id_potongan'];
                        endforeach;
                      else :
                        $r_p = array();
                      endif;
                      $pilih = (in_array( $p['id_potongan'] , $r_p)) ? 'checked="checked"' : '' ;
                    ?>
                      <div class="checkbox">
                        <label>
                          <input type="checkbox" name="potongan[]" value="<?php echo $p['id_potongan'] ?>" <?php echo $pilih ?>> <?php echo $p['nama_potongan'] . ' ( Rp. ' . number_format( $p['nilai_potongan'] , 2 , ',' , '.' ) . ' )'; ?>
                        </label>
                      </div>
                    <?php endforeach; ?>
                  <?php endif; ?>
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                  <input type="submit" class="btn btn-sm btn-primary" name="submit" value="Simpan">
                </div>
              </div>
            </form>
        </div>
    </div>
</div>
<script src="<?php echo base_url(); ?>assets/jquery/jquery-2.1.1.js"></script>