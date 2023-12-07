<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ko">
  <head>
    <jsp:include page="includes/head.jsp"/>
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
        cursor: pointer;
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
      <jsp:include page="includes/nav.jsp"/>
      <!-- Content Wrapper -->
      <div id="content-wrapper" class="d-flex flex-column">
        <!-- Main Content -->
        <div id="content" class="bg-white">
          <!-- Begin Page Content -->
          <div class="container-fluid">
            <div id="wrap" class="d-flex justify-content-center">
              <div class="calendar">
                <div class="header">
                  <div class="year-month" style="color: black"></div>
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

        <jsp:include page="includes/footer.jsp"/>
    <script>
      $(document).ready(function () {

        diaryList = ${diaryList};
console.log(diaryList);

$(".dates").on("click", ".date", function () {
    // 이전에 적용한 스타일 초기화
    $(".dates .date").css("background-color", "");
    $(this).css("background-color", "#fbc91b");

    var dateText = $(this).children("span").text();
    var yearMonthText;

    if ($(this).children("span").hasClass("other")) {
        yearMonthText = $(".year-month")
            .text()
            .replace(/(\d+)월/, function (match, p1) {
                var adjustedMonth =
                    parseInt(p1, 10) + (parseInt(dateText, 10) >= 15 ? -1 : 1);
                return adjustedMonth + "월";
            });
    } else {
        yearMonthText = $(".year-month").text();
    }

    var yearMonth = yearMonthText.match(/\d+/g);
    var dateString = yearMonth[0] + "-" + yearMonth[1] + "-" + dateText;
    console.log(dateString);

    // 'yyyy-mm-dd' 형식의 문자열 날짜
    var dateArray = dateString.split('-');
    var yyyy = parseInt(dateArray[0], 10);
    var mm = parseInt(dateArray[1], 10) - 1; // 월은 0부터 시작하므로 1을 빼줍니다.
    var dd = parseInt(dateArray[2], 10);

    var stringDate = new Date(yyyy, mm, dd);
    
    var foundDiary = false;

    diaryList.forEach(element => {
        var timestampDate = new Date(element.ownerDate);
        timestampDate.setHours(0, 0, 0, 0);

        if (timestampDate.getTime() === stringDate.getTime()) {
            // 해당 날짜의 루틴이 있을 경우 처리
            $("#keyword-content").html(`<h6 class="mb-3">` + element.keyword + `</h6><div><a href="/diary/${token}/` + element.diaryNo + `">루틴 보러가기➜</a></div>`);
            foundDiary = true;
        }
    });

    if (!foundDiary) {
        let now = new Date();
        now.setHours(0, 0, 0, 0);

        if (stringDate.getTime() === now.getTime() || stringDate.getTime() === now.getTime() - 24 * 60 * 60 * 1000) {
            // 선택한 날짜가 오늘이거나 어제인 경우 처리
            $("#keyword-content").html(`<h6 class='mb-3'>작성된 루틴이 없어요😞</h6><div><a href='/diary/${token}/write/` + stringDate.getTime() + `'>루틴 작성하러 가기➜</a></div>`);
        } else {
            // 그 외의 경우 처리
            $("#keyword-content").html("<h6 class='mb-3'>작성된 루틴이 없어요😞</h6>");
        }
    }
});

          // Date 객체 생성
          let date = new Date();

          window.prevMonth = () => {
              date.setMonth(date.getMonth() - 1);
              renderCalendar();
          };

          window.nextMonth = () => {
              date.setMonth(date.getMonth() + 1);
              renderCalendar();
          };

          window.goToday = () => {
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

                  dates[i] =
                      `<div class="date"><span class="` +
                      condition +
                      `">` +
                      date +
                      `</span>` +
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
      });
    </script>
  </body>
</html>
