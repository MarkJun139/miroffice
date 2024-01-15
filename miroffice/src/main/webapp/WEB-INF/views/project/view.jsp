<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/navbar.jsp"></jsp:include>
<c:set var="name" value="${pageContext.request.userPrincipal.name}" />
<c:set var="role" value="${pageContext.request.userPrincipal.authorities}" />
<!-- 팝업 창 -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5>프로젝트 삭제</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<h4><span style="font-weight: bold;" class="modal-title"></span><br> 프로젝트를 정말 삭제하시겠습니까?</h4>
      </div>
      <div class="modal-footer">
        <form action="/main/teamleader/project/delete/${project.projectno}" method="post" >
	    	<input type="hidden" name="_method" value="delete"/>
	    	<input class="btn text-white btn-danger" type="submit" value="프로젝트 삭제">
	    </form>
      </div>
    </div>
  </div>
</div>

<div class="conatiner-fluid content-inner mt-n5 py-0">
<div class="row">
   <div class="col-md-12 col-lg-12 mt-5">
      <div class="row">
         <div class="col-md-12 col-lg-12 mt-5">
            <div class="overflow-hidden card" data-aos="fade-up" data-aos-delay="600">
               <div class="card-header">
                  <div class="header-title col-12">
                  	 <div class="col-12 row text-center align-items-center">
                  	 	<div class="col-6 text-start">
                     		<h1 class="mb-2 card-title">${project.projecttitle}</h1>
                     		<c:choose>
	                           	<c:when test="${project.projectpercent == 100}"> 
	                           		<span class="badge badge-secondary" style="background-color:var(--bs-success)" >완료된 프로젝트</span>
	                           	</c:when>
	                           	<c:when test="${project.projectdiffdate < 0}">
	                          			<span class="badge badge-secondary" style="background-color:var(--bs-secondary)" >기한 만료된 프로젝트</span>
	                          		</c:when>
	                           	<c:when test="${project.projectpercent < 100}"> 
	                           		<span class="badge badge-secondary" style="background-color:var(--bs-warning)" >진행중인 프로젝트</span>
	                           	</c:when>
                          	</c:choose>
                     		
                     	</div>
                     </div>                          
                  </div>
               </div>
               <div class="card-body">
               		<p class="card-text">${project.projecttext}</p>
               </div>
               <div class="card-footer col-12">
               		<div class="col-12 row text-center align-items-center">
                  	 	<div class="col-6 text-start">
                     		<a href="/main/projectlist" class="btn btn-primary">프로젝트 목록</a>
                     	</div>
                     	<div class="col-6 text-end">
                     		<c:if test="${project.projectpercent < 100}">
                     		<a href="/main/teamleader/project/edit/${project.projectno}" class="btn btn-info text-white">프로젝트 수정</a>
                     		</c:if>
                     		<c:if test="${project.empno == name}"> 
                    			<button type="button" class="btn btn-danger project_popup" data-bs-toggle="modal" data-bs-target="#exampleModal" project="${project.projectno}" title="${project.projecttitle}">프로젝트 삭제</button>
                    		</c:if>
                    	</div>
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
	$(".project_popup").on("click", function(){
		const project_no = $(this).attr("project");
		const project_title = $(this).attr("title");
		$("#projectno").val(project_no);
		$(".modal-title").text(project_title);
	})
})

</script>
<jsp:include page="../layout/footer.jsp"></jsp:include>








