<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <jsp:include page="../includes/head.jsp"/>
  </head>

  <body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
      <jsp:include page="../includes/nav.jsp"/>
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
                        <span style="color: #fbc91b"
                          ><fmt:formatDate
                            value="${diary.ownerDate}"
                            pattern="yyyy년 MM월 dd일"
                        /></span>
                        의 다이어리
                      </h2>
                    </div>
                    <div class="row no-gutters align-items-center mt-5">
                      <div class="col mr-2">
                        <div
                          class="text-s font-weight-bold text-uppercase d-flex justify-content-around"
                          style="
                            height: 50px;

                            color: #666;
                          "
                        >
                          <h6 class="py-3">날씨</h6>
                          <h6 class="py-3">감정</h6>
                        </div>
                        <div
                          class="mt-3 d-flex justify-content-around"
                          id="readIcon"
                        >
                          <c:choose>
                            <c:when test="${diary.weather == 'cloud'}">
                              <i class="fas fa-cloud fa-3x mx-4"></i>
                            </c:when>
                            <c:when test="${diary.weather == 'sun'}">
                              <i class="fas fa-sun fa-3x mx-4"></i>
                            </c:when>
                            <c:when test="${diary.weather == 'rain'}">
                              <i class="fas fa-cloud-rain fa-3x mx-4"></i>
                            </c:when>
                            <c:when test="${diary.weather == 'snow'}">
                              <i class="fas fa-snowflake fa-3x mx-4"></i>
                            </c:when>
                            <c:when test="${diary.weather == 'bolt'}">
                              <i class="fas fa-bolt fa-3x mx-4"></i>
                            </c:when>
                            <c:when test="${diary.weather == 'wind'}">
                              <i class="fas fa-wind fa-3x mx-4"></i>
                            </c:when>
                          </c:choose>
                          <c:choose>
                            <c:when test="${diary.emotion == 'smile'}">
                              <i class="far fa-laugh fa-3x mx-4"></i>
                            </c:when>
                            <c:when test="${diary.emotion == 'laugh'}">
                              <i class="far fa-laugh-squint fa-3x mx-4"></i>
                            </c:when>
                            <c:when test="${diary.emotion == 'boring'}">
                              <i class="far fa-meh fa-3x mx-4"></i>
                            </c:when>
                            <c:when test="${diary.emotion == 'tired'}">
                              <i class="far fa-dizzy fa-3x mx-4"></i>
                            </c:when>
                            <c:when test="${diary.emotion == 'angry'}">
                              <i class="far fa-angry fa-3x mx-4"></i>
                            </c:when>
                            <c:when test="${diary.emotion == 'sad'}">
                              <i class="far fa-sad-tear fa-3x mx-4"></i>
                            </c:when>
                          </c:choose>
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
                          <h6 class="my-3">${diary.keyword}</h6>
                        </div>
                        <div class="mt-5 px-5">
                          <div
                            class="border px-3"
                            style="min-height: 200px; background-color: #${color};"
                          >
                            <div class="m-3">${diary.content}</div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="my-5 d-flex justify-content-center">
                      <a href="/diary/${token}">
                        <div
                          class="btn btn-secondary mx-5"
                          style="width: 100px"
                        >
                          메인으로
                        </div>
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>
        <!-- End of Main Content -->
        <script src="../../../resources/js/ckeditor.js"></script>
        <script>
          ClassicEditor.create(document.querySelector("#editor"), {});
        </script>
    
        <jsp:include page="../includes/footer.jsp"/>


    
  </body>
</html>
