
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Sistem Informasi Persediaan Kecamatan Astana Anyar </title>

    <!-- Custom fonts for this template -->
    <link href={{ asset('template/vendor/fontawesome-free/css/all.min.css') }} rel="stylesheet" type="text/css">
    <link
        href={{ asset('template/https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i') }}
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href={{ asset('template/css/sb-admin-2.min.css') }} rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href={{ asset('template/vendor/datatables/dataTables.bootstrap4.min.css') }} rel="stylesheet">
    <link href={{ asset('https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css') }} rel="stylesheet" />
    <link rel="stylesheet" href="{{ asset('css/styles.css') }}">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
            

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                <!--<div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>-->
                <div class="sidebar-brand-text">Persediaan Kec.Astana Anyar <sup></sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
           
            <li class="nav-item">
                @if (auth()->user()->role == 'pengelola_barang')
                    <a class="nav-link" href="{{ url('/dashboard/pengelola') }}">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span>
                    </a>
                @elseif (auth()->user()->role == 'ketua')
                    <a class="nav-link" href="{{ url('/dashboard/ketua') }}">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span>
                    </a>
                @elseif (auth()->user()->role == 'pengguna')
                    <a class="nav-link" href="{{ url('/dashboard/pengguna') }}">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span>
                    </a>
                @elseif (auth()->user()->role == 'kelurahan')
                    <a class="nav-link" href="{{ url('/dashboard/kelurahan') }}">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span>
                    </a>
                @else
                    <a class="nav-link" href="{{ url('/dashboard') }}">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span>
                    </a>
                @endif
            </li>
            
            
            <!-- Divider -->
            @if(Auth::user()->role =='pengelola_barang')
            <hr class="sidebar-divider my-0">
            <li class="nav-item">
                <a class="nav-link" href="{{ url('pengguna') }}">
                    <i class="fas fa-fw fa-users"></i>
                    <span>Kelola Data Pengguna</span></a>
            </li>
            @endif
            <!-- Divider -->

            <!-- Heading -->

            <!-- Nav Item - Pages Collapse Menu -->
            @if(in_array(Auth::user()->role, ['pengelola_barang', 'kelurahan']))
            <hr class="sidebar-divider my-0">
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Kelola Barang</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="{{ url('databarang') }}">Kelola Data Barang</a>
                        <a class="collapse-item" href="{{ url('kartubarang') }}">Kelola Kartu Barang</a>
                        <a class="collapse-item" href="{{ url('barangmasuk') }}">Kelola Barang Masuk</a>
                        <a class="collapse-item" href="{{ url('barangkeluar') }}">Kelola Barang Keluar</a>
                        <a class="collapse-item" href="{{ url('Bukubarang') }}">Kelola Buku Barang</a>
                        <div class="collapse-divider"></div>
                    </div>
                </div>
            </li>
            @endif

            <!-- Divider -->
            @if(in_array(Auth::user()->role, ['pengelola_barang', 'ketua']))
            <hr class="sidebar-divider my-0">
            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="{{ url('Prediksi-Stok') }}">
                    <i class="fas fa-chart-line"></i>
                    <span>Rencana Stok</span></a>
            </li>
            @endif
            <!-- Divider -->
            @if(in_array(Auth::user()->role, ['pengelola_barang', 'kelurahan']))
            <hr class="sidebar-divider my-0">
            <li class="nav-item">
                <a class="nav-link" href="{{ url('cetak-laporan') }}">
                    <i class="fas fa-file-alt"></i>
                    <span>Laporan Rekapitulasi</span></a>
            </li>
            <!-- Divider -->
            @endif

            @if(in_array(Auth::user()->role, ['pengelola_barang', 'ketua']))
            <hr class="sidebar-divider my-0">
            <li class="nav-item">
                <a class="nav-link" href="{{ url('surat') }}">
                    <i class="fas fa-envelope"></i>
                    <span>Surat Inventaris</span></a>
            </li>
            @endif
            <!-- Divider -->
            @if(in_array(Auth::user()->role, ['pengguna']))
            <hr class="sidebar-divider my-0">
            <li class="nav-item">
                <a class="nav-link" href="{{ url('pengajuan') }}">
                    <i class="fas fa-file-upload"></i>
                    <span>Pengajuan Barang</span></a>
            </li>
            @endif
            @if(in_array(Auth::user()->role, ['pengelola_barang']))
            <hr class="sidebar-divider my-0">
            <li class="nav-item">
                <a class="nav-link" href="{{ url('statuspengajuan') }}">
                    <i class="fas fa-file-upload"></i>
                    <span>Pengajuan Barang</span></a>
            </li>
            @endif
            <hr class="sidebar-divider my-0">
            <li class="nav-item">
                <a class="nav-link" href="{{ url('/logout') }}">
                    <i class="fas fa-sign-out-alt"></i>
                    <span>Logout</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <form class="form-inline">
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
                    </form>


                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="{{ url('TTD-Surat') }}" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-tools"></i>
                            </a>
                        </li>
                        <!-- Nav Item - Alerts -->
                        <!--<li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                <!-- Counter - Alerts 
                                <span class="badge badge-danger badge-counter">1+</span>
                            </a>
                            <!-- Dropdown - Alerts
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                    Alerts Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-success">
                                            <i class="fas fa-donate text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 7, 2019</div>
                                        $290.29 has been deposited into your account!
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                            </div>
                        </li>-->

                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i>
                                <!-- Counter - Messages -->
                                @if ($pengajuanDiproses > 0 || $pengajuanDiterima > 0 || $pengajuanDitolak > 0)
                                    <span class="badge badge-danger badge-counter">!</span>
                                @endif
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                 aria-labelledby="messagesDropdown">
                                <h6 class="dropdown-header">
                                    Message Center
                                </h6>
                                @if (Auth::user()->role == 'pengelola_barang' && $pengajuanDiproses > 0)
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="font-weight-bold">
                                            <div class="text-truncate">Ada pengajuan barang yang belum diproses segera buka menu pengajuan.</div>
                                        </div>
                                    </a>
                                @endif
                                @if (Auth::user()->role == 'pengguna')
                                    @if ($pengajuanDiterima > 0)
                                        <a class="dropdown-item d-flex align-items-center" href="#">
                                            <div class="font-weight-bold">
                                                <div class="text-truncate">Pengajuan barang diterima.</div>
                                            </div>
                                        </a>
                                    @endif
                                    @if ($pengajuanDitolak > 0)
                                        <a class="dropdown-item d-flex align-items-center" href="#">
                                            <div class="font-weight-bold">
                                                <div class="text-truncate">Pengajuan barang ditolak.</div>
                                            </div>
                                        </a>
                                    @endif
                                @endif
                                @if ($pengajuanDiproses == 0 && $pengajuanDiterima == 0 && $pengajuanDitolak == 0)
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="font-weight-bold">
                                            <div class="text-truncate">Tidak ada pesan baru.</div>
                                        </div>
                                    </a>
                                @endif
                                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                            </div>
                        </li>
                        

                        <div class="topbar-divider d-none d-sm-block"></div>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    @include('komponen.pesan')
                    @yield('content')


                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; 2024</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src={{ asset('template/vendor/jquery/jquery.min.js') }}></script>
    <script src={{ asset('template/vendor/bootstrap/js/bootstrap.bundle.min.js') }}></script>

    <!-- Core plugin JavaScript-->
    <script src={{ asset('template/vendor/jquery-easing/jquery.easing.min.js') }}></script>

    <!-- Custom scripts for all pages-->
    <script src={{ asset('template/js/sb-admin-2.min.js') }}></script>

    <!-- Page level plugins -->
    <script src={{ asset('tempate/vendor/datatables/jquery.dataTables.min.js') }}></script>
    <script src={{ asset('tempate/vendor/datatables/dataTables.bootstrap5.min.js') }}></script>

    <!-- Page level custom scripts -->
    <script src={{ asset('tempate/js/demo/datatables-demo.js') }}></script>
    <script scr="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script scr="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libd/jquery/3.6.1/jquery.min.js"
        integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNEfNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
        $('#nama_barang').on('change', function() {
        var nama_barang = $(this).val();
        $.ajax({
            url: '{{ route("autofill") }}',
            method: 'POST',
            data: { nama_barang: nama_barang },
            dataType: 'json',
            success: function(data) {
                $('#id_barang').val(data.id_barang);
            }
        });
    });
    </script>

    <script>
        $(function(){
            $(".datepicker").datepicker();
        });
    </script>
    <script>
        $(document).ready(function() {
         $('#jenis_barang').select2({
            //placeholder:'--Pilih --'
         });
});
    </script>
    <script>
        $(document).ready(function() {
         $('#nama_barang').select2({
            //placeholder:'--Pilih --'
         });
        });
    </script>
    </script>
    <script>
        $(document).ready(function() {
         $('#id_barang').select2({
            //placeholder:'--Pilih --'
         });
        });
    </script>
    <script>
        $(document).ready(function() {
         $('#kode').select2({
            //placeholder:'--Pilih --'
         });
        });
    </script>
    
</body>

</html>