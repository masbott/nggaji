<div class="col-lg-12">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>Data UMR</h5>
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
            <table class="table table-striped table-bordered" width="100%">
                <thead>
                    <tr>
                        <th class="text-center" width="2%">#</th>
                        <th class="text-center" width="10%">UMR</th>
                        <th class="text-center" width="10%">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                  <tr>
                    <td class="text-center">1</td>
                    <td><?php echo isset( $data ) ? 'Rp. '. number_format( $data->row()->nilai , 2 , ',' , '.') : ''; ?></td>
                    <td class="text-center">
                      <a href="" class="btn btn-xs btn-success btn-edit"><i class="fa fa-pencil"></i></a>
                    </td>
                  </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

</div>
<!-- end modal edit karyawan -->

<div class="modal fade bs-example-modal-lg" id="myModaledit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Edit UMR</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" action="">

          <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">Nilai UMR</label>
            <div class="col-sm-10">
              <input type="text" class="form-control nilai_umr" data-id="umr" name="nilai" placeholder="Masukkan NIK" required="">
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

<script src="<?php echo base_url(); ?>assets/jquery/jquery-2.1.1.js"></script>

<script type="text/javascript">
  $('body').on('click' , '.btn-edit' , function(e){
    e.preventDefault();
      $.post('<?php echo site_url('master_data/get_umr') ?>',
              {},
                function(data){
                    $('.nilai_umr').val(data.nilai);
                    $('#myModaledit').modal('show');
                }
              );
  } );
</script>