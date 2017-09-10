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
            <form class="form-horizontal">
              <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">NIK</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" value="<?php echo isset( $karyawan ) ? $karyawan->row()->NIK : ''; ?>" readonly="">
                </div>
              </div>
              <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">Nama Karyawan</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="inputPassword3" placeholder="Password" value="<?php echo isset( $karyawan ) ? $karyawan->row()->nama_karyawan : ''; ?>">
                </div>
              </div>
              <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">Tunjangan</label>
              </div>
              <div class="form-group">
              <?php if( $tunjangan->num_rows() > 0 ): ?>
                <?php foreach( $tunjangan->result_array() as $t ): ?>
                  <label for="inputPassword3" class="col-sm-2 control-label"></label>
                    <div class="col-sm-10">
                      <div class="checkbox">
                        <label>
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
                          <input type="checkbox" <?php echo $select ?>> <?php echo $t['nama_tunjangan'] ?>
                        </label>
                      </div>
                    </div>

                <?php endforeach; ?>
              <?php endif;?>
              </div>
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                  <button type="submit" class="btn btn-default">Sign in</button>
                </div>
              </div>
            </form>
        </div>
    </div>
</div>
<script src="<?php echo base_url(); ?>assets/jquery/jquery-2.1.1.js"></script>