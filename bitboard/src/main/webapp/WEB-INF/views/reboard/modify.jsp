<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp" %>
<script type="text/javascript">
 $(document).ready(function(){
	$('#save').click(function(){
	 /* var form = $('#updateForm').attr("method", "post").attr("action", "${pageContext.request.contextPath}/member/update");
		form.submit();  */
	
 	  var id = $("#id").val();
		var nm = $("#name").val();
		var birth = $("#birth").val();
		var gender=$("input[name='gender']:checked").val();
		
		var phone = $("#phone").val();
		var addr = $("#addr").val();
		
		var parameter = JSON.stringify({
      'id' : id,
      'nm' : nm,
      'birth' : birth,
      'gender' : gender,
      'phone' : phone,
      'addr' : addr
});
		
		$.ajax({
		  type : 'PUT',
		  url : '${pageContext.request.contextPath}/member/restupdate',
		  data : parameter,
		  contentType : 'application/json;charset=UTF-8',
		  success : function() {
		    alert("수정성공");
		    window.location.href = "${pageContext.request.contextPath}/member/view?id=${info.id}"
		
		  }
		});
	}); 
 }); 

</script>

	<!-- Container ======================================================================================= -->
	<div class="container">
		<div class="row">

			<!-- ★★★ Contents -->
			<div class="col-lg-12">
				<div class="page-header2">
					<h3>회원정보</h3>
				</div>

        <form id="updateForm" >
					<div class="table-responsive">
						<table class="table table-bordered">
							<colgroup>
								<col width="120">
								<col width="*">
								<col width="120">
								<col width="*">
							</colgroup>
							<tbody>
								<tr>
									<th class="text-center">ID</th>
									<td class="text-left"><input type="text" name="id"
										class="form-control" id="id" placeholder="아이디" value="${info.id }"
										readonly></td>
									<th class="text-center">회원명</th>
									<td class="text-left"><input type="text" name="nm"
										class="form-control" id="name" placeholder="이름" value="${info.nm }">
									</td>
								</tr>
								<tr>
									<th class="text-center">생년월일</th>
									<td class="text-left"><input type="text" name="birth"
										class="form-control" id="birth" placeholder="생일"
										value="${info.birth }"></td>
									<th class="text-center">성별</th>
									<td class="text-left">
									  <c:choose>
									    <c:when test="${info.gender eq 0 }">
									      <div class="radio">
	                        <label> <input type="radio" name="gender"
	                          id="optionsRadios1" value="0" checked="checked"> 남자
	                        </label>
	                      </div>
	                      <div class="radio">
	                        <label> <input type="radio" name="gender"
	                          id="optionsRadios2" value="1"> 여자
	                        </label>
	                      </div>
									    </c:when>
									    <c:otherwise>
									      <div class="radio">
	                        <label> <input type="radio" name="gender"
	                          id="optionsRadios1" value="0"> 남자
	                        </label>
	                      </div>
	                      <div class="radio">
	                        <label> <input type="radio" name="gender"
	                          id="optionsRadios2" value="1" checked="checked"> 여자
	                        </label>
	                      </div>
									    </c:otherwise>
	                  </c:choose>
									</td>
								</tr>
								<tr>
									<th class="text-center">전화번호</th>
									<td class="text-left"><input type="text" id="phone" name="phone"
										class="form-control" placeholder="이름" value="${info.phone }">
									</td>
									<th class="text-center">주소</th>
									<td class="text-left"><input type="text" id="addr" name="addr"
										class="form-control" placeholder="이름" value="${info.addr }">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
        

				<div class="pull-right">
					<button type="button" id="save" class="btn btn-success btn-default">저장</button>
					<a href="./list.html" class="btn btn-large btn-default">목록</a>
				</div>

			</div>
		</div>

		<!-- Footer ========================================================================================== -->
		<footer>
			<div class="row">
				<div class="col-lg-12">
					<ul class="list-unstyled">
						<li class="pull-right"><a href="#top">위로 이동</a></li>
						<li><a href="#">BitCamp 홈</a></li>
						<li><a href="#">이용약관</a></li>
						<li><a href="#">도움말</a></li>
						<li><a href="#">회원탈퇴</a></li>
					</ul>
					<p>© BitCamp 2018.</p>
				</div>
			</div>
		</footer>
	</div>

</body>
</html>