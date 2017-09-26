<div class="col-lg-12">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>Daftar Karyawan</h5>
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
            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">
                <i class="fa fa-plus"></i>
                Tambah
            </button>

            <?php if( $this->session->flashdata('failed') ): ?>
                <div class="alert alert-danger" role="alert"><strong>Sukses!</strong> <?php echo $this->session->flashdata('failed'); ?></div>
            <?php endif; ?>

            <?php if( $this->session->flashdata('success') ): ?>
                <div class="alert alert-success" role="alert"><strong>Sukses!</strong> <?php echo $this->session->flashdata('success'); ?></div>
            <?php endif; ?>
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">#</th>
                        <th class="text-center">NIK</th>
                        <th class="text-center">Nama Karyawan</th>                        
                        <th class="text-center">Jenis Kelamin</th> 
                        <th class="text-center">Jabatan</th>
                        <th class="text-center">Nomor Telepon</th>
                        <th class="text-center">Alamat</th>
                        <th class="text-center">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $n = 1; foreach( $get_data->result() as $g ): ?>
                        <?php 
                            if( $g->jenis_kelamin == 'L' ): 
                                $jl = 'Laki-laki';
                            else:
                                $jl = 'Perempuan';
                            endif;
                        ?>

                        <tr>
                            <td><?php echo $n++; ?></td>
                            <td><?php echo $g->NIK ?></td>
                            <td><?php echo $g->nama_karyawan ?></td>
                            <td><?php echo $jl ?></td>
                            <td><?php echo $g->nama_jabatan ?></td>
                            <td><?php echo $g->no_telepon ?></td>
                            <td><?php echo $g->alamat ?></td>
                            <td>
                                <a href="" class="btn btn-xs btn-primary edit" data-id="<?php echo $g->id_karyawan ?>"> <i class="fa fa-pencil"></i> Edit </a>
                                <a href="<?php echo site_url('master_data/karyawan/delete/'.$g->id_karyawan) ?>" class="btn btn-xs btn-danger" onclick="return confirm('Yakin akan menghapus data ini?')"> <i class="fa fa-trash"></i> Hapus </a>
                                <a href="<?php echo site_url('master_data/tunjangan_karyawan/'.$g->id_karyawan) ?>" class="btn btn-xs btn-info"><i class="fa fa-eye"></i> Detail</a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- begin modal tambah karyawan -->

<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Tambah Karyawan</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" action="<?php echo site_url('master_data/karyawan') ?>" >

          <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">NIK</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="nik" placeholder="Masukkan NIK" required="">
            </div>
          </div>

          <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Nama Karyawan</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="nama_karyawan" placeholder="Masukkan Nama Karyawan" required="">
            </div>
          </div>

          <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Jenis Kelamin</label>
            <div class="col-sm-10">
              <div class="radio">
                  <label>
                    <input type="radio" name="jenis_kelamin" value="L">
                    Laki-laki
                  </label>
                </div>
                <div class="radio">
                  <label>
                    <input type="radio" name="jenis_kelamin" value="P">
                    Perempuan
                  </label>
                </div>
            </div>
          </div>

          <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Nomor Telepon</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="nomor_telepon" placeholder="Masukkan Nomor Telepon" required="">
            </div>
          </div>

          <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Alamat</label>
            <div class="col-sm-10">
              <textarea class="form-control" cols="10" name="alamat" placeholder="Masukkan Alamat"></textarea>
            </div>
          </div>

          <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Jabatan</label>
            <div class="col-sm-10">
              <select name="jabatan" id="" class="form-control">
                    <option value="">- Pilih Jabatan -</option>
                    <?php foreach( $jabatan->result() as $j ):  ?>
                        <option value="<?php echo $j->id_jabatan ?>"><?php echo $j->nama_jabatan ?></option>
                    <?php endforeach; ?>
              </select>
            </div>
          </div>
          
          <div class="form-group">
            <?php if( $tunjangan->num_rows() > 0 ): ?>
              
              <label for="inputPassword3" class="col-sm-2 control-label">Tunjangan</label>

              <?php foreach( $tunjangan->result_array() as $index => $t ): ?>
                  <div class="col-sm-offset-2 col-sm-10">
                    <div class="checkbox">
                      <label>
                        <input type="checkbox" name="tunjangan[]" value="<?php echo $t['id_tunjangan'] ?>"> <?php echo $t['nama_tunjangan'] . ' ( Rp. ' . number_format( $t['nilai_tunjangan'] , 2 , ',' , '.' ) . ' )'; ?>
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
                <?php foreach( $potongan->result_array() as $p ): ?>
                
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="potongan[]" value="<?php echo $p['id_potongan'] ?>"> <?php echo $p['nama_potongan'] . ' ( Rp. ' . number_format( $p['nilai_potongan'] , 2 , ',' , '.' ) . ' )'; ?>
                    </label>
                  </div>
                <?php endforeach; ?>
              <?php endif; ?>
            </div>
          </div>

      </div>
      <div class="modal-footer">
        <input type="submit" name="submit" class="btn btn-sm btn-danger" data-dismiss="modal" value="Batal">
        <input type="submit" name="submit" class="btn btn-sm btn-primary" value="Simpan">
      </div>
      </form>
    </div>
  </div>
</div>

<!-- end modal tambah karyawan -->

<!-- begin modal edit karyawan -->
<div class="modal fade bs-example-modal-lg" id="myModaledit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Edit Karyawan</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" action="<?php echo site_url('master_data/karyawan') ?>" >

          <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">NIK</label>
            <div class="col-sm-10">
              <input type="text" class="form-control nik" name="nik" placeholder="Masukkan NIK" required="">
            </div>
          </div>

          <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Nama Karyawan</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="nama_karyawan" name="nama_karyawan" placeholder="Masukkan Nama Karyawan" required="">
            </div>
          </div>

          <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Jenis Kelamin</label>
            <div class="col-sm-10">
              <div class="radio">
                  <label>
                    <input type="radio" name="jenis_kelamin" id="jenis_kelamin" value="L">
                    Laki-laki
                  </label>
                </div>
                <div class="radio">
                  <label>
                    <input type="radio" name="jenis_kelamin" id="jenis_kelamin" value="P">
                    Perempuan
                  </label>
                </div>
            </div>
          </div>

          <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Nomor Telepon</label>
            <div class="col-sm-10">
              <input type="text" class="form-control nomor_telepon" name="nomor_telepon" placeholder="Masukkan Nomor Telepon" required="">
            </div>
          </div>

          <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Alamat</label>
            <div class="col-sm-10">
              <textarea class="form-control alamat" cols="10" name="alamat" placeholder="Masukkan Alamat"></textarea>
            </div>
          </div>

          <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Jabatan</label>
            <div class="col-sm-10">
              <select name="jabatan" id="" class="form-control jabatan">
                    <option value="">- Pilih Jabatan -</option>
                    <?php foreach( $jabatan->result() as $j ):  ?>
                        <option value="<?php echo $j->id_jabatan ?>"><?php echo $j->nama_jabatan ?></option>
                    <?php endforeach; ?>
              </select>
            </div>
          </div>
        
      </div>
      <div class="modal-footer">
        <input type="submit" name="submit" class="btn btn-sm btn-danger" data-dismiss="modal" value="Batal">
        <input type="submit" name="submit_edit" class="btn btn-sm btn-primary" value="Simpan">
        <input type="hidden" name="id_karyawan" class="id_karyawan">
      </div>
      </form>
    </div>
  </div>
</div>
<!-- end modal edit karyawan -->

<!-- begin modal detail karyawan -->
<div class="modal fade bs-example-modal-lg" id="myModaldetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Detail Karyawan</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" action="<?php echo site_url('master_data/karyawan') ?>" >

          <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">NIK</label>
            <div class="col-sm-10">
              <input type="text" class="form-control nik_detail" name="nik" placeholder="Masukkan NIK" required="">
            </div>
          </div>

          <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Nama Karyawan</label>
            <div class="col-sm-10">
              <input type="text" class="form-control nama_pegawai_detail" name="nama_karyawan" placeholder="Masukkan Nama Karyawan" required="">
            </div>
          </div>
          
          <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Tunjangan</label>
              
              <div class="checkbox col-sm-10 pilih_tunjangan">
              <?php foreach( $tunjangan->result() as $tunjangans ): ?>
                <label for="">
                    <input type="checkbox" class="tunjangan" name="tunjangan" value="<?php echo $tunjangans->id_tunjangan ?>"> <?php echo $tunjangans->nama_tunjangan ?> <br> 
                </label>
                <?php endforeach; ?>  
              </div>
            
          </div>
          
      </div>
      <div class="modal-footer">
        <input type="submit" name="submit" class="btn btn-sm btn-danger" data-dismiss="modal" value="Batal">
        <input type="submit" name="submit_edit" class="btn btn-sm btn-primary" value="Simpan">
        <input type="hidden" name="id_karyawan" class="id_karyawan">
      </div>
      </form>
    </div>
  </div>
</div>
<!-- end modal detail karyawan -->

<script src="<?php echo base_url(); ?>assets/jquery/jquery-2.1.1.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    $('body').on('click' , '.edit' , function(e){
      e.preventDefault();
      var id = $(this).data('id');

      $.post('<?php echo site_url('master_data/edit_karyawan') ?>',
              {id:id},
              function(data){

                $('.nik').val(data.NIK);
                $('#nama_karyawan').val(data.nama_karyawan);

                if(data.jenis_kelamin == 'L' ) {
                    $('#jenis_kelamin').attr('checked',true);
                } 

                if(data.jenis_kelamin == 'P' ) {
                    $("#jenis_kelamin").attr('checked',true);
                }

                $('.nomor_telepon').val(data.no_telepon);
                $('.alamat').val(data.alamat);
                $('.jabatan').val(data.jabatan).attr('selected' , true);
                $('.id_karyawan').val(data.id_karyawan);
                $('#myModaledit').modal('show');
              }
            );
      
    });

    $('body').on('click' , '.detail' , function(e){
      e.preventDefault();
      var id = $(this).data('id');
      
      $.post('<?php echo site_url('master_data/getone_tunjangan') ?>',
              {id:id},
              function(data){
                var val = ['1','2','3'];
                $(".pilih_tunjangan").find('[value=' + val.join('], [value=') + ']').prop("checked", true);
                //console.log(list);
                $('.nik_detail').val(data.nik);
                $('.nama_pegawai_detail').val(data.nama_pegawai);
                $('#myModaldetail').modal('show');
              }
             );
      
    });
  });
</script>