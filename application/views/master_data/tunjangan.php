<div class="col-lg-12">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>Daftar Tunjangan</h5>
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
                        <th class="text-center">Nama Tunjangan</th>
                        <th class="text-center">Nilai</th>                        
                        <th class="text-center">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                  <?php $n = 1; foreach( $get_data->result() as $t ): ?>
                    <tr>
                      <td class="text-center"><?php echo $n++; ?></td>
                      <td><?php echo $t->nama_tunjangan ?></td>
                      <td class="text-right"><?php echo 'Rp. '. number_format( $t->nilai_tunjangan , 2 , ',' , '.' ) ?></td>
                      <td class="text-center">
                          <a href="" class="btn btn-xs btn-primary edit" data-id="<?php echo $t->id_tunjangan ?>"> <i class="fa fa-pencil"></i> Edit </a>
                          <a href="<?php echo site_url('master_data/tunjangan/delete/'.$t->id_tunjangan) ?>" class="btn btn-xs btn-danger" onclick="return confirm('Yakin akan menghapus data ini?')"> <i class="fa fa-trash"></i> Hapus </a>
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
        <h4 class="modal-title" id="myModalLabel">Tambah Tunjangan</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" action="<?php echo site_url('master_data/tunjangan') ?>" >

          <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">Nama Tunjangan</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="nama_tunjangan" placeholder="Nama Tunjangan" required="">
            </div>
          </div>

          <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Nilai</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="nilai" placeholder="Masukkan Nilai" required="">
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
        <h4 class="modal-title" id="myModalLabel">Edit Tunjangan</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" action="<?php echo site_url('master_data/tunjangan') ?>" >

          <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">Nama Tunjangan</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="nama_tunjangan" id="nama_tunjangan" placeholder="Nama Tunjangan" required="">
            </div>
          </div>

          <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Nilai</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="nilai" id="nilai_tunjangan" placeholder="Masukkan Nilai" required="">
              <input type="hidden" name="id_tunjangan" id="id_tunjangan">
            </div>
          </div>
        
      </div>
      <div class="modal-footer">
        <input type="submit" name="submit" class="btn btn-sm btn-danger" data-dismiss="modal" value="Batal">
        <input type="submit" name="submit_edit" class="btn btn-sm btn-primary" value="Simpan">
        
      </div>
      </form>
    </div>
  </div>
</div>
<!-- end modal edit karyawan -->
<script src="<?php echo base_url(); ?>assets/jquery/jquery-2.1.1.js"></script>
<script type="text/javascript">
  $('body').on('click' , '.edit' , function(e){
    var id = $(this).data('id');
    e.preventDefault();
      $.post('<?php echo site_url('master_data/getsatu_tunjangan') ?>',
              {id:id},
              function(data){
                $('#nama_tunjangan').val(data.nama_tunjangan);
                $('#nilai_tunjangan').val(data.nilai_tunjangan);
                $('#id_tunjangan').val(data.id_tunjangan);
                $('#myModaledit').modal('show');
              }
            );
    
  });
</script>