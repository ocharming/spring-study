<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Tabs - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
  <link rel="stylesheet" href="css/style.css"/>
  
  <style type="text/css">
  #tabs{height: 96vh;}
  td,td{
  text-align: center;
  }
  
  #myTable3_filter{
  text-align: center;
  float: none;
  }
  </style>
  <script src="vendors/js/vendor.bundle.base.js"></script>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <script src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
  
  
  <script>
//Korean
  var lang_kor = {
	      "decimal" : "",
	      "emptyTable" : "데이터가 없습니다.",
	      "info" : "_START_ - _END_ (총 _TOTAL_ 명)",
	      "infoEmpty" : "0명",
	      "infoFiltered" : "(전체 _MAX_ 명 중 검색결과)",
	      "infoPostFix" : "",
	      "thousands" : ",",
	      "lengthMenu" : "_MENU_ 개씩 보기",
	      "loadingRecords" : "로딩중...",
	      "processing" : "처리중...",
	      "search" : "검색 : ",
	      "zeroRecords" : "검색된 데이터가 없습니다.",
	      "paginate" : {
	          "first" : "첫 페이지",
	          "last" : "마지막 페이지",
	          "next" : "다음",
	          "previous" : "이전"
	      },
	      "aria" : {
	          "sortAscending" : " :  오름차순 정렬",
	          "sortDescending" : " :  내림차순 정렬"
	      }
	  };


  
  
  $(document).ready( function () {
	    $('#myTable').DataTable({
	    	"ordering": false,
	    	language : lang_kor,
	    	info : false,
	    	/* ajax : {
                 "url":"ms_list.htm",
                 "type":"POST"
                
	    	},
	    	columns : [
	    		{data:false},
	    		{data:"N_NUM"},
	    		{data:"M_SEMAIL"},
	    		{data:"M_REGDATE"}
	    	] */
	    	
	    	 buttons: [
	    	        { extend: 'copy', text: 'Copy to clipboard' }
	    	    ]

	    });
	    
	    $('#myTable2').DataTable({
	    	"ordering": false,
	    	language : lang_kor,
	    	info : false
	            
	    });
	    
	    $('#myTable3').DataTable({
	    	"ordering": false,
	    	language : lang_kor,
	    	info : false,
	    	lengthChange : false
	    	
	    });
		
	    $( "#tabs" ).tabs();
	    
	    
	    $('#form').submit(function(event){
	    	event.preventDefault();
	    	var data = $(this).serialize() ;
	    	console.log(data);
	    		});
	    
	} );
  </script>
</head>
<body>
 
<div id="tabs">
  <ul>
    <li><a href="#tabs-1">받은쪽지함</a></li>
    <li><a href="#tabs-2">보낸쪽지함</a></li>
    <li><a href="#tabs-3">쪽지쓰기</a></li>
  </ul>
  <div id="tabs-1">
    <table id="myTable" >
    	<thead>
	        <tr>
	            <th></th>
	            <th>보낸이</th>
	            <th>제목</th>
	            <th>받은날짜</th>
	        </tr>
        </thead>
         <tbody>
	         <c:forEach items="${list}" var='list'>
		            <tr>
		                <td><input type="checkbox"><input type="hidden" name="N_Num" value="${list.N_NUM}"></td>
		                <td>${list.M_SEMAIL}</td>
		                <td>${list.N_CONTENT}</td>
		                <td>${list.M_REGDATE}</td>
		            </tr>
		      </c:forEach>
    	</tbody>
    </table>
    
  </div>
  <div id="tabs-2">
    <table id="myTable2" >
    	<thead>
	        <tr>
	            <th></th>
	            <th>받는이</th>
	            <th>제목</th>
	            <th>받은날짜</th>
	        </tr>
        </thead>
         <tbody>
	            <c:forEach items="${Slist}" var='Slist'>
		            <tr>
		                <td><input type="checkbox"><input type="hidden" name="N_Num" value="${Slist.N_NUM}"></td>
		                <td>${Slist.M_REMAIL}</td>
		                <td>${Slist.N_CONTENT}</td>
		                <td>${Slist.M_REGDATE}</td>
		            </tr>
		      </c:forEach>
    	</tbody>
    </table>
  </div>
  <div id="tabs-3">
  	<form id="form">
	  	<div style="text-align: center">
		    <div>
		    	<strong><span>받는사람 &nbsp;</span></strong>
		    	<input type="checkbox"><label>내게쓰기</label> <input name="m_Remail" id="m_Remail" type="text" size="30" >
		    	<%-- <input type="hidden" name="m_Semail" value="${m_Email}"> --%>
		    	<button  class="btn btn-gradient-primary btn-sm " data-toggle="modal" data-target="#fr_list">친구찾기</button>
		    </div>
			<div>
				<textarea name="n_Content" id="n_Content" rows="15" cols="63" style="margin-top: 5px;"></textarea>
			</div>
			<div style="text-align: center;">
				<button id="submit"class="btn btn-gradient-primary btn-sm" >보내기</button>
				<button type="reset" class="btn btn-gradient-primary btn-sm">초기화</button> 
			</div>
		</div>
	</form>
	</div>
 
 
</body>


<!-- 모달 -->
<div class="modal fade" id="fr_list" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>

			</div>
			<div class="modal-body">
				<div class="col-md-12 grid-margin stretch-card">
					<div class="card">
						<div class="card-body text-center">
							<h2 class="card-title">친구들</h2>
								 <table id="myTable3" >
							    	<thead>
								        <tr>
								            <th></th>
								            <th>프로필 사진</th>
								            <th>닉네임</th>
								        </tr>
							        </thead>
							         <tbody>
								            <tr>
								                <td><input type="checkbox"></td>
								                <td>희대</td>
								                <td>쪽지 1</td>
								            </tr>
							    	</tbody>
							    </table>
							    
								<button type="button" id="login" class="btn btn-gradient-primary btn-sm" style="margin-top: 20px"
									>선택완료</button>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>

</html>