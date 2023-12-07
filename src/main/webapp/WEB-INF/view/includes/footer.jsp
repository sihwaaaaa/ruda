<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
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
      ><form id="alarm-form" action="/alarm" method="post">
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
            
            <div class="modal-body ml-4 my-2 d-flex justify-content-center">
              <input type="time" id="time-input" name="alarmTime"class="form-control" style="width: 300px; height: 60px; cursor: pointer; font-size: 20px;">
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary px-4 py-2" data-dismiss="modal">닫기</button>
              <button type="button" class="btn btn-warning px-4 py-2" onclick="saveTime()">저장</button>
            </div>

          </div>
        </div>
      </form>
      </div>

  
      <!-- Bootstrap core JavaScript-->
      <script src="../../../resources/vendor/jquery/jquery.min.js"></script>
      <script src="../../../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
      <!-- Core plugin JavaScript-->
      <script src="../../../resources/vendor/jquery-easing/jquery.easing.min.js"></script>
  
      <!-- Custom scripts for all pages-->
      <script src="../../../resources/img/jssb-admin-2.min.js"></script>
  
      <!-- Page level plugins -->
      <script src="../../../resources/vendor/chart.js/Chart.min.js"></script>
  
      <!-- Page level custom scripts -->
      <script src="../../../resources/img/jsdemo/chart-area-demo.js"></script>
      <script src="../../../resources/img/jsdemo/chart-pie-demo.js"></script>
      <!-- calendar script -->
  
      <script
        src="../../../resources/vendor/calendar/jquery-ui.custom.min.js"
        type="text/javascript"
      ></script>
      <script
        src="../../../resources/vendor/calendar/fullcalendar.js"
        type="text/javascript"
      ></script>
      <script>
        //알람 시간 설정
          function saveTime() {
  
    var selectedTime = $('#time-input').val();
    console.log('선택된 시간:', selectedTime);

    // 폼을 submit
    //$('#alarm-form').submit();
  }
        $(function () {
        
          //모달
          $("#set-alram").click(function () {
            $("#remove-modal").modal("show");
          });
        });
        $("#search-input").on("keydown", function(event) {
    //검색
    if (event.keyCode === 13) {
        event.preventDefault(); // 폼 제출 방지
        searchFunction();
    }
});

// 클릭 이벤트 함수를 따로 빼서 사용할 수 있도록 수정
function searchFunction() {
    var SearchValue = $("#search-input").val();

    if (SearchValue.length === 0) {
        alert("키워드를 입력해주세요.");
    } else {
        window.location.href = "/diary/${token}/search?q=" + SearchValue;
    }
}

// 검색 버튼 클릭 시 검색 함수 호출
$("#search-button").on("click", function() {
    searchFunction();
});
      </script>
    </body>
  </html>
  