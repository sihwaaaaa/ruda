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
        <div id="content" style="margin: 10px 160px ; min-height: 800px;">
          
          <div class="container-fluid">
           <div class="d-flex justify-content-center" style="margin-top: 50px;">
           <div class="d-flex align-items-center justify-content-between" style=" width: 1000px;border-bottom: 1px solid #ddd;">

             <h4 class="p-3" style="color: black;">' <span style="color: #fbc91b;">${keyword}</span> ' 의 검색결과</h4>
            <select class="form-control" style="width:120px;height:40px;" id="sortOrder">
              <option value="latest">최신순</option>
              <option value="oldest">오래된순</option>
            </select>
            </div>
           </div>
           <!-- 없을경우 -->
           <c:if test="${empty diaryList}">
            <div class="mt-5">
              <div class="d-flex justify-content-center">
                <div
                  class="card border-bottom-warning shadow h-100 d-flex align-items-center"
                  style="width: 800px"
                >
                  <div class="card-body px-5" style="width: 850px">
                    <div class="d-flex justify-content-center mt-4">
                      <h2
                        style="
                        padding: 0px 30px;
                          font-size: 20px;
                          font-weight: 600;
                          color: #fbc91b;
                        "
                      >
                      다이어리가 없어요 😦
                    <br>
                  
                      </h2>
                   
                    </div>
                  
                    
                  </div>
                </div>
              </div>
            </div>
           </c:if>
           <!-- 없을경우 -->
           <c:forEach items="${diaryList}" var="diary">
           <!-- 카드한개 -->
            <div class="diary-card mt-5" style="cursor: pointer;">
              <input type="hidden" value="${diary.diaryNo}"class="diaryNo-input">
              <div class="d-flex justify-content-center">
                <div
                  class="card border-bottom-warning shadow h-100 d-flex align-items-center"
                  style="width: 800px"
                >
                  <div class="card-body px-5" style="width: 850px">
                    <div class="d-flex justify-content-between mt-4">
                      <h2
                        style="
                        padding: 0px 30px;
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
                      <div
                      class="mt-3 d-flex justify-content-end"
                      id="readIcon"
                      style="padding: 0px 30px;"
                    >
                      <c:choose>
                        <c:when test="${diary.weather == 'cloud'}">
                          <i class="fas fa-cloud fa-2x mx-2"></i>
                        </c:when>
                        <c:when test="${diary.weather == 'sun'}">
                          <i class="fas fa-sun fa-2x mx-2"></i>
                        </c:when>
                        <c:when test="${diary.weather == 'rain'}">
                          <i class="fas fa-cloud-rain fa-2x mx-2"></i>
                        </c:when>
                        <c:when test="${diary.weather == 'snow'}">
                          <i class="fas fa-snowflake fa-2x mx-2"></i>
                        </c:when>
                        <c:when test="${diary.weather == 'bolt'}">
                          <i class="fas fa-bolt fa-2x mx-2"></i>
                        </c:when>
                        <c:when test="${diary.weather == 'wind'}">
                          <i class="fas fa-wind fa-2x mx-2"></i>
                        </c:when>
                      </c:choose>
                      <c:choose>
                        <c:when test="${diary.emotion == 'smile'}">
                          <i class="far fa-laugh fa-2x mx-2"></i>
                        </c:when>
                        <c:when test="${diary.emotion == 'laugh'}">
                          <i class="far fa-laugh-squint fa-2x mx-2"></i>
                        </c:when>
                        <c:when test="${diary.emotion == 'boring'}">
                          <i class="far fa-meh fa-2x mx-2"></i>
                        </c:when>
                        <c:when test="${diary.emotion == 'tired'}">
                          <i class="far fa-dizzy fa-2x mx-2"></i>
                        </c:when>
                        <c:when test="${diary.emotion == 'angry'}">
                          <i class="far fa-angry fa-2x mx-2"></i>
                        </c:when>
                        <c:when test="${diary.emotion == 'sad'}">
                          <i class="far fa-sad-tear fa-2x mx-2"></i>
                        </c:when>
                      </c:choose>
                    </div>
                    </div>
                    <div class="no-gutters align-items-center">
                      <div class=" mr-2">
                      
                        <div class=" px-3">
                        
                            <div class="m-3" style="font-weight: 900; color: black;">${diary.keyword}</div>
                      
                        </div>
                      </div>
                    </div>
                    
                  </div>
                </div>
              </div>
            </div>
           <!-- 카드한개 -->
          </c:forEach>
          <%-- 페이징 처리 --%>
          <div class="d-flex justify-content-center my-5">
              <%-- 이전 페이지 --%>
              <c:if test="${currentPage > 1}">
                  <a style="font-size: 22px; padding: 5px 10px;" href="?q=${keyword}&page=${currentPage - 1}&size=${pageSize}">Previous</a>
              </c:if>
      
              <%-- 페이지 번호 --%>
              <c:forEach var="pageNumber" begin="1" end="${totalPages}">
                  <c:if test="${pageNumber eq currentPage}">
                      <strong style="font-size: 22px; padding: 5px 10px;">${pageNumber}</strong>
                  </c:if>
                  <c:if test="${pageNumber ne currentPage}">
                      <a style="font-size: 22px; padding: 5px 10px;" href="?q=${keyword}&page=${pageNumber}&size=${pageSize}">${pageNumber}</a>
                  </c:if>
              </c:forEach>
      
              <%-- 다음 페이지 --%>
              <c:if test="${currentPage < totalPages}">
                  <a style="font-size: 22px; padding: 5px 10px;" href="?q=${keyword}&page=${currentPage + 1}&size=${pageSize}">Next</a>
              </c:if>
          </div>
          </div>
        </div>
        <!-- End of Main Content -->
        <script src="../../../resources/js/ckeditor.js"></script>
        <script>
          ClassicEditor.create(document.querySelector("#editor"), {});
            // 정렬 순서가 변경될 때마다 페이지를 새로고침하여 정렬된 결과를 보여줌
            
    document.getElementById("sortOrder").addEventListener("change", function () {
        var sortOrder = document.getElementById("sortOrder").value;
        var currentUrl = new URL(window.location.href);
        currentUrl.searchParams.set("sortOrder", sortOrder);
        window.location.href = currentUrl.toString();
    });

        </script>
    
        <jsp:include page="../includes/footer.jsp"/>

<script>
    $(document).ready(function () {
        // .diary-card 클래스를 가진 요소에 클릭 이벤트 등록
        $(".diary-card").on("click", function () {
            // 클릭된 카드 내의 .diaryNo-input 클래스를 가진 input 요소의 값을 가져와서 diaryNo에 저장
            var diaryNo = $(this).find(".diaryNo-input").val();

            // diaryNo 값을 사용하여 이동할 URL 생성
            var url = "/diary/${token}/" + diaryNo;

            // 생성한 URL로 이동
            window.location.href = url;
        });
    });
</script>
    
  </body>
</html>
