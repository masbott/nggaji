<div class="col-lg-12">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>Daftar Sub Kriteria</h5>
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
            <table class="table table-striped table-bordered" width="100%">
                <thead>
                    <tr>
                        <th class="text-center" width="2%">#</th>
                        <th class="text-center" width="20%">Kriteria / Sub Kriteria</th>
                        <th class="text-center" width="10%">Nilai</th>
                        <th class="text-center" width="5%">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                  <?php $no = 1; foreach( $kriteria->result() as $k ): ?>
                    <tr>
                      <td class="text-center"><?php echo $no++; ?></td>
                      <td colspan="3"><?php echo $k->nama_kriteria ?></td>
                      
                    </tr>
                    <?php $nilai = $this->master_data->get_nilai_kriteria( $k->id_kriteria ); ?>
                    <?php foreach( $nilai->result() as $n ): ?>
                      <tr>
                        <td></td>
                        <td><?php echo $n->nama_nilai_kriteria ?></td>
                        <td class="text-center"><?php echo $n->nilai_kriteria ?></td>
                        <td class="text-center">
                          <a href="#" data-id="" class="btn btn-xs btn-primary edit"><i class="fa fa-pencil"></i> Edit </a>
                          <a href="<?php echo site_url('master_data/nilai_kriteria/delete/'.$n->id_nilai_kriteria) ?>" class="btn btn-xs btn-danger" onclick="return confirm('Yakin akan menghapus data ini?')"> <i class="fa fa-trash"></i> Hapus </a>
                        </td>
                      </tr>
                    <?php endforeach; ?>
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
        <h4 class="modal-title" id="myModalLabel">Tambah Sub Kriteria</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" action="">

          <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">Kriteria</label>
            <div class="col-sm-10">
              <select name="kriteria" id="" class="form-control">
                <option value="">-Pilih Kriteria --</option>
                <?php foreach( $kriteria->result() as $kriterias ): ?>
                  <option value="<?php echo $kriterias->id_kriteria ?>"><?php echo $kriterias->nama_kriteria ?></option>
                <?php endforeach; ?>
              </select>
            </div>
          </div>

          <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">Sub Kriteria</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="nama_sub_kriteria" placeholder="Masukkan Sub Kriteria" required="">
            </div>
          </div>

          <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">Nilai</label>
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
        <h4 class="modal-title" id="myModalLabel">Edit Kriteria</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" action="">

          <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">Kriteria</label>
            <div class="col-sm-10">
              <input type="text" class="form-control nama_kriteria" name="nama_kriteria" placeholder="Masukkan NIK" required="">
            </div>
          </div>
        
      </div>
      <div class="modal-footer">
        <input type="submit" name="submit" class="btn btn-sm btn-danger" data-dismiss="modal" value="Batal">
        <input type="submit" name="submit_edit" class="btn btn-sm btn-primary" value="Simpan">
        <input type="hidden" name="id_kriteria" class="id_kriteria">
      </div>
      </form>
    </div>
  </div>
</div>
<!-- end modal edit karyawan -->
<script src="<?php echo base_url(); ?>assets/jquery/jquery-2.1.1.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    $('body').on('click' , '.edit' , function(e){
      e.preventDefault();
      var id = $(this).data('id');
      $.post('<?php echo site_url('master_data/getone_kriteria') ?>',
        {id:id},
        function(data){
          $('.id_kriteria').val(data.id_kriteria);
          $('.nama_kriteria').val(data.nama_kriteria);
          $('#myModaledit').modal('show');
        });
    });
  }); 
</script>