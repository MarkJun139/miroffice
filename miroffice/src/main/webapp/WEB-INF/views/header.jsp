<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="nav navbar navbar-expand-lg navbar-light iq-navbar">
          <div class="container-fluid navbar-inner" >
            <a href="" class="navbar-brand">
                <!--Logo start-->
                <!--logo End-->
                
                <!--Logo start-->
                <div class="logo-main">
                    
                    </div>
                    <div class="logo-mini">
                        
                    </div>
                
                <!--logo End-->
                
                
                
           
                <h4 class="logo-title">미르오피스</h4>
            </a>
            <div class="sidebar-toggle" data-toggle="sidebar" data-active="true">
                <i class="icon">
                 <svg  width="20px" class="icon-20" viewBox="0 0 24 24">
                    <path fill="currentColor" d="M4,11V13H16L10.5,18.5L11.92,19.92L19.84,12L11.92,4.08L10.5,5.5L16,11H4Z" />
                </svg>
                </i>
            </div>
            <!-- <div class="input-group search-input">
              <span class="input-group-text" id="search-input">
                <svg class="icon-18" width="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <circle cx="11.7669" cy="11.7666" r="8.98856" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></circle>
                    <path d="M18.0186 18.4851L21.5426 22" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                </svg>
              </span>
              <input type="search" class="form-control" placeholder="Search...">
            </div>  -->
            <div class="collapse navbar-collapse" id="navbarSupportedContent"> 
              <ul class="mb-2 navbar-nav ms-auto align-items-center navbar-list mb-lg-0">
              
                <li class="nav-item dropdown">
                  <a class="py-0 nav-link d-flex align-items-center" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <!-- <img src="/images/emp_photo/2403002.jpg" alt="User-Profile" class="theme-color-default-img img-fluid avatar avatar-50 avatar-rounded" style="object-fit:cover"> -->
                    <img src="/images<sec:authentication property = "principal.users.empPhoto"/>" alt="User-Profile" class="theme-color-default-img img-fluid avatar avatar-50 avatar-rounded" style="object-fit:cover">
                    <div class="caption ms-3 d-none d-md-block" style="width: 130px;">
                        <h5 class="mb-0 caption-title">
                        <sec:authentication property= "principal.users.empName"/>
                        <sec:authentication property = "principal.users.empRank"/>
						<!-- <sec:authorize access="hasRole('ROLE_USER')">
							He who remains
						</sec:authorize> -->
						</h5>
                        <p class="mb-0 caption-sub-title"><sec:authentication property= "principal.users.empJob"/></p>
                        
                    </div>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="/main/info">내 정보</a></li>
                    <li><a class="dropdown-item" href="/main/check">내 정보 수정하기</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="/logout">로그아웃</a></li>
                  </ul>
                </li>
                
              </ul>
            </div>
          </div>
        </nav>          <!-- Nav Header Component Start -->
        <div class="iq-navbar-header" style="height: 80px;">
              <div class="container-fluid iq-container">
              </div>
          </div>          <!-- Nav Header Component End -->