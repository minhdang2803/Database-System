        <!-- Start header -->
        <div id="header" style="height: 46px; background-color: black; position: fixed; top: 0; left: 0; right: 0; z-index: 1;">
            <!-- Begin: Navbar -->
            <ul id="nav">
                <li>
                    <a href="index.php?page=home" class="navbar">Home</a>
                </li>
                <li>
                    <a href="#" class="navbar">Band</a>

                </li>
                <li>
                    <a href="#" class="navbar">Tour</a>

                </li>
                <!-- <li>
                    <a href="index.php?page=login" class="navbar">Login</a>
                </li>
                <li>
                    <a href="index.php?page=register" class="navbar">Register</a>
                </li> -->
                <li>
                    <a href="index.php?page=product" class="navbar">
                        Products
                        <i class="nav-arrow-down ti-angle-down"></i>
                    </a>
                    <!-- Begin: Subnav -->
                    <ul class="subnav">
                        <li>
                            <a href="index.php?page=pencil">Pencil</a>
                        </li>
                        <li>
                            <a href="index.php?page=pen">Pen</a>
                        </li>
                        <li>
                            <a href="index.php?page=marker">Marker</a>
                        </li>
                    </ul>
                    <!-- End: Subnav -->
                </li>
                <?php if(!isset($_SESSION['username'])) { ?>
                <li>
                    <a href="index.php?page=login" class="navbar">
                        Login
                        <i class="nav-arrow-down ti-angle-down"></i>
                    </a>
                    <!-- Begin: Subnav -->
                    <ul class="subnav">
                        <li>
                            <a href="index.php?page=register">Register</a>
                        </li>
                    </ul>
                    <!-- End: Subnav -->
                </li>
                <?php } else { ?>
                <li>
                    <a href="" class="navbar">
                        <?php echo $_SESSION['username']; ?>
                        <i class="nav-arrow-down ti-angle-down"></i>
                    </a>
                    <!-- Begin: Subnav -->
                    <ul class="subnav">
                        <li>
                            <a href="index.php?page=logout">Logout</a>
                        </li>
                    </ul>
                    <!-- End: Subnav -->
                </li>
                <?php } ?>
            </ul>
            <!-- End: Navbar -->
            <!-- Begin: Search Button -->
            <div class="search-btn">
                <a href="index.php?page=search"><i class="search-icon ti-search"></i></a>
            </div>
            <!-- End: Search Button -->
        </div>
        <!-- end header -->