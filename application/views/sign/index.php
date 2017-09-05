<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>INSPINIA | Login</title>

    <link href="<?php echo base_url() ?>assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<?php echo base_url() ?>assets/fontawesome/css/font-awesome.css" rel="stylesheet">

    <link href="<?php echo base_url() ?>assets/custome/css/animate.css" rel="stylesheet">
    <link href="<?php echo base_url() ?>assets/custome/css/style.css" rel="stylesheet">

</head>

<body class="gray-bg">

    <div class="middle-box text-center loginscreen  animated fadeInDown">
        <div>
            <div>

                <h1 class="logo-name">IN+</h1>

            </div>
            <h3>Welcome NgitungGaji</h3>
            <p>Login in. To see it in action.</p>
            <form class="m-t" role="form" method="POST" action="<?php echo site_url('sign/proses') ?>">
                <div class="form-group">
                    <input type="text" name="username" class="form-control" placeholder="Username" required="">
                </div>
                <div class="form-group">
                    <input type="password" name="password" class="form-control" placeholder="Password" required="">
                </div>
                <button type="submit" class="btn btn-primary block full-width m-b">Login</button>
                
            </form>
                
                <?php if( $this->session->flashdata('failed') ) : ?>
                    <div class="alert alert-danger alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <strong>Peringatan!</strong> <?php echo $this->session->flashdata('failed'); ?>
                    </div>
                <?php endif; ?>

        </div>
    </div>

    <!-- Mainly scripts -->
    <script src="<?php echo base_url() ?>assets/jquery/jquery-2.1.1.js"></script>
    <script src="<?php echo base_url() ?>assets/bootstrap/js/bootstrap.min.js"></script>

</body>

</html>
