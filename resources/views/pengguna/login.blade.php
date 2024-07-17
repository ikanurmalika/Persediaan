
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Sistem Informasi Inventaris Kecamatan Astana Anyar</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href={{ asset("template/https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" )}}
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href={{ asset('template/css/sb-admin-2.min.css') }} rel="stylesheet">

</head>
<style>
    .header {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-bottom: 20px;
}

.logo {
    width: 80px;
    height: auto;
}
</style>

<body class="bg-gradient-primary">
   
    <div class="container justify-content-center">
        
        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-6 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <table>
                        <tr>
                            <td width="12%" style="text-align: center; padding-left: 40px; background-color: rgb(159, 202, 248);" align="right">
                                <img src="{{ asset('template/img/KotaBandung.png') }}"  alt="Logo Kota Bandung" width="80" height="80">
                            </td>
                            <td width="80%" style="text-align: left; background-color: rgb(159, 202, 248);">
                                <h3 style="margin: 0; font-size: 18px;" class="text-gray-900"><strong><b>Sistem Informasi Persediaan </b></strong></h3>
                                <h3 style="margin: 0; font-size: 18px;" class="text-gray-900"><strong><b>Kecamatan Astanaanyar</b></strong></h3>
                            </td>
                        </tr>
                        </table>
                        <!-- Nested Row within Card Body -->
                        
                        <div class="row justify-content-center">
                            <div class="col-lg-10">
                                <div class="p-2">
                                    <h5 class="h4 text-gray-900 mb-4 text-center"><strong>LOGIN</strong></h5>
                          
                                    @if($errors->any())
                                    <div class="alert-alert-danger">
                                       <ul>
                                            @foreach ($errors->all() as $item)
                                                <li>{{ $item }}</li>
                                            @endforeach
                                        </ul>
                                    </div>
                                    @endif
                                    <form class="user" action="" method="post">
                                        {{ csrf_field() }}

                                        <div class="form-group">
                                            <label for="email" class="form-label">Email</label>
                                            <input type="email" value="{{ old('email') }}" name="email" placeholder="isi email" class="form-control form-control-user ">
                                        </div>
                                        <div class="form-group">
                                            <label for="password" class="form-label">Password</label>
                                            <input type="password" name="password" placeholder="isi password" class="form-control form-control-user">
                                        </div>
                                        <div class="mb-3 d-grid " style="text-align: center; ">
                                            <button name="submit" type="submit"  class="btn btn-primary btn-user btn-block">Login</button>
                                        </div>
                                        
                                    </form>
                                    
                                    <form class="user">
                                    <!--<div  class="mb-3 d-grid " style="text-align: center ">
                                        <a href='{{ url('register') }}' class="btn btn-primary btn-user btn-block">Register</a>
                                    </div></form>-->
                                    <hr>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
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

</body>

</html>