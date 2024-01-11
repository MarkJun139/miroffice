<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/layout/navbar.jsp"></jsp:include>
<script>
	$(function(){
		$("head > title").text("부서 관리");
	})
</script>
<div class="conatiner-fluid content-inner mt-n5 py-0">
<!-- 부서 추가 팝업 창 -->
<div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
<form action="/main/admin/dept/adddept" method="post">
  <div class="modal-dialog">
    <div class="modal-content">
    
      <div class="modal-header">
        <h5 class="modal-title">부서 추가</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	
	      	<div class="form-group">
	      	<label for="name">부서 번호</label>
			<input type="number" class="form-control" id="deptNo" name="deptNo" placeholder="부서 번호">
			</div>
			<div class="form-group">
	     	<label for="name">부서 이름</label>
			<input type="text" class="form-control" id="deptName" name="deptName" placeholder="부서 이름">
			</div>
		
      </div>
      <div class="modal-footer">
       		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
       		<input type="submit" class="btn btn-primary project_popup" value="부서 추가">
      </div>
    </div>
  </div>
  </form>
</div>
<!-- 팝업 창 -->
<!-- 부서 정보 수정 팝업 창 -->
<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
<form action="/main/admin/dept/update" method="post" class="deptUpdateForm">
 <input type="hidden" name = "_method" value = "put"/>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">부서 정보 수정</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
		<input type="hidden" class="form-control deptNo" name="deptNo" readonly >
		<div class="form-group">
     	<label for="name">부서 이름</label>
		<input type="text" class="form-control deptName" name="deptName" placeholder="부서 이름">
		</div>
      </div>
      <div class="modal-footer">
       		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
       		<input type="submit" class="btn btn-primary project_popup" value="부서명 수정">
      </div>
    </div>
  </div>
  </form>
</div>
<!-- 부서 정보 수정 팝업 창 -->
<!-- 부서 삭제 팝업 창 -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">부서 삭제</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body">
      <h4><span style="font-weight: bold;" id="deptNameBody"></span> 부서를 정말 삭제하시겠습니까?</h4>
      </div>
      <div class="modal-footer">
      <form action="/main/admin/dept/delete" method="post" class="deptDeleteForm">
       		<input type="hidden" name="_method" value="delete" />
       		<input type="hidden" name="deptNo" class="deptNo"/>
       		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
       		<input type="submit" class="btn btn-danger project_popup" value="부서 삭제">
       	</form>
      </div>
    </div>
  </div>
</div>
<!-- 부서 삭제 팝업 창 -->
<div class="row">
   <div class="col-md-12 col-lg-12 mt-5">
      <div class="row ">
         <div class="col-md-12 col-lg-12 mt-5">
            <div class="overflow-hidden card" data-aos="fade-up" data-aos-delay="600">
               <div class="flex-wrap card-header d-flex justify-content-between">
                  <div class="header-title col-12">
                  	 <div class="col-12 row text-center align-items-center">
                  	 	<div class="col-6 text-start">
                     		<h1 class="mb-2 card-title">부서 관리</h1>
                     	</div>
                     	<div class="col-6 text-end align-center">
                     		<button type="button" class="btn btn-info " data-bs-toggle="modal" data-bs-target="#addModal">부서 추가</button>
                     	</div>
                     </div>                          
                  </div>
               </div>
               <div class="p-0 card-body">
                  <div class="mt-4 table-responsive">
                     <table id="basic-table" class="table mb-0 table-striped" role="grid">
                        <thead>
                           <tr>
                           	  <th><input class="form-check-input" type="checkbox" value="" id="deptListCheck"></th>
                              <th>부서 번호</th>
                              <th>부서 이름</th>
                              <th>부서 수정</th>
                              <th>부서 삭제</th>
                           </tr>
                        </thead>
                        <tbody>
                        	<c:forEach items="${deptList}" var="dept" >
	                           <tr>
	                              <td class="col-md-1">
	                              	<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
	                              </td>
	                           	  <td class="col-md-1">
	                                 ${dept.deptNo} 
	                              </td>
	                              <td class="col-md-4">
	                                 ${dept.deptName}
	                              </td>
	                              <td class="col-md-1">
	                              	
	                              	<button type="button" class="btn btn-info update_popup" data-bs-toggle="modal" data-bs-target="#updateModal" deptNo="${dept.deptNo}" deptName="${dept.deptName}">정보 수정</button>
	                              	
	                              </td>
	                              <td class="col-md-1">
	                              	<button type="button" class="btn btn-danger delete_popup" data-bs-toggle="modal" data-bs-target="#deleteModal" deptNo="${dept.deptNo}" deptName="${dept.deptName}">부서 삭제</button>
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
			$(".delete_popup").on("click",function(){
				const deptNo = $(this).attr("deptNo");
				const deptName = $(this).attr("deptName");
				$(".deptNo").val(deptNo);
				$(".deptNameBody").text(deptName);
			})
			$(".update_popup").on("click",function(){
				const deptNo = $(this).attr("deptNo");
				const deptName = $(this).attr("deptName");
				$(".deptNo").val(deptNo);
				$(".deptName").val(deptName);
				$(".deptNameBody").text(deptName);
			})
			
		})
	  </script>



<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>