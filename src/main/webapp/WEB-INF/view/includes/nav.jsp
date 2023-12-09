<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"
           uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            href="/diary/${token}"
    >
        <img
                class="img-fluid"
                style="max-width: 70%; margin: 20px 0"
                src="../../../resources/ruda_img/logo.png"
        />
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0"/>

    <!-- Topbar Search -->
    <div class="">
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
                        placeholder="검색 키워드 입력"
                        aria-label="Search"
                        aria-describedby="basic-addon2"
                        id="search-input"
                />
                <div class="input-group-append">
                    <button
                            class="btn"
                            style="background-color: #fbc91b; border-color: #fbc91b"
                            type="button"
                            id="search-button"
                    >
                        <i class="fas fa-search fa-sm" style="color: #fff"></i>
                    </button>
                </div>
            </div>
        </form>
    </div>


    <!-- Content Row -->
    <div class="">
        <!-- Pending Requests Card Example -->
        <div class="m-4" style="height: 120px">
            <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                    <div class="d-flex justify-content-center">
                        <div
                                class="px-3 text-center"
                                id="keyword-content"
                                style="color: black"
                        >
                            오늘의 루틴은 작성하셨나요?
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Logout Button -->
    <div class="-none d-md-inline" style="margin: 5%;">
        <div class="d-flex justify-content-center">
            <span class="pl-3">알림시간: ${alarmTime}</span>
        </div>
    </div>

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="-none d-md-inline" style="margin: 5%;">
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

    <!-- Logout Button -->
    <div class="-none d-md-inline" style="margin: 5%;">
        <div class="d-flex justify-content-center">
            <a href="/logout?token=${token}">
                <img
                        style="height: 20px;"
                        src="../../../resources/img/logout-svgrepo-com.svg"
                />
            </a>
        </div>
    </div>
</ul>
<!-- End of Sidebar -->
