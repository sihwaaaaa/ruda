<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
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
            <form class="mt-5" method="post" id="diaryform">
              <div class="d-flex justify-content-center">
                <div
                  class="card border-bottom-warning shadow h-100 d-flex align-items-center"
                  style="width: 1000px"
                  id="write-card"
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
                          id="weather-group"
                        >
                          <i class="fas fa-sun fa-3x mx-4" id="sun"></i>
                          <i class="fas fa-cloud fa-3x mx-4" id="cloud"></i>
                          <i class="fas fa-cloud-rain fa-3x mx-4" id="rain"></i>
                          <i class="fas fa-snowflake fa-3x mx-4" id="snow"></i>
                          <i class="fas fa-bolt fa-3x mx-4" id="bolt"></i>
                          <i class="fas fa-wind fa-3x mx-4" id="wind"></i>
                        </div>
                        <input
                          type="hidden"
                          name="weather"
                          id="weatherInput"
                          value=""
                        />
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
                          id="emotion-group"
                        >
                          <i class="far fa-laugh fa-3x mx-4" id="smile"></i>
                          <i
                            class="far fa-laugh-squint fa-3x mx-4"
                            id="laugh"
                          ></i>
                          <i class="far fa-meh fa-3x mx-4" id="boring"></i>
                          <i class="far fa-dizzy fa-3x mx-4" id="tired"></i>
                          <i class="far fa-angry fa-3x mx-4" id="angry"></i>
                          <i class="far fa-sad-tear fa-3x mx-4" id="sad"></i>
                        </div>
                        <input
                          type="hidden"
                          name="emotion"
                          id="emotionInput"
                          value=""
                        />
                      </div>
                    </div>

                    <div class="row no-gutters align-items-center mt-5 pt-5">
                      <div class="col-12 mr-2">
                        <div
                          class="text-s font-weight-bold text-uppercase d-flex"
                          style="
                            height: 50px;
                            border-bottom: 1px solid #ccc;
                            color: #666;
                          "
                        >
                          <input
                            class="form-control"
                            style="
                              width: 230px;
                              height: 30px;
                              font-size: 12px;
                              margin: 10px 10px;
                            "
                            type="text"
                            name="keyword"
                            id="keywordInput"
                            placeholder="오늘의 루틴 키워드를 입력해주세요"
                          />
                          <div
                            class="ml-auto mx-aut btn btn-light btn-circle"
                            id="toggleColorGroup"
                          >
                            <i
                              class="fas fa-palette fa-lg"
                              style="color: #4271ff"
                            ></i>
                          </div>
                        </div>

                        <div id="color-group">
                          <c:forEach items="${color}" varStatus="status">
                            <div
                              class="btn btn-sm btn-circle m-2 color-chip"
                              style="background-color: #<c:out value='${color[status.index].colorCode}' />;border:1px solid #ddd;"
                            >
                              <div id="colorNo" style="display: none">
                                <c:out value="${color[status.index].colorNo}" />
                              </div>
                            </div>
                          </c:forEach>

                          <input
                            type="hidden"
                            name="colorNo"
                            id="colorInput"
                            value="11"
                          />
                        </div>
                      </div>
                      <div class="col-12 mt-5 px-5">
                        <textarea name="content" id="editor"></textarea>
                        <div style="float: right" id="counter">(0 / 50)</div>
                      </div>
                    </div>
                    <div
                      id="confirm-text"
                      style="margin: 50px; text-align: center; color: coral"
                    ></div>
                    <div class="my-5 d-flex justify-content-center">
                      <button
                        class="btn btn-secondary mx-5"
                        style="width: 100px"
                      >
                        취소
                      </button>
                      <button
                        id="btn-submit"
                        class="btn btn-warning mx-5"
                        style="width: 100px"
                        type="submit"
                      >
                        작성하기
                      </button>
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
      // CKEditor 인스턴스 생성
      ClassicEditor.create(document.querySelector("#editor"), {})
        .then((editor) => {
          // CKEditor 내용이 변경될 때마다 이벤트 리스너 추가
          editor.model.document.on("change", () => {
            var textContent = stripHtmlTags(editor.getData());
            $("#counter").html("(" + textContent.length + " / 50)");

            if (textContent.length > 50) {
              $("#confirm-text").text("최대 50자까지 입력 가능합니다.");

              // 실제 글자 수가 50자를 초과하면 확인 텍스트만 표시하고 더 이상의 처리를 하지 않음
              return;
            } else {
              $("#confirm-text").text(""); // 제한 내에서 입력이면 확인 텍스트를 지움
            }
          });
        })
        .catch((error) => {
          console.error("CKEditor를 초기화하는 중 오류가 발생했습니다.", error);
        });

      // HTML 태그 제거 함수
      function stripHtmlTags(html) {
        return html.replace(/<[^>]*>/g, "");
      }
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
    <!-- onClick -->
    <script>
      $(function () {
        //유효성 검증
        $("#btn-submit").click(function (event) {
          event.preventDefault();

          //날씨
          var inputWeather = $("#weatherInput").val();
          //감정
          var inputEmotion = $("#emotionInput").val();
          //키워드
          var inputKeyword = $("#keywordInput").val();
          //내용
          var inputContent = $(".ck-content").text(); // .html() 대신 .text() 사용
          console.log(inputContent.length);
          if (inputWeather === "") {
            $("#confirm-text").text("오늘의 날씨를 골라주세요.");
          } else if (inputEmotion === "") {
            $("#confirm-text").text("오늘의 감정을 골라주세요.");
          } else if (inputKeyword === "") {
            $("#confirm-text").text("오늘의 키워드를 작성해주세요.");
          } else if (inputKeyword.length > 8) {
            $("#confirm-text").text("키워드는 8자까지 입력 가능합니다.");
          } else if (inputContent === "") {
            $("#confirm-text").text("오늘의 루틴을 작성해주세요.");
          } else if (inputContent.length > 50) {
            $("#confirm-text").text("최대 50자까지 입력 가능합니다.");
          } else {
            $("#diaryform").submit();
          }
        });

        //날씨선택
        var previousChildWeather = null;
        $("#weather-group").on("click", "i", function () {
          if (previousChildWeather !== null) {
            $(previousChildWeather).css("color", "#757575");
          }
          $(this).css("color", "#fbc91b");

          var clickedId = $(this).attr("id");
          $("#weatherInput").val($(this).attr("id"));
          previousChildWeather = this;
        });
        //감정선택
        var previousChildEmotion = null;
        $("#emotion-group").on("click", "i", function () {
          if (previousChildEmotion !== null) {
            $(previousChildEmotion).css("color", "#757575");
          }
          $(this).css("color", "#fbc91b");

          var clickedId = $(this).attr("id");
          $("#emotionInput").val($(this).attr("id"));
          previousChildEmotion = this;
        });

        // 컬러선택
        var previousChildColor = null;

        $("#color-group").on("click", "div", function () {
          // 이미 선택한 요소를 다시 선택했을 때
          if (previousChildColor === this) {
            resetColorSelection();
            return; // 종료
          }

          // 이전에 선택한 요소의 border를 none으로 설정
          if (previousChildColor) {
            $(previousChildColor).css("border", "1px solid #ddd");
          }

          $(this).css("border", "2px solid #757575");

          var colorNo = $(this).find("#colorNo").text().trim();
          $("#colorInput").val(colorNo);

          // 배경색 변경
          updateBackgroundColor($(this).css("background"));

          previousChildColor = this;
        });

        function resetColorSelection() {
          $(previousChildColor).css("border", "1px solid #ddd");
          $("#colorInput").val(11);

          // 배경색 초기화
          var ckContent = $("body").find(".ck-blurred");
          if (ckContent.length > 0) {
            ckContent.css("background", "white");

            // 포커스 이벤트
            ckContent.on("focus blur", function () {
              ckContent.css("background", "white");
            });
          }

          previousChildColor = null;
        }

        function updateBackgroundColor(color) {
          var ckContent = $("body").find(".ck-blurred");
          if (ckContent.length > 0) {
            ckContent.css("background", color);

            // 포커스 이벤트
            ckContent.on("focus blur", function () {
              ckContent.css("background", color);
            });
          }
        }

        //팔레트 클릭시 토글
        $("#toggleColorGroup").on("click", function () {
          $("#color-group").toggle();
        });
      });
    </script>
  </body>
</html>
