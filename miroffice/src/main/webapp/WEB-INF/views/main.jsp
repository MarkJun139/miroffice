<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>미르오피스</title>

<!-- Favicon -->
<link rel="icon" href="/images/icons/logo.png" />

<!-- Library / Plugin Css Build -->
<link rel="stylesheet" href="/css/core/libs.min.css" />

<!-- Aos Animation Css -->
<link rel="stylesheet" href="/vendor/aos/dist/aos.css" />

<!-- Hope Ui Design System Css -->
<link rel="stylesheet" href="/css/hope-ui.min.css?v=2.0.0" />

<!-- Custom Css -->
<link rel="stylesheet" href="/css/custom.min.css?v=2.0.0" />

<!-- Dark Css -->
<link rel="stylesheet" href="/css/dark.min.css" />

<!-- Customizer Css -->
<link rel="stylesheet" href="/css/customizer.min.css" />

<!-- RTL Css -->
<link rel="stylesheet" href="/css/rtl.min.css" />


</head>

<body class="  ">

	<!-- loader Start -->

	<!-- loader END -->
	<%@include file="sidebar.jsp"%>
	<main class="main-content">
		<div class="position-relative iq-banner">
			<!--Nav Start-->

			<%@include file="header.jsp"%>
			<!--Nav End -->
		</div>
		<div class="conatiner-fluid content-inner mt-n5 py-0">
			<div class="row">
				<!-- <div class="col-md-12 col-lg-12">
      <div class="row row-cols-1">
         <div class="overflow-hidden d-slider1 ">
            <ul  class="p-0 m-0 mb-2 swiper-wrapper list-inline">
               <li class="swiper-slide card card-slide" data-aos="fade-up" data-aos-delay="700">
                  <div class="card-body">
                     <div class="progress-widget">
                        <div id="circle-progress-01" class="text-center circle-progress-01 circle-progress circle-progress-primary" data-min-value="0" data-max-value="100" data-value="90" data-type="percent">
                           <svg class="card-slie-arrow icon-24" width="24"  viewBox="0 0 24 24">
                              <path fill="currentColor" d="M5,17.59L15.59,7H9V5H19V15H17V8.41L6.41,19L5,17.59Z" />
                           </svg>
                        </div>
                        <div class="progress-detail">
                           <p  class="mb-2">Total Sales</p>
                           <h4 class="counter">$560K</h4>
                        </div>
                     </div>
                  </div>
               </li>
               <li class="swiper-slide card card-slide" data-aos="fade-up" data-aos-delay="800">
                  <div class="card-body">
                     <div class="progress-widget">
                        <div id="circle-progress-02" class="text-center circle-progress-01 circle-progress circle-progress-info" data-min-value="0" data-max-value="100" data-value="80" data-type="percent">
                           <svg class="card-slie-arrow icon-24" width="24" viewBox="0 0 24 24">
                              <path fill="currentColor" d="M19,6.41L17.59,5L7,15.59V9H5V19H15V17H8.41L19,6.41Z" />
                           </svg>
                        </div>
                        <div class="progress-detail">
                           <p  class="mb-2">Total Profit</p>
                           <h4 class="counter">$185K</h4>
                        </div>
                     </div>
                  </div>
               </li>
               <li class="swiper-slide card card-slide" data-aos="fade-up" data-aos-delay="900">
                  <div class="card-body">
                     <div class="progress-widget">
                        <div id="circle-progress-03" class="text-center circle-progress-01 circle-progress circle-progress-primary" data-min-value="0" data-max-value="100" data-value="70" data-type="percent">
                           <svg class="card-slie-arrow icon-24" width="24" viewBox="0 0 24 24">
                              <path fill="currentColor" d="M19,6.41L17.59,5L7,15.59V9H5V19H15V17H8.41L19,6.41Z" />
                           </svg>
                        </div>
                        <div class="progress-detail">
                           <p  class="mb-2">Total Cost</p>
                           <h4 class="counter">$375K</h4>
                        </div>
                     </div>
                  </div>
               </li>
               <li class="swiper-slide card card-slide" data-aos="fade-up" data-aos-delay="1000">
                  <div class="card-body">
                     <div class="progress-widget">
                        <div id="circle-progress-04" class="text-center circle-progress-01 circle-progress circle-progress-info" data-min-value="0" data-max-value="100" data-value="60" data-type="percent">
                           <svg class="card-slie-arrow icon-24" width="24px"  viewBox="0 0 24 24">
                              <path fill="currentColor" d="M5,17.59L15.59,7H9V5H19V15H17V8.41L6.41,19L5,17.59Z" />
                           </svg>
                        </div>
                        <div class="progress-detail">
                           <p  class="mb-2">Revenue</p>
                           <h4 class="counter">$742K</h4>
                        </div>
                     </div>
                  </div>
               </li>
               <li class="swiper-slide card card-slide" data-aos="fade-up" data-aos-delay="1100">
                  <div class="card-body">
                     <div class="progress-widget">
                        <div id="circle-progress-05" class="text-center circle-progress-01 circle-progress circle-progress-primary" data-min-value="0" data-max-value="100" data-value="50" data-type="percent">
                           <svg class="card-slie-arrow icon-24" width="24px"  viewBox="0 0 24 24">
                              <path fill="currentColor" d="M5,17.59L15.59,7H9V5H19V15H17V8.41L6.41,19L5,17.59Z" />
                           </svg>
                        </div>
                        <div class="progress-detail">
                           <p  class="mb-2">Net Income</p>
                           <h4 class="counter">$150K</h4>
                        </div>
                     </div>
                  </div>
               </li>
               <li class="swiper-slide card card-slide" data-aos="fade-up" data-aos-delay="1200">
                  <div class="card-body">
                     <div class="progress-widget">
                        <div id="circle-progress-06" class="text-center circle-progress-01 circle-progress circle-progress-info" data-min-value="0" data-max-value="100" data-value="40" data-type="percent">
                           <svg class="card-slie-arrow icon-24" width="24" viewBox="0 0 24 24">
                              <path fill="currentColor" d="M19,6.41L17.59,5L7,15.59V9H5V19H15V17H8.41L19,6.41Z" />
                           </svg>
                        </div>
                        <div class="progress-detail">
                           <p  class="mb-2">Today</p>
                           <h4 class="counter">$4600</h4>
                        </div>
                     </div>
                  </div>
               </li>
               <li class="swiper-slide card card-slide" data-aos="fade-up" data-aos-delay="1300">
                  <div class="card-body">
                     <div class="progress-widget">
                        <div id="circle-progress-07" class="text-center circle-progress-01 circle-progress circle-progress-primary" data-min-value="0" data-max-value="100" data-value="30" data-type="percent">
                           <svg class="card-slie-arrow icon-24 " width="24" viewBox="0 0 24 24">
                              <path fill="currentColor" d="M19,6.41L17.59,5L7,15.59V9H5V19H15V17H8.41L19,6.41Z" />
                           </svg>
                        </div>
                        <div class="progress-detail">
                           <p  class="mb-2">Members</p>
                           <h4 class="counter">11.2M</h4>
                        </div>
                     </div>
                  </div>
               </li>
            </ul>
            <div class="swiper-button swiper-button-next"></div>
            <div class="swiper-button swiper-button-prev"></div>
         </div>
      </div>
   </div> -->

				<c:set var="now" value="<%=new java.util.Date()%>" />
				<c:set var="nowDate">
					<fmt:formatDate value="${now}" pattern="yyyy년 MM월 dd일" />
				</c:set>
				<div class="col-md-12 col-lg-7">
					<div class="row">
						<div class="col-md-12 col-xl-12">
							<div class="card" data-aos="fade-up" data-aos-delay="500">
								<div
									class="flex-wrap card-header d-flex justify-content-between">
									<div class="header-title">
										<a href="/main/forum"><h1 class="card-title">우리부서 게시판</h1></a>
									</div>
								</div>
								<div class="p-0 card-body">
									<div class="mt-4 table-responsive">
										<table id="basic-table" class="table mb-0 table-hover"
											role="grid">
											<thead>
												<tr>
													<th>제목</th>
													<th>작성일</th>
													<th>작성자</th>
													<th>조회수</th>
													<th>첨부파일</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${empty forumList}">
													<tr>
														<td colspan="6" class="text-center">
															<h3>등록된 공지사항이 없습니다</h3>
														</td>
													</tr>
												</c:if>
												<c:forEach items="${forumList}" var="forum">
													<tr>
														<td class="col-md-6 align-items-center ">
															${forum.forumTitle}&nbsp; <c:if
																test="${forum.forumNotice == true}">
																<span class="badge badge-info"
																	style="background-color: var(--bs-info)">중요</span>
															</c:if>

														</td>
														<td class="col-md-2 align-items-center "><fmt:formatDate
																var="forumDate" pattern="yyyy-MM-dd"
																value="${forum.forumDate}" /> ${forumDate}</td>
														<td class="col-md-2 align-items-center ">
															${forum.empName}</td>
														<td class="col-md-1 align-items-center text-center">
															${forum.forumCount }</td>
														<td class="col-md-1 align-items-center text-center">
															<c:if test="${not empty forum.forumFiles}">
																<i class="icon"> <svg class="icon-20" width="20"
																		viewBox="0 0 24 24" fill="none"
																		xmlns="http://www.w3.org/2000/svg">
			                                    <path opacity="0.4"
																			d="M16.191 2H7.81C4.77 2 3 3.78 3 6.83V17.16C3 20.26 4.77 22 7.81 22H16.191C19.28 22 21 20.26 21 17.16V6.83C21 3.78 19.28 2 16.191 2Z"
																			fill="currentColor"></path>
			                                    <path fill-rule="evenodd"
																			clip-rule="evenodd"
																			d="M8.07996 6.6499V6.6599C7.64896 6.6599 7.29996 7.0099 7.29996 7.4399C7.29996 7.8699 7.64896 8.2199 8.07996 8.2199H11.069C11.5 8.2199 11.85 7.8699 11.85 7.4289C11.85 6.9999 11.5 6.6499 11.069 6.6499H8.07996ZM15.92 12.7399H8.07996C7.64896 12.7399 7.29996 12.3899 7.29996 11.9599C7.29996 11.5299 7.64896 11.1789 8.07996 11.1789H15.92C16.35 11.1789 16.7 11.5299 16.7 11.9599C16.7 12.3899 16.35 12.7399 15.92 12.7399ZM15.92 17.3099H8.07996C7.77996 17.3499 7.48996 17.1999 7.32996 16.9499C7.16996 16.6899 7.16996 16.3599 7.32996 16.1099C7.48996 15.8499 7.77996 15.7099 8.07996 15.7399H15.92C16.319 15.7799 16.62 16.1199 16.62 16.5299C16.62 16.9289 16.319 17.2699 15.92 17.3099Z"
																			fill="currentColor"></path>


			                                </svg>
																</i>
															</c:if>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12 col-lg-12">
							<div class="overflow-hidden card" data-aos="fade-up"
								data-aos-delay="600">
								<div
									class="flex-wrap card-header d-flex justify-content-between">
									<div class="header-title">
										<a href="/main/projectlist"><h1 class="mb-2 card-title">프로젝트
												관리</h1></a>
										<p class="mb-0">
											
                     </p>            
                  </div>
               </div>
               <div class="p-0 card-body">
                  <div class="mt-3 table-responsive">
                     <table id="basic-table" class="table mb-0 table-hover" role="grid">
                        <thead>
                           <tr>
                              <th>프로젝트 제목</th>
                              <th></th>
                              <th>시작일</th>
                              <th>종료일</th>
                              <!-- <th>남은 날</th> -->
                              <!-- <th>담당자</th> -->
                              <th>프로젝트 진행률</th>
                           </tr>
                        </thead>
                        <tbody>
                        	<c:if test="${empty projectList}">
                        		<tr>
                        			<td colspan="7" class="text-center">
                        				<h3>등록된 프로젝트가 없습니다</h3>
                        			</td>
                        		</tr>
                        	</c:if>
                        	<c:forEach items="${projectList}" var="project" >
	                           <tr onClick="location.href='/main/project/view/${project.projectno}'" style="cursor:pointer">
	                              <td class="col-md-1">
	                                 <div class="d-flex align-items-center">
	                                    <h6>${project.projecttitle}</h6>
	                                 </div> 
	                              </td>
	                              <td>
	                              	<c:choose>
                                    	<c:when test="${project.projectpercent == 100}"> 
                                    		<span class="badge badge-secondary" style="background-color:var(--bs-success)" >완료</span>
                                    	</c:when>
                                    	<c:when test="${project.projectdiffdate < 0}">
                                   			<span class="badge badge-secondary" style="background-color:var(--bs-secondary)" >기한 만료</span>
                                   		</c:when>
                                    	<c:when test="${project.projectpercent < 100}"> 
                                    		<span class="badge badge-secondary" style="background-color:var(--bs-warning)" >진행중</span>
                                    	</c:when>
                                   	</c:choose>
	                              </td>
	                              <td>
	                                 ${project.projectstart}
	                              </td>
	                              <td>
									 ${project.projectend}
								  </td>
								  <%-- <td>

								  	<c:choose>
								  		<c:when test="${project.projectdiffdate >= 1}">
								  			${project.projectdiffdate} 일
								  		</c:when>
								  		<c:when test="${project.projectdiffdate == 0}">
								  			오늘
								  		</c:when>
								  		<c:otherwise>
								  			기한 만료
								  		</c:otherwise>
								  	</c:choose>
								  </td> --%>
														<%-- <td class="col-md-1 align-items-center">
	                           	     ${project.empname }
	                           	  </td> --%>

	                              <td>
	                                 <div class="mb-2 d-flex align-items-center">
	                                    <h6>${project.projectpercent} %</h6>
	                                 </div>
	                                 <div class="shadow-none progress bg-soft-primary w-100" style="height: 4px">
	                                 	<c:if test="${project.projectpercent < 100}">
	                                 		<div class="progress-bar bg-primary" data-toggle="progress-bar" role="progressbar" aria-valuenow="${project.projectpercent}" aria-valuemin="0" aria-valuemax="100"></div>
	                                 	</c:if>
	                                 	<c:if test="${project.projectpercent == 100}">
	                                 		<div class="progress-bar bg-success" data-toggle="progress-bar" role="progressbar" aria-valuenow="${project.projectpercent}" aria-valuemin="0" aria-valuemax="100"></div>
	                                 	</c:if>
	                                 </div>
	                              </td>
	                           </tr>
                           </c:forEach>
                        </tbody>
                     </table>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <div class="col-md-12 col-lg-5">
      <div class="row">
         <div class="col-md-12 col-lg-12">
            <div class="card"  data-aos="fade-up" data-aos-delay="700">
               <div class="card-header align-items-center">
               		<div class="row">
	               	   <div class="col-md-6">
	                   	<h1>근태관리</h1>
	                   </div>
	                   <div class="col-md-6" style="text-align:right">
	                   	<p class="h4">${nowDate}</p>
	                   	<p class="col-12" id="nowClock" style="font-size:15px" >
	                   		<span>현재시간</span>
	                   		<span id="ampm"></span>
	                   		<span id="hour"></span>시
	                   		<span id="minute"></span>분
	                   		<span id="second"></span>초
	                   	</p>	
	                   </div>
                    </div>
               </div>
                
               <div class="card-body">
               	<div class="row">
	              <div class="col-6">
				    <div class="card">
				      <div class="card-body text-center">
				        <h4 class="card-title h2">출근시간</h4>
				        	<c:choose>
				        		<c:when test="${empty startTime}">
				        			<p class="card-text">출근시간 미등록</p>
					        		<div class="grid-cols d-grid gap-card">
					                   <button class="p-2 btn btn-info text-uppercase" onclick="checkTest(event,'출근')">출근 등록
					                   <span class="position-absolute top-0 start-100 translate-middle p-2 bg-danger border border-light rounded-circle">
									    <span class="visually-hidden">New alerts</span>
									  </span>
									  </button>
					                </div>
				        		</c:when>
				        		<c:when test="${not empty startTime}">
				        			<p class="card-text">
				        				${startTime }
					        		</p>
					        		<p></p>
					        		<div class="grid-cols d-grid gap-card">
					                   <button class="p-2 btn btn-success text-uppercase" disabled>출근 등록 완료</button>
					                </div>
				        		</c:when>
				        	</c:choose>
				      </div>
				    </div> 
				  </div>
				  <div class="col-6">
				    <div class="card">
				      <div class="card-body text-center"> 
				        <h4 class="card-title h2">퇴근시간</h4>
				        <c:choose>
				        		<c:when test="${empty startTime}">
				        			<p class="card-text">출근시간 미등록</p>
					        		<div class="grid-cols d-grid gap-card">
					                   <button class="p-2 btn btn-primary text-uppercase" onClick="notStart();">퇴근 등록
					                   <c:if test="${not empty startTime}">
					                   	  <span class="position-absolute top-0 start-100 translate-middle p-2 bg-danger border border-light rounded-circle">
										    <span class="visually-hidden">New alerts</span>
										  </span>
					                   </c:if>
					                   </button>
					                </div>
				        		</c:when>
				        		<c:when test="${empty endTime}">
				        			<p class="card-text">출근시간 미등록</p>
					        		<div class="grid-cols d-grid gap-card">
					                   <button class="p-2 btn btn-primary text-uppercase" onclick="checkTest(event,'퇴근')">퇴근 등록
					                   <c:if test="${not empty startTime}">
					                   	  <span class="position-absolute top-0 start-100 translate-middle p-2 bg-danger border border-light rounded-circle">
										    <span class="visually-hidden">New alerts</span>
										  </span>
					                   </c:if>
					                   </button>
					                </div>
				        		</c:when>
				        		<c:when test="${not empty endTime}">
				        			<p class="card-text">
				        				${endTime}
					        		</p>
					        		<p></p>
					        		<div class="grid-cols d-grid gap-card">
					                   <button class="p-2 btn btn-success text-uppercase" disabled>퇴근 등록 완료</button>
					                </div>
				        		</c:when>
				        	</c:choose>
				      </div>
				    </div>
				  </div>
				  <c:if test="${not empty checkTime  }">
				   <div class="col-12 text-center">
				  	<div class="card">
		                <div class="card-body">
		                    <h4 class="card-title h2">금일 근무시간</h4>
		                    <p class="card-text" style="font-size: 24px; font-weight: bold;">
		                    	${checkTime}
		                    </p>
		                </div>
		            </div>
	               </div>
	               </c:if>
               </div>
            </div>
            <!-- <div class="card" data-aos="fade-up" data-aos-delay="500">

               <div class="text-center card-body d-flex justify-content-around">
                  <div>
                     <h2 class="mb-2">750<small>K</small></h2>
                     <p class="mb-0 text-gray">Website Visitors</p>
                  </div>
                  <hr class="hr-vertial">
                  <div>
                     <h2 class="mb-2">7,500</h2>
                     <p class="mb-0 text-gray">New Customers</p>
                  </div>
               </div>
            </div>  -->
						</div>
						<script>

							window.onload = function() {
								   let hour = document.getElementById("hour");
								   let minute = document.getElementById("minute");
								   let second = document.getElementById("second");
								   let ampm = document.getElementById("ampm");
				   
								   getClock();
								   setInterval(getClock, 1000);
				   
								   function getClock() {
									   const date = new Date();
									   let hours = date.getHours();
									   let pm = false;
				   
									   if (hours > 12) {
										   hours -= 12;
										   pm = true;
									   }
				   
									   hour.innerText = addZero(hours);
									   minute.innerText = addZero(date.getMinutes());
									   second.innerText = addZero(date.getSeconds());
									   ampm.innerText = pm ? "오전" : "오후";
								   }
				   
								   function addZero(num) {
									   if (num < 10) {
										   return "0" + num;
									   }
									   return num;
								   }
							   }
				   				function notStart(){
				   					alert("출근 등록을 먼저 해주세요");
				   				}
				   				function checkTest(e,a) {
				   					const today = new Date();
				   				    const year = today.getFullYear();
				   				    const month = today.getMonth() + 1;
				   				    const day = today.getDate();
				   				    
				   				    const conf = year + "년" + (month < 10 ? '0' + month : month) +"월"+ (day < 10 ? '0' + day : day) + "일";
				   				    
				   					const check = confirm("오늘은 " + conf + " 입니다. "+a+" 등록을 하시겠습니까?"); 
				   					if(check) {
				   						alert(conf + a + " 등록 성공");
				   						if(a == "출근"){
				   							location.href="/main/start";	
				   						} else {
				   							location.href="/main/end";
				   						}
				   					} else {
				   						e.preventdefault();
				   					}
				   				}
						   
						   </script> 
							<div class="col-md-12 col-lg-12">
							   <div class="card" data-aos="fade-up" data-aos-delay="800">
								  <div class="flex-wrap card-header d-flex justify-content-between">
									 <div class="header-title">
										  <a href="/main/schedule">
										<h1 class="mb-2 card-title">일정</h1>
										</a>
									 </div>
								  </div>
								  <div class="card-body">
										<c:if test="${empty scheduleList}">
										  <div class="text-center">
											  <h3>등록된 일정이 없습니다</h3>
										  </div>
									   </c:if>
									 <c:forEach items="${scheduleList}" var="sche">
										  <div class="card rounded-0 shadow-lg" style="border-left: 5px solid ${sche.color}">
											 <div class="card-body">
												<h4 class="mb-2 card-title">${sche.scheTitle}</h4>
												<p class="card-text">${sche.scheCategory}</p>
												<div class="row justify-content-around">
												   <div class="col-md-auto">
													  <p>
														 <fmt:formatDate pattern="yyyy-MM-dd E" value="${sche.scheStartDate}" />
														 <c:if test="${sche.scheStartDate ne sche.scheEndDate}">
															- <fmt:formatDate pattern="yyyy-MM-dd E" value="${sche.scheEndDate}" />
														 </c:if>
													  </p>
												   </div>
												</div>
											 </div>
										  </div>
									   </c:forEach>
								  </div>
							   </div>
							</div>
						 </div>
					  </div> 
				   </div>
						 </div>
      <div class="btn-download">
          <a class="btn btn-success px-3 py-2" href="https://iqonic.design/product/admin-templates/hope-ui-admin-free-open-source-bootstrap-admin-template/" target="_blank" >
              <svg class="icon-24"  width="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path opacity="0.4" d="M17.554 7.29614C20.005 7.29614 22 9.35594 22 11.8876V16.9199C22 19.4453 20.01 21.5 17.564 21.5L6.448 21.5C3.996 21.5 2 19.4412 2 16.9096V11.8773C2 9.35181 3.991 7.29614 6.438 7.29614H7.378L17.554 7.29614Z" fill="currentColor"></path>
                  <path d="M12.5464 16.0374L15.4554 13.0695C15.7554 12.7627 15.7554 12.2691 15.4534 11.9634C15.1514 11.6587 14.6644 11.6597 14.3644 11.9654L12.7714 13.5905L12.7714 3.2821C12.7714 2.85042 12.4264 2.5 12.0004 2.5C11.5754 2.5 11.2314 2.85042 11.2314 3.2821L11.2314 13.5905L9.63742 11.9654C9.33742 11.6597 8.85043 11.6587 8.54843 11.9634C8.39743 12.1168 8.32142 12.3168 8.32142 12.518C8.32142 12.717 8.39743 12.9171 8.54643 13.0695L11.4554 16.0374C11.6004 16.1847 11.7964 16.268 12.0004 16.268C12.2054 16.268 12.4014 16.1847 12.5464 16.0374Z" fill="currentColor"></path>
              </svg>
			</a>
		</div>




		<!-- Footer Section Start -->
		<%@include file="footer.jsp"%>
		<!-- Footer Section End -->
	</main>
	<%@include file="setting.jsp"%>

	<!-- Library Bundle Script -->
	<script src="/js/core/libs.min.js"></script>

	<!-- External Library Bundle Script -->
	<script src="/js/core/external.min.js"></script>

	<!-- Widgetchart Script -->
	<script src="/js/charts/widgetcharts.js"></script>

	<!-- mapchart Script -->
	<script src="/js/charts/vectore-chart.js"></script>
	<script src="/js/charts/dashboard.js"></script>

	<!-- fslightbox Script -->
	<script src="/js/plugins/fslightbox.js"></script>

	<!-- Settings Script -->
	<script src="/js/plugins/setting.js"></script>

	<!-- Slider-tab Script -->
	<script src="/js/plugins/slider-tabs.js"></script>

	<!-- Form Wizard Script -->
	<script src="/js/plugins/form-wizard.js"></script>

	<!-- AOS Animation Plugin-->
	<script src="/vendor/aos/dist/aos.js"></script>

	<!-- App Script -->
	<script src="/js/hope-ui.js" defer></script>

	<script>
		var url = window.location.href;
		$(".nav-item").find('a').each(function() {
			var burl = $(this).prop('href')
			var burl2 = burl + "#"
			if (url == burl || url == burl2) {
				console.log(url);
				console.log($(this).prop('href'))
				$(this).toggleClass('active', $(this).attr('href'));
			}

		})
	</script>

</body>
</html>
