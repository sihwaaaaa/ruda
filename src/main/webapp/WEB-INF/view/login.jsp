<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>루다 - 루틴다이어리</title>
    <!-- calendar css -->
    <link href="../../resources/css/fullcalendar.css" rel="stylesheet" />
    <link href="../../resources/css/calendar.css" rel="stylesheet" />
    <link
      href="../../resources/css/fullcalendar.print.css"
      rel="stylesheet"
      media="print"
    />
    <!-- Custom fonts for this template-->
    <link
      href="../../resources/vendor/fontawesome-free/css/all.min.css"
      rel="stylesheet"
      type="text/css"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
      rel="stylesheet"
    />

    <!-- Custom styles for this template-->
    <link href="../../resources/css/sb-admin-2.min.css" rel="stylesheet" />
  </head>
<body class="bg-white">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9 mt-5 pt-5">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image pr-0">
                                <div style="height: 300px; width: 1px; background-color: #fbc91b; float: right; margin-top: 70px;" ></div>
                            </div>
                            <div class="col-lg-6 pl-0">
                                <div class="p-5 mt-5">
                                    <div class="text-center mb-5 ">
                                        <h1 class="h4" style="color: black;">나만의 <span style="color:  #fbc91b;">루</span>틴 <span style="color:  #fbc91b;">다</span>이어리</h1>
                                        <h1 class="h5 pb-5" style="color: black;">지금부터 시작해봐요!</h1>
                                    </div>
                                    <form class="user pt-5 my-4">
                                      <div style="height: 75px; width: 345px;" >
                                          <jsp:text>${AUTHORIZATION_URI}?client_id=${CLIENT_ID}&redirect_uri=${REDIRECT_URI}&response_type=code</jsp:text>
                                          <a class="kakao" href="${AUTHORIZATION_URI}?client_id=${CLIENT_ID}&redirect_uri=${REDIRECT_URI}&response_type=code">
                                              <img class="img-fluid btn" src="../../resources/ruda_img/kakao_login_large_wide.png">
                                          </a>
                                      </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <script src="../../resources/vendor/jquery/jquery.min.js"></script>
    <script src="../../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../../resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../../resources/img/jssb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="../../resources/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="../../resources/img/jsdemo/chart-area-demo.js"></script>
    <script src="../../resources/img/jsdemo/chart-pie-demo.js"></script>
</body>

</html>