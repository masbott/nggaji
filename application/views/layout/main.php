<?php $this->load->view( 'layout/header' ); ?>

<body>

    <div id="wrapper">

    <?php $this->load->view( 'layout/sidebar' );  ?>

        <div id="page-wrapper" class="gray-bg">
        <div class="row border-bottom">
        <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
                <form role="search" class="navbar-form-custom" method="post" action="search_results.html">
                    <div class="form-group">
                        <input type="text" placeholder="Search for something..." class="form-control" name="top-search" id="top-search">
                    </div>
                </form>
            </div>
            <ul class="nav navbar-top-links navbar-right">
                <li>
                    <a href="<?php echo site_url('sign/logout') ?>">
                        <i class="fa fa-sign-out"></i> Log out
                    </a>
                </li>
            </ul>

        </nav>
        </div>
        <!-- breadcrumb -->
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2><?php echo isset( $sub ) ? $sub['title'] : ''; ?> - <?php echo isset( $sub ) ? $sub['sub_title'] : ''; ?></h2>
                <ol class="breadcrumb">
                    
                </ol>
            </div>
            <div class="col-lg-2">

            </div>
        </div>

        <div class="wrapper wrapper-content">
            <div class="row">
                <?php (!empty($content) && isset($content)) ? $this->load->view($content) : ''; ?>
            </div>
        </div>
        <?php $this->load->view( 'layout/footer' ); ?>
