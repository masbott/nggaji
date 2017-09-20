<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav" id="side-menu">
            <li class="nav-header">
                <div class="dropdown profile-element"> <span>
                        <img alt="image" class="img-circle" src="<?php echo base_url() ?>assets/img/profile_small.jpg" />
                         </span>
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold"><?php echo $this->session->userdata('nama') ?></strong>
                         </span> </a>
                    <ul class="dropdown-menu animated fadeInRight m-t-xs">
                        <li><a href="<?php echo site_url('sign/logout') ?>">Logout</a></li>
                    </ul>
                </div>
                <div class="logo-element">
                    IN+
                </div>
            </li>
            <li <?php if( $this->uri->segment(1) == 'beranda' ): echo 'class="active"'; endif; ?>>
                <a href="<?php echo site_url('beranda') ?>"><i class="fa fa-home"></i> <span class="nav-label">Beranda</span> </a>
            </li>


            <?php if( $this->session->userdata('level') == '1' ): ?>
                <li <?php echo in_array( $this->uri->segment(2), array('index','daftar')) ? 'class="active"' : ''; ?>>
                    <a href="<?php echo site_url('gaji/index') ?>"><i class="fa fa-money"></i> 
                        <span class="nav-label">Gaji</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li class="<?php if($this->uri->segment(2) == 'index' ): echo 'active'; endif; ?>">
                            <a href="<?php echo site_url('gaji/index') ?>">Hitung</a>
                        </li>
                        <li class="<?php if($this->uri->segment(2) == 'daftar' ): echo 'active'; endif; ?>">
                            <a href="<?php echo site_url('gaji/daftar') ?>">Daftar</a>
                        </li>
                    </ul>
                </li>

                <li <?php echo in_array($this->uri->segment(2), array('jabatan' , 'karyawan' , 'tunjangan' )) ? 'class="active"' : ''; ?>>
                <a href="index.html"><i class="fa fa-th-large"></i> <span class="nav-label">Master Data</span> <span class="fa arrow"></span></a>
                <ul class="nav nav-second-level ">
                    <li class="<?php if($this->uri->segment(2) == 'jabatan' ): echo 'active'; endif; ?>"><a href="<?php echo site_url('master_data/jabatan') ?>">Jabatan</a></li>
                    <li class="<?php if($this->uri->segment(2) == 'karyawan' ): echo 'active'; endif; ?>"><a href="<?php echo site_url('master_data/karyawan') ?>">Karyawan</a></li>
                    <li class="<?php if($this->uri->segment(2) == 'tunjangan' ): echo 'active'; endif; ?>"><a href="<?php echo site_url('master_data/tunjangan') ?>">Tunjangan</a></li>
                    <li class="<?php if($this->uri->segment(2) == 'potongan' ): echo 'active'; endif; ?>"><a href="">Potongan</a></li>
                </ul>
            </li>

            <?php endif; ?>
            <?php if( $this->session->userdata('level') == '2' ): ?>
                <li <?php if( $this->uri->segment(1) == 'bonus' ): echo 'class="active"'; endif; ?>>
                    <a href=""><i class="fa fa-diamond"></i> <span class="nav-label">Bonus</span> <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li class="<?php if( $this->uri->segment(1) == 'bonus' ): echo 'class="active"'; endif; ?>">
                            <a href="<?php echo site_url('bonus') ?>">Hitung</a>
                        </li>
                        <li>
                            <a href="<?php echo site_url('bonus/daftar') ?>">Daftar</a>
                        </li>
                    </ul>
                </li>

                <li <?php echo in_array( $this->uri->segment(2), array('index','daftar')) ? 'active' : ''; ?>>
                    <a href="<?php echo site_url('gaji/index') ?>"><i class="fa fa-money"></i> 
                        <span class="nav-label">Gaji</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="<?php echo site_url('gaji/daftar') ?>">Daftar</a>
                        </li>
                    </ul>
                </li>

            <?php endif; ?>
        </ul>
    </div>
</nav>