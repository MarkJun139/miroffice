<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/layout/navbar.jsp"></jsp:include>
<div class="conatiner-fluid content-inner mt-n5 py-0">
<!-- 팝업 창 -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">사원 삭제</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body">
      <span class="empNameBody"></span> 님을 정말 삭제하겠습니까?
      </div>
      <div class="modal-footer">
      <form action="" method="post" class="empDeleteForm">
       		<input type="hidden" name="_method" value="delete" />
       		<input type="hidden" name="empNo" id="empNo"/>
       		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
       		<input type="submit" class="btn btn-danger project_popup" value="사원 삭제">
       	</form>
      </div>
    </div>
  </div>
</div>


<div class="row">
   <div class="col-md-12 col-lg-12 mt-5">
      <div class="row">
         <div class="col-md-12 col-lg-12 mt-5">
            <div class="overflow-hidden card" data-aos="fade-up" data-aos-delay="600">
               <div class="flex-wrap card-header d-flex justify-content-between">
                  <div class="header-title col-12">
                  	 <div class="col-12 row text-center">
                  	 	<div class="col-6 text-start">
                     		<h1 class="mb-2 card-title">사원 관리</h1>
                     	</div>
                     	<div class="col-6 text-end">
                     		<a href="../emp/add" class="btn btn-primary text-white float-right">사원 등록</a>
                     	</div>
                     </div>                          
                  </div>
               </div>
               <div class="p-0 card-body">
                  <div class="mt-4 table-responsive">
                     <table id="basic-table" class="table mb-0 table-striped" role="grid">
                        <thead>
                           <tr>
                              <th></th>
                              <th>사원번호</th>
                              <th>사원이름</th>
                              <th>부서명</th>
                              <th>직무</th>
                              <th>직급</th>
                              <th>연봉</th>
                              <th>권한</th>
                              <th></th>
                              <th></th>
                           </tr>
                        </thead>
                        <tbody>
                        	<c:forEach items="${empList}" var="emp" >
	                           <tr>
	                           	  <td class="col-md-1">
	                                 <img src="/images${emp.empPhoto}" width="125px" height="150px" alt="사원 사진">	 
	                              </td>
	                              <td class="col-md-1">
	                                 ${emp.empNo}
	                              </td>
	                              <td class="col-md-1">
									 ${emp.empName}
								  </td>
	                              <td class="col-md-2">
	                                 ${emp.deptName}
	                              </td>
	                              <td class="col-md-2">
	                                 ${emp.empJob}
	                              </td>
	                              <td class="col-md-1">
	                                 ${emp.empRank}
	                              </td>
	                              <td class="col-md-1">
	                                 ${emp.empSal}
	                              </td>
	                              <td class="col-md-1">
	                                 <c:if test="${emp.empRole == 'ROLE_USER'}">
	                                 	사원
	                                 </c:if>
	                                 <c:if test="${emp.empRole == 'ROLE_TEAMLEADER'}">
	                                 	팀장
	                                 </c:if>
	                              </td>
	                              <td class="col-md-1">
	                              	
	                              	<a href="../emp/edit/${emp.empNo}" class="btn btn-primary project_popup">정보 수정</a>
	                              	
	                              </td>
	                              <td class="col-md-1">
	                              	<button type="button" class="btn btn-danger delete_popup" data-bs-toggle="modal" data-bs-target="#exampleModal" empNo="${emp.empNo}" empName="${emp.empName}">사원 삭제</button>
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
      <script>

		$(function(){
			$(".delete_popup").on("click", function(){
				const empNo = $(this).attr("empNo");
				const empName = $(this).attr("empName");
				
				$("#empNo").val(empNo);
				$(".empNameBody").text(empName);
				$(".empDeleteForm").attr("action","../emp/delete/" + empNo);
			})
		})
	  </script>
<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>