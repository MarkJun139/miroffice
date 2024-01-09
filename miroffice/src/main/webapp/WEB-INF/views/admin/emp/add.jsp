<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/layout/navbar.jsp"></jsp:include>
<div class="conatiner-fluid content-inner mt-n5 py-0">
<div class="row">
   <div class="col-md-12 col-lg-12 mt-5">
      <div class="row">
         <div class="col-md-12 col-lg-12 mt-5">
            <div class="overflow-hidden card" data-aos="fade-up" data-aos-delay="600">
               <div class="flex-wrap card-header d-flex justify-content-between">
                  <div class="header-title col-12">
                  	 <div class="col-12 row text-center">
                  	 	<div class="col-6 text-start">
                     		<h1 class="mb-2 card-title">사원 추가</h1>
                     	</div>
                     </div>                          
                  </div>
               </div>
               <div class="card-body">
               		<div class="row">
                 	 <form action="/main/admin/emp/addemp" class="row" method="post">
                 	 <div class="col-2">
                 	 	<div class="card-body">
	                 	 	<h5 class="card-title text-center">사진 등록</h5>
	                 	 	<label for="preview">
	                 	 		<img class="card-img-top img-fluid" src="https://blog.kakaocdn.net/dn/bftRiB/btqAjaghSBk/5CcN9W5qyCU8HLylVYcXb1/img.png" alt="미리보기" id="preview">
	                 	 	</label>
	               			<input type="file" class="form-control" name="empPhoto" onchange="readURL(this);" enctype="multipart/form-data">
               			</div>
               		 </div>
               		 <div class="col-10">
                 	 <div class="row">
					    <div class="form-group col-md-4">
					      <label for="name">이름</label>
					      <input type="text" class="form-control" id="name" name="empName" placeholder="이름">
					    </div>
					    <div class="form-group col-md-4">
					      <label for="birth">생년월일</label>
					      <input type="date" class="form-control" id="birth" name="empBirth" placeholder="생년월일">
					    </div>
					    <div class="form-group col-md-4">
					      <label for="dept">부서</label>
					      <select id="dept" class="form-control" name="deptNo">
					        <option selected>부서 선택</option>
					        <c:forEach items="${deptList}" var="dept">
					        	<option value="${dept.deptNo}">${dept.deptName}</option>
					        </c:forEach>
					      </select>
					    </div>
					  </div>
					  <div class="row">
					    <div class="form-group col-md-4">
					      <label for="phoneNumber">전화번호</label>
					      <input type="tel" class="form-control" id="phoneNumber" name="empPhone" placeholder="- 제외">
					    </div>
					    <div class="form-group col-md-8">
					      <label for="email">이메일</label>
					      <input type="email" class="form-control" id="email" name="empEmail" placeholder="example@example.com">
					    </div>
					  </div>
					  <div class="row">
					  	<div class="form-group col-md-6">
						    <label for="Address">주소</label>
						    <input type="text" class="form-control" id="Address" name="empAddress" placeholder="주소">
						</div>
						<div class="form-group col-md-6">
						    <label for="Address2">상세주소</label>
						    <input type="text" class="form-control" id="Address2" name="empAddress2" placeholder="상세주소">
					    </div>
					  </div>
					  <div class="row">
					    <div class="form-group col-md-3">
					      <label for="sal">연봉(단위 만)</label>
					      <input type="number" class="form-control" id="sal" name="empSal" placeholder="연봉">
					    </div>
					    <div class="form-group col-md-3">
					      <label for="hireDate">입사일</label>
					      <input type="date" class="form-control" id="hireDate" name="empHiredate" placeholder="입사일">
					    </div>
					    <div class="form-group col-md-3">
					      <label for="empJob">직군</label>
					      <input type="text" class="form-control" id="empJob" name="empJob" placeholder="직군">
					    </div>
					    <div class="form-group col-md-3">
					      <label for="empRank">직급</label>
					      <input type="text" class="form-control" id="empRank" name="empRank" placeholder="직급">
					    </div>
					  </div>
					  <div class="form-group">
					  	권한 부여
					    <div class="form-check">
						  <input class="form-check-input" type="radio" name="empRole" id="user" value="ROLE_USER" checked>
						  <label class="form-check-label" for="user">
						    사원
						  </label>
						</div>
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="empRole" id="teamleader" value="ROLE_TEAMLEADER">
						  <label class="form-check-label" for="teamleader">
						    팀장
						  </label>
						</div>
					  </div>
					  </div>
					  <button type="submit" class="col-md-12 btn btn-primary pull-right">사원 등록</button>
					  </form>
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
 	function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
	}
 </script>
<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>