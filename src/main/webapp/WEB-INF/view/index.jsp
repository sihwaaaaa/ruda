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
        class="navbar-nav bg-white sidebar sidebar-dark accordion"
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
          <div class=" m-4" style="height: 250px;">
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
            <a href="/">
              <div
                style="
                  width: 100px;
                  height: 40px;
                  border-radius: 30px;
                  border: 1px solid #fbc91b;
                  box-shadow: 1px 1px rgba(0, 0, 0, 0.2);
                "
                class="bg-light d-flex align-items-center justify-content-center"
              >
                <i class="fas fa-cog"></i>
                <span class="pl-3">설정</span>
              </div>
            </a>
          </div>
        </div>
      </ul>
      <!-- End of Sidebar -->

      <!-- Content Wrapper -->
      <div id="content-wrapper" class="d-flex flex-column">
        <!-- Main Content -->
        <div id="content">
          <!-- Begin Page Content -->
          <div class="container-fluid">
            <!-- calendar -->
            <div id="wrap">
              <div class="card shadow" id="calendar"></div>

              <div style="clear: both"></div>
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

    <!-- Logout Modal-->
    <div
      class="modal fade"
      id="logoutModal"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button
              class="close"
              type="button"
              data-dismiss="modal"
              aria-label="Close"
            >
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">
            Select "Logout" below if you are ready to end your current session.
          </div>
          <div class="modal-footer">
            <button
              class="btn btn-secondary"
              type="button"
              data-dismiss="modal"
            >
              Cancel
            </button>
            <a class="btn btn-primary" href="login.html">Logout</a>
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
    <script
      src="../../resources/vendor/calendar/jquery-1.10.2.js"
      type="text/javascript"
    ></script>
    <script
      src="../../resources/vendor/calendar/jquery-ui.custom.min.js"
      type="text/javascript"
    ></script>
    <script
      src="../../resources/vendor/calendar/fullcalendar.js"
      type="text/javascript"
    ></script>

    <script>
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
    </script>
  </body>
</html>
