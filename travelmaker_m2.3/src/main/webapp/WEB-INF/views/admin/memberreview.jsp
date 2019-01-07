<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<div class="main-panel ">
        <div class="content-wrapper1">
			<p><h3 class=text-left>${m}님이 작성한 글</h3><p>
			
		  <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
					<a href="memberfeed.htm?m_Email=${m}" class="btn btn-outline-primary btn-sm font-weight-bold">함께가기</a>
					&nbsp;&nbsp;&nbsp;
					<a href="" class="btn btn-outline-primary1 btn-sm font-weight-bold">리 뷰</a><br><br>
				
				<table class="table table-striped">
                    <thead>
                      <tr>
                        <th>
                          글번호  
                        </th>
                        <th>
                          제 목  
                        </th>
                        <th>
                          작성일    
                        </th>
                      </tr>
                    </thead>
            <tbody>
                <c:forEach var="r" items="${review}">
					<tr>
						<td align="left" name="t_Num">${r.t_Num}</td>
						<td align="left" name=t_Title>
							<a href="">${r.t_Title}</a>
		<!--  아직 함께가기 통합이 안된 상태라 통합하고 함께가기 글로 이동해야함  -->
						</td>
						<td align="left" name="t_Regdate">${r.t_Regdate}</td>
					</tr>
				</c:forEach>
              </tbody>
                  </table>
           </div>
         </div>
       </div>
     </div>
 </div>
</body>
</html>