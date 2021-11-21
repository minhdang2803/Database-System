        <!-- Start header -->
        <div id="header">
            <!-- Begin: Navbar -->
            <ul id="nav">
                <li>
                    <a href="index.php?page=home" class="navbar">Home</a>
                </li>
                <?php if (!isset($_SESSION['username'])) { ?>
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
                        <a href="index.php?page=aao" class="navbar">AAO</a>
                    </li>
                    <li>
                        <a href="index.php?page=faculty" class="navbar">Faculty</a>
                    </li>
                    <li>
                        <a href="index.php?page=student" class="navbar">Student</a>
                    </li>
                    <li>
                        <a href="index.php?page=lecturer" class="navbar">Lecturer</a>
                    </li>
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