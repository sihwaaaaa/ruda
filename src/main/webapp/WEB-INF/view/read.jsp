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

  <body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
      <!-- Sidebar -->
      <ul
        class="navbar-nav sidebar sidebar-dark accordion"
        style="box-shadow: 1px 1px 3px 1px rgb(0 0 0 / 8%); z-index: 999"
        id="accordionSidebar"
      >
        <!-- Sidebar - Brand -->
        <a
          class="sidebar-brand d-flex align-items-center justify-content-center m-3"
          style="height: 8.375rem; padding: 0"
          href="/"
        >
          <img
            class="img-fluid"
            style="max-width: 70%; margin: 20px 0"
            src="../../resources/ruda_img/logo.png"
          />
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0" />
        <!-- Topbar Search -->
        <form
          class="d-none d-sm-inline-block form-inline mx-5 my-5 mw-100 navbar-search"
        >
          <div
            class="input-group"
            style="box-shadow: 1px 1px rgba(0, 0, 0, 0.2); border-radius: 6px"
          >
            <input
              type="text"
              class="form-control bg-light border-0 small"
              placeholder="Search for..."
              aria-label="Search"
              aria-describedby="basic-addon2"
            />
            <div class="input-group-append">
              <button
                class="btn"
                style="background-color: #fbc91b; border-color: #fbc91b"
                type="button"
              >
                <i class="fas fa-search fa-sm" style="color: #fff"></i>
              </button>
            </div>
          </div>
        </form>

        <!-- Content Row -->
        <div class="">
          <!-- Pending Requests Card Example -->
          <div class="m-4" style="height: 250px">
            <div class="card border-left-warning shadow h-100 py-2">
              <div class="card-body">
                <h4 class="small font-weight-bold">
                  Customer Database <span class="float-right">60%</span>
                </h4>
                <div class="progress mb-4">
                  <div
                    class="progress-bar"
                    role="progressbar"
                    style="width: 60%"
                    aria-valuenow="60"
                    aria-valuemin="0"
                    aria-valuemax="100"
                  ></div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- Sidebar Toggler (Sidebar) -->
        <div class="-none d-md-inline mt-auto" style="margin-bottom: 120px">
          <div class="d-flex justify-content-center">
            <div
              id="set-alram"
              style="
                width: 120px;
                height: 40px;
                border-radius: 30px;
                border: 1px solid #fbc91b;
                box-shadow: 1px 1px rgba(0, 0, 0, 0.2);
                color: #555;
              "
              class="bg-light d-flex align-items-center justify-content-center btn"
            >
              <i class="fas fa-cog"></i>
              <span class="pl-3">알람설정</span>
            </div>
          </div>
        </div>
      </ul>
      <!-- End of Sidebar -->

      <!-- Content Wrapper -->
      <div id="content-wrapper" class="d-flex flex-column bg-white">
        <!-- Main Content -->
        <div id="content" style="margin: 10px 160px">
          <div class="container-fluid">
            <form class="mt-5">
              <div class="d-flex justify-content-center">
                <div
                  class="card border-bottom-warning shadow h-100 d-flex align-items-center"
                  style="width: 1000px"
                >
                  <div class="card-body p-5" style="width: 850px">
                    <div class="d-flex justify-content-center mt-4">
                      <h2
                        style="
                          width: 1000px;
                          font-size: 20px;
                          font-weight: 600;
                          color: #444;
                        "
                      >
                        <span style="color: #fbc91b">루</span>틴
                        <span style="color: #fbc91b"> 다</span>이어리 작성하기
                      </h2>
                    </div>
                    <div class="row no-gutters align-items-center mt-5">
                      <div class="col mr-2">
                        <div
                          class="text-s font-weight-bold text-uppercase"
                          style="
                            height: 50px;
                            border-bottom: 1px solid #ccc;
                            color: #666;
                          "
                        >
                          <h6 class="py-3">날씨</h6>
                        </div>
                        <div
                          class="mt-5 d-flex justify-content-center px-5 write-button"
                        >
                          <i class="fas fa-sun fa-3x mx-4"></i>
                          <i class="fas fa-cloud fa-3x mx-4"></i>
                          <i class="fas fa-cloud-rain fa-3x mx-4"></i>
                          <i class="fas fa-snowflake fa-3x mx-4"></i>
                          <i class="fas fa-bolt fa-3x mx-4"></i>
                          <i class="fas fa-wind fa-3x mx-4"></i>
                        </div>
                      </div>
                    </div>
                    <div class="row no-gutters align-items-center mt-5">
                      <div class="col mr-2">
                        <div
                          class="text-s font-weight-bold text-uppercase"
                          style="
                            height: 50px;
                            border-bottom: 1px solid #ccc;
                            color: #666;
                          "
                        >
                          <h6 class="py-3">감정</h6>
                        </div>
                        <div
                          class="mt-5 d-flex justify-content-center px-5 write-button"
                        >
                          <i class="far fa-laugh fa-3x mx-4"></i>
                          <i class="far fa-laugh-squint fa-3x mx-4"></i>
                          <i class="far fa-meh fa-3x mx-4"></i>
                          <i class="far fa-dizzy fa-3x mx-4"></i>
                          <i class="far fa-angry fa-3x mx-4"></i>
                          <i class="far fa-sad-tear fa-3x mx-4"></i>
                        </div>
                      </div>
                    </div>

                    <div class="row no-gutters align-items-center mt-5">
                      <div class="col mr-2">
                        <div
                          class="text-s font-weight-bold text-uppercase d-flex"
                          style="
                            height: 50px;
                            border-bottom: 1px solid #ccc;
                            color: #666;
                          "
                        >
                          <h6 class="my-3">루틴 키워드</h6>
                        </div>
                        <div class="mt-5 px-5">
                          <div class="border px-3" style="min-height: 200px">
                            <p></p>
                            <p>배때기가 귀여운 고양이팝니다</p>
                            <p>&nbsp;</p>
                            <p></p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="my-5 d-flex justify-content-center">
                      <div class="btn btn-secondary mx-5" style="width: 100px">
                        뒤로
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
          <div class="container my-auto">
            <div class="copyright text-center my-auto">
              <span>Copyright &copy; Ruda 2023</span>
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

    <!-- remove Modal -->
    <div
      class="modal fade"
      id="remove-modal"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalLongTitle"
      aria-hidden="true"
    >
      <div
        class="modal-dialog"
        style="margin-top: 300px; min-height: 300px; min-width: 600px"
        role="document"
      >
        <div class="modal-content">
          <div class="modal-header">
            <h3 class="modal-title ml-4 my-2" id="exampleModalLongTitle">
              알람 시간 변경
            </h3>
            <button
              type="button"
              class="close"
              data-dismiss="modal"
              aria-label="Close"
            >
              <span aria-hidden="true">&times;</span>
            </button>
          </div>

          <div class="modal-body ml-4 my-2">
            <h4>이제 여기에 시간 설정</h4>
          </div>

          <div class="modal-footer">
            <div
              type="button"
              class="btn btn-secondary px-4 py-2"
              data-dismiss="modal"
            >
              닫기
            </div>
          </div>
        </div>
      </div>
    </div>

    <script src="../../resources/js/ckeditor.js"></script>
    <script>
      ClassicEditor.create(document.querySelector("#editor"), {});
    </script>

    <!-- Bootstrap core JavaScript-->
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
    <!-- calendar script -->

    <script
      src="../../resources/vendor/calendar/jquery-ui.custom.min.js"
      type="text/javascript"
    ></script>
    <script
      src="../../resources/vendor/calendar/fullcalendar.js"
      type="text/javascript"
    ></script>
    <!-- 알람 모달 -->
    <script>
      $(function () {
        $("#set-alram").click(function () {
          $("#remove-modal").modal("show");
        });
      });
    </script>
  </body>
</html>
