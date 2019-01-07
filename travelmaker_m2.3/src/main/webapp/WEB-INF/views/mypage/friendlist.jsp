<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="main-panel">
	<div class="content-wrapper1">
		<div class="col-lg-6 col-md-8 mx-auto text-center">
			<div class="auth-form-light p-5 d-table-cell align-middle card">
				<h1 class="my-md-4">친구 목록</h1>
				<c:choose>
				<c:when test="${empty member}">
				<hr>
				<h3 class="my-md-4">현재 친구로 등록된 회원이 없습니다!</h3>
				</c:when>
				<c:otherwise>
				<table class="table table-basic">
					<c:forEach items="${member}" var="mem">
						<tr>
							<td>
								<div class="nav-profile-image">
									<img src="image/member/${mem.m_Image}" onerror="this.src='image/member/unknown.jpg'"/>
									<div class="nav-profile-text d-flex flex-column">
										<span class="font-weight-bold mb-2">${mem.m_Nickname}</span>
									</div>
								</div>
							</td>
							<td><button class="btn btn-sm btn-outline-success">대화하기</button></td>
							<td><button class="btn btn-sm btn-outline-danger" data-toggle="modal" data-target="#messageHome">쪽지 보내기</button></td>
							<td><button class="btn btn-sm btn-outline-secondary">친구 삭제</button></td>
						</tr>
					</c:forEach>
				</table>
				</c:otherwise>
				</c:choose>
			</div>
		</div>	
	</div>
	<!-- content-wrapper1 ends -->
	    <!-- Modal Profile -->
 		 <div class="modal fade" id="messageHome" role="dialog">
 		 <div class="modal-dialog">

 		 <!-- Modal Profile content-->
		      <div class="modal-content">
		      
		        <div class="modal-header">
		          <h4 class="modal-title font-weight-bold">쪽지함</h4>
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
					<input type="hidden" name="m_Email" value="${dto.m_Email}">
		        </div>
		        
		        <div class="modal-body">
<!-- 		        	<div class="content-wrapper1 text-center"> -->
			        	<div class="btn-group" role="group">
				        	<button type="button" class="btn btn-outline-primary">받은 쪽지함</button>
				        	<button type="button" class="btn btn-outline-primary">보낸 쪽지함</button>
				        	<button type="button" class="btn btn-outline-primary">쪽지 보관함</button>
				        </div>
				      	
<!-- 		        	</div> -->
		        </div>
		        
		        <div class="modal-footer">
		           <button type="button" id="profilech" class="btn btn-gradient-primary mr-2" data-dismiss="modal">변경</button>
                   <button class="btn btn-light" data-dismiss="modal">취소</button>
		        </div>
		        
		      </div>	      

 		 </div>
 		 </div>
</div>
<!-- main-panel ends -->

