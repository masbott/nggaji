<div class="col-lg-12">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>Daftar Jabatan</h5>
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
            <?php if( $this->session->flashdata('success') ): ?>
                <div class="alert alert-success" role="alert"><strong>Sukses!</strong> <?php echo $this->session->flashdata('success'); ?></div>
            <?php endif; ?>
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">#</th>
                        <th class="text-center">Nama Jabatan</th>
                        <th class="text-center">Gaji Pokok</th>                        
                        <th class="text-center">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $no = 1; foreach( $jabatan->result() as $j ) : ?>
                      <tr>
                        <td class="text-center"><?php echo $no++; ?></td>
                        <td><?php echo $j->nama_jabatan; ?></td>
                        <td class="text-right"><?php echo 'Rp. '. number_format( $j->gaji_pokok , 2 , ',' , '.'); ?></td>
                        <td class="text-center">
                          <a href="#" data-id="<?php echo $j->id_jabatan ?>" class="btn btn-xs btn-primary edit"><i class="fa fa-pencil"></i> Edit </a>
                          <a href="<?php echo site_url('master_data/jabatan/delete/'.$j->id_jabatan); ?>" class="btn btn-xs btn-danger" onclick="return confirm('Yakin akan menghapus data ini?')"> <i class="fa fa-trash"></i> Hapus </a>
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
        <h4 class="modal-title" id="myModalLabel">Tambah Jabatan</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" action="">

          <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">Nama Jabatan</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="nama_jabatan" placeholder="Masukkan Nama Jabatan" required="">
            </div>
          </div>

          <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Gaji Pokok</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="gaji_pokok" placeholder="Masukkan Gaji Pokok" required="">
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
        <h4 class="modal-title" id="myModalLabel">Edit Jabatan</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" action="">

          <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">Nama Jabatan</label>
            <div class="col-sm-10">
              <input type="text" class="form-control nama_jabatan" name="nama_jabatan" placeholder="Masukkan NIK" required="">
            </div>
          </div>

          <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Gaji Pokok</label>
            <div class="col-sm-10">
              <input type="text" class="form-control gaji_pokok" name="gaji_pokok" placeholder="Masukkan Nama Karyawan" required="">
            </div>
          </div>
        
      </div>
      <div class="modal-footer">
        <input type="submit" name="submit" class="btn btn-sm btn-danger" data-dismiss="modal" value="Batal">
        <input type="submit" name="submit_edit" class="btn btn-sm btn-primary" value="Simpan">
        <input type="hidden" name="id_jabatan" class="id_jabatan">
      </div>
      </form>
    </div>
  </div>
</div>
<!-- end modal edit karyawan -->
<script src="<?php echo base_url(); ?>assets/jquery/jquery-2.1.1.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    $('body').on('click' , '.edit' , function(e) {
      e.preventDefault();
      var id = $(this).data('id');

      $.post('<?php echo site_url('master_data/edit_jabatan') ?>',
            {id:id},
            function(data){
              $('.id_jabatan').val(data.id_jabatan);
              $('.nama_jabatan').val(data.nama_jabatan);
              $('.gaji_pokok').val(data.gaji_pokok);
              $('#myModaledit').modal('show');        
            });
      
    } );
  });
</script>