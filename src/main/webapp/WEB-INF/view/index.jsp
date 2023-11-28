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
    <!-- 사용자 정의 스타일 추가 -->
    <style>
      /*달력의 크기 설정*/
      .calendar {
        width: 850px;
        margin: 50px;
        /*margin 통해 브라우저 작아졌을 때 자연스럽게 하기 위해*/
      }
      /*header 부분 설정*/
      .header {
        display: flex;
        /*header안 year-month와 nav 가로 나열*/
        justify-content: space-between;
        align-items: center;
      }

      .year-month {
        font-size: 35px;
      }

      .nav {
        display: flex;
        /*nav 버튼 정렬 위해*/
        border: 1px solid #333333;
        border-radius: 5px;
        /*테두리 그리고 라운딩*/
      }

      .nav-btn {
        width: 28px;
        height: 30px;
        border: none;
        font-size: 16px;
        line-height: 34px;
        background-color: transparent;
        cursor: pointer;
      }

      .go-today {
        width: 75px;
        /*today라는 긴 글자 들어가야함으로 너비 크게*/
        border-left: 1px solid #333333;
        border-right: 1px solid #333333;
      }
      .days {
        display: flex;
        margin: 25px 0 10px;
      }

      .day {
        width: calc(100% / 7);
        text-align: center;
      }

      .dates {
        display: flex;
        flex-flow: row wrap;
        height: 500px;
        border-top: 1px solid #333333;
        border-right: 1px solid #333333;
      }

      .date {
        width: calc(100% / 7);
        padding: 15px;
        text-align: right;
        border-bottom: 1px solid #333333;
        border-left: 1px solid #333333;
      }
      .date h6 {
        margin-top: 15px;
        font-size: 12px;
        color: black;
      }
      .day:nth-child(7n + 1),
      .date:nth-child(7n + 1) {
        color: #d13e3e;
        /*일요일은 빨간색*/
      }

      .day:nth-child(7n),
      .date:nth-child(7n) {
        color: #396ee2;
        /*토요일은 파란색*/
      }
      .other {
        opacity: 0.3;
      }
      .today {
        position: relative;
        font-size: 15px;
        padding: 5px;
        color: #fbc91b;
        background-color: #fff8f3;
        border: 1px dashed #fbc91b;
        border-radius: 20px;
      }

      /* 여기까지 달력 */
    </style>
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
      <div id="content-wrapper" class="d-flex flex-column">
        <!-- Main Content -->
        <div id="content" class="bg-white">
          <!-- Begin Page Content -->
          <div class="container-fluid">
            <div id="wrap" class="d-flex justify-content-center">
              <div class="calendar">
                <div class="header">
                  <div class="year-month"></div>
                  <div class="nav">
                    <button class="nav-btn go-prev" onclick="prevMonth()">
                      &lt;
                    </button>
                    <button class="nav-btn go-today" onclick="goToday()">
                      Today
                    </button>
                    <button class="nav-btn go-next" onclick="nextMonth()">
                      &gt;
                    </button>
                  </div>
                </div>
                <div class="main">
                  <div class="days">
                    <div class="day">일</div>
                    <div class="day">월</div>
                    <div class="day">화</div>
                    <div class="day">수</div>
                    <div class="day">목</div>
                    <div class="day">금</div>
                    <div class="day">토</div>
                  </div>
                  <div class="dates"></div>
                </div>
              </div>
              <!-- calendar -->
              <!--   <div class="card shadow" id="calendar"></div>

              <div style="clear: both"></div>-->
            </div>
          </div>
          <!-- /.container-fluid -->
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
    <!-- calendar script -->

    <!-- <script
      src="../../resources/vendor/calendar/jquery-ui.custom.min.js"
      type="text/javascript"
    ></script>
    <script
      src="../../resources/vendor/calendar/fullcalendar.js"
      type="text/javascript"
    ></script> -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
      // Date 객체 생성
      let date = new Date();
      const prevMonth = () => {
        date.setMonth(date.getMonth() - 1);
        renderCalendar();
      };

      const nextMonth = () => {
        date.setMonth(date.getMonth() + 1);
        renderCalendar();
      };

      const goToday = () => {
        date = new Date();
        renderCalendar();
      };
      const renderCalendar = () => {
        const viewYear = date.getFullYear();
        const viewMonth = date.getMonth();
        const viewMonthViewer = viewMonth + 1;

        // year-month 채우기
        document.querySelector(".year-month").textContent =
          viewYear + `년 ` + viewMonthViewer + `월`;

        // 지난 달 마지막 Date, 이번 달 마지막 Date
        const prevLast = new Date(viewYear, viewMonth, 0);
        const thisLast = new Date(viewYear, viewMonth + 1, 0);

        const PLDate = prevLast.getDate();
        const PLDay = prevLast.getDay();

        const TLDate = thisLast.getDate();
        const TLDay = thisLast.getDay();

        // Dates 기본 배열들
        const prevDates = [];
        const thisDates = [...Array(TLDate + 1).keys()].slice(1);
        const nextDates = [];

        // prevDates 계산
        if (PLDay !== 6) {
          for (let i = 0; i < PLDay + 1; i++) {
            prevDates.unshift(PLDate - i);
          }
        }

        // nextDates 계산
        for (let i = 1; i < 7 - TLDay; i++) {
          nextDates.push(i);
        }

        // Dates 합치기
        const dates = prevDates.concat(thisDates, nextDates);
        // Dates 정리
        const firstDateIndex = dates.indexOf(1);
        const lastDateIndex = dates.lastIndexOf(TLDate);
        dates.forEach((date, i) => {
          const condition =
            i >= firstDateIndex && i < lastDateIndex + 1 ? "this" : "other";
          //컨트롤러에서 list 받아서 작성된 데이터 있을경우 변수로 저장해서 키워드 노출
          dates[i] =
            `<div class="date"><span class="` +
            condition +
            `">` +
            date +
            `</span>` +
            `<h6>여기에 키워드 </h6>` +
            `</div>`;
        });

        // Dates 그리기
        document.querySelector(".dates").innerHTML = dates.join("");
        // 오늘 날짜 그리기
        const today = new Date();
        //오늘 날짜에 맞는 Date 객체 생성
        if (
          viewMonth === today.getMonth() &&
          viewYear === today.getFullYear()
        ) {
          //viewMonth와 viewYear가 today와 동일한지 비교
          for (let date of document.querySelectorAll(".this")) {
            //동일한 경우 this 클래스 가진 태그 다 찾아내고
            if (+date.innerText === today.getDate()) {
              //해당 태그의 문자 값을 숫자로 변경해 오늘 날짜오 비교하고
              date.classList.add("today");
              //today 클래스 부여
              break;
              //today는 한개 뿐이라 더이상 탐색 필요 없으니 탈출
            }
          }
        }
      };

      renderCalendar();
    </script>

    <!-- 달력 템플릿 -->
    <!-- <script>
      $(document).ready(function () {
        var date = new Date();
        var d = date.getDate();
        var m = date.getMonth();
        var y = date.getFullYear();

        /*  className colors
  
      className: default(transparent), important(red), chill(pink), success(green), info(blue)
  
      */

        /* initialize the external events
      -----------------------------------------------------------------*/

        $("#external-events div.external-event").each(function () {
          // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
          // it doesn't need to have a start or end
          var eventObject = {
            title: $.trim($(this).text()), // use the element's text as the event title
          };

          // store the Event Object in the DOM element so we can get to it later
          $(this).data("eventObject", eventObject);

          // make the event draggable using jQuery UI
          $(this).draggable({
            zIndex: 999,
            revert: true, // will cause the event to go back to its
            revertDuration: 0, //  original position after the drag
          });
        });

        /* initialize the calendar
      -----------------------------------------------------------------*/

        var calendar = $("#calendar").fullCalendar({
          header: {
            left: "title",
            right: "prev,next today",
          },
          editable: true,
          firstDay: 1, //  1(Monday) this can be changed to 0(Sunday) for the USA system
          selectable: true,
          defaultView: "month",

          axisFormat: "h:mm",
          columnFormat: {
            month: "ddd", // Mon
            week: "ddd d", // Mon 7
            day: "dddd M/d", // Monday 9/7
            agendaDay: "dddd d",
          },
          titleFormat: {
            month: "yyyy년 MM월", // September 2009
            week: "MMMM yyyy", // September 2009
            day: "MMMM yyyy", // Tuesday, Sep 8, 2009
          },
          allDaySlot: false,
          selectHelper: true,
          select: function (start, end, allDay) {
            var title = prompt("Event Title:");
            if (title) {
              calendar.fullCalendar(
                "renderEvent",
                {
                  title: title,
                  start: start,
                  end: end,
                  allDay: allDay,
                },
                true // make the event "stick"
              );
            }
            calendar.fullCalendar("unselect");
          },
          droppable: true, // this allows things to be dropped onto the calendar !!!
          drop: function (date, allDay) {
            // this function is called when something is dropped

            // retrieve the dropped element's stored Event Object
            var originalEventObject = $(this).data("eventObject");

            // we need to copy it, so that multiple events don't have a reference to the same object
            var copiedEventObject = $.extend({}, originalEventObject);

            // assign it the date that was reported
            copiedEventObject.start = date;
            copiedEventObject.allDay = allDay;

            // render the event on the calendar
            // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
            $("#calendar").fullCalendar("renderEvent", copiedEventObject, true);

            // is the "remove after drop" checkbox checked?
            if ($("#drop-remove").is(":checked")) {
              // if so, remove the element from the "Draggable Events" list
              $(this).remove();
            }
          },

          events: [
            {
              title: "All Day Event",
              start: new Date(y, m, 1),
            },
            {
              id: 999,
              title: "Repeating Event",
              start: new Date(y, m, d - 3, 16, 0),
              allDay: false,
              className: "info",
            },
            {
              id: 999,
              title: "Repeating Event",
              start: new Date(y, m, d + 4, 16, 0),
              allDay: false,
              className: "info",
            },
            {
              title: "Meeting",
              start: new Date(y, m, d, 10, 30),
              allDay: false,
              className: "important",
            },
            {
              title: "Lunch",
              start: new Date(y, m, d, 12, 0),
              end: new Date(y, m, d, 14, 0),
              allDay: false,
              className: "important",
            },
            {
              title: "Birthday Party",
              start: new Date(y, m, d + 1, 19, 0),
              end: new Date(y, m, d + 1, 22, 30),
              allDay: false,
            },
            {
              title: "Click for Google",
              start: new Date(y, m, 28),
              end: new Date(y, m, 29),
              url: "http://google.com/",
              className: "success",
            },
          ],
        });
      });
    </script> -->
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
