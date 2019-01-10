<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp"%>
<script type="text/javascript">
  $(document).ready(function(){
    
    $.ajax({
      url : '${root}/member/rest/${id}',
      type : 'get',
      dataType : 'json',
      success: function(data){
        $('#id').text(data.id);
        $('#name').text(data.name);
        $('#birth').text(data.birth);
        if(data.gender == '0') {
          $('#gender').text('남자');
        } else if(data.gender == '1') {
          $('#gender').text('여자');
        }
        $('#phone').text(data.phone);
        $('#email').text(data.email);
        $('#addr').text(data.addr);
        $('#addrcode').text(data.addrcode);
        $('#addr2').text(data.addr2);
        $('#addrBtnArea').empty();
      },
      error: function(xhr, status, error){
        console.log("status: " + status);
      }
    });
    
    $(document).on("click", '#updateConfirm', function(){
      $('#myModalLabel').text("개인정보 수정");
      
      var str = '<div class="well row text-center">';
      str += '<label class="col-xs-12 control-label">개인정보를 수정하시겠습니까?</label>'
      str += '</div>';
      $('.modal-body').html(str);
      
      str = '<button type="button" class="btn btn-default" id="modalClose">Close</button>';
      str += '<button type="button" class="btn btn-primary" id="modalUpdate">Agree</button>';
      
      $('.modal-footer').html(str);
      
      $('#myModal').modal();
    });
    
    $(document).on("click", '#modalUpdate', function(){
      $('#myModal').modal('hide');
      $.ajax({
        url : '${root}/member/rest/${id}',
	      type : 'get',
	      dataType : 'json',
	      success: function(data){
	        $('#id').html('<input type="text" class="form-control" value="' + data.id + '" readonly>');
	        $('#name').html('<input type="text" class="form-control" value="' + data.name + '" readonly>');
	        $('#birth').html('<input type="text" class="form-control" value="' + data.birth + '" readonly>');
	        if(data.gender == '0') {
	          var str = '<div class="radio"><label><input name="gender" type="radio" value="0" checked="checked" disabled="true">남자</label></div>';
	          str += '<div class="radio"><label><input name="gender" type="radio" value="1" disabled="true">여자</label></div>';
	          $('#gender').html(str);
	        } else if(data.gender == '1') {
	          var str = '<div class="radio"><label><input name="gender" type="radio" value="0" disabled="true">남자</label></div>';
            str += '<div class="radio"><label><input name="gender" type="radio" value="1" checked="checked" disabled="true">여자</label></div>';
            $('#gender').html(str);
	        }
	        $('#phone').html('<input type="text" class="form-control" value="' + data.phone + '">');
	        $('#email').html('<input type="email" class="form-control" value="' + data.email + '">');
	        $('#addr').html('<input type="text" class="form-control" value="' + data.addr + '"readonly>');
	        $('#addrcode').html('<input type="text" class="form-control" value="' + data.addrcode + '"readonly>');
	        $('#addr2').html('<input type="text" class="form-control" value="' + data.addr2 + '">');
	        $('#addrBtnArea').html('<button type="button" class="btn btn-success">주소검색</button>');
	        
	        var str = '<button id="update" class="btn btn-success btn-default">수정</button> ';
	        str += '<button id="updateCancel" class="btn btn-success btn-default">수정 취소</button> ';
	        str += '<a href="./list" class="btn btn-large btn-default">목록</a>';
	        
	        $('#buttonGroup').html(str);
	        
	      },
	      error: function(xhr, status, error){
	        console.log("status: " + status);
	      }
      });
    });
    
    $(document).on("click", "#addrBtnArea button", function() {
      $('#myModalLabel').text("우편 검색");
      
      var str = '<div class="well row form-horizontal">';
      str += '<label class="col-xs-2 control-label">주소검색</label>';
      str += '<div class="col-xs-8">';
      str += '<input type="text" class="form-control" id="addrSearchValue" placeholder="예) 판교역로 235, 분당 주공, 삼평동 681">';
      str += '</div>';
      str += '<div class="col-xs-2">';
      str += '<button id="searchAddr" type="button" class="btn btn-primary">검색</button>';
      str += '</div>';
      str += '<div>';
      str += '<table class = "table text-center">';
      str += '<thead>';
      str += '<tr>';
      str += '<th style="width:80px;" class="text-center">우편번호</th>';
      str += '<th class="text-center">주소</th>';
      str += '</tr>';
      str += '</thead>';
      str += '<tbody id="resultAddr"></tbody>';
      str += '</table>';
      str += '</div>';
      str += '</div>';
      
      $('.modal-body').html(str);
      
      str = '<button type="button" class="btn btn-default" id="modalClose">Close</button>';
      
      $('.modal-footer').html(str);
      
      $('#myModal').modal();
    });
    
  
	  $(document).on("click", "#searchAddr", function() {
	    var value = $('#addrSearchValue').val();
	    addr(1, value);
	  });
	  
	  $(document).on("click", ".addrBtn" , function() {
	    var value = $('#addrSearchValue').val();
	    addr($(this).text(), value);
	  });
	  
	  $(document).on("click", "#prevAddrBtn" , function() {
	    var value = $('#addrSearchValue').val();
	    var page = Math.trunc(($(this).attr("currentPage")-1)/10);
	    addr(page * 10, value);
	  });
	  
	  $(document).on("click", "#nextAddrBtn" , function() {
	    var value = $('#addrSearchValue').val();
	    var page = Math.trunc(($(this).attr("currentPage")-1)/10);
	    console.log(page);
	    addr(page * 10 + 11, value);
	  });
	  
	  $(document).on("click", ".adaptAddr" , function() {
	    var address = $(this).text();
	    var postcode = $(this).attr("postcode");
	    putaddr(postcode, address);
	  });
    
    
    $(document).on("click", "#updateCancel", function() {
      $.ajax({
        url : '${root}/member/rest/${id}',
        type : 'get',
        dataType : 'json',
        success: function(data){
          $('#id').text(data.id);
          $('#name').text(data.name);
          $('#birth').text(data.birth);
          if(data.gender == '0') {
            $('#gender').text('남자');
          } else if(data.gender == '1') {
            $('#gender').text('여자');
          }
          $('#phone').text(data.phone);
          $('#email').text(data.email);
          $('#addr').text(data.addr);
          $('#addrcode').text(data.addrcode);
          $('#addr2').text(data.addr2);
          $('#addrBtnArea').empty();
          
          var str = '<button id="updateConfirm" class="btn btn-success btn-default">수정</button> ';
          str += '<button id="delete" class="btn btn-success btn-default">삭제</button> ';
          str += '<a href="./list" class="btn btn-large btn-default">목록</a>';
          
          $('#buttonGroup').html(str);
        },
        error: function(xhr, status, error){
          console.log("status: " + status);
        }
      });
    });
    
    $(document).on("click", "#update", function() {
     
      var data = JSON.stringify({
              id : $('#id').children("input").val(),
              name : $('#name').children("input").val(),
              birth : $('#birth').children("input").val(),
              gender : $("input[name='gender']:checked").val(),
              phone : $('#phone').children("input").val(),
              email : $('#email').children("input").val(),
              addrcode : $('#addrcode').children("input").val(),
              addr : $('#addr').children("input").val(),
              addr2 : $('#addr2').children("input").val()
      });
      console.log(data);
      $.ajax({
        url : '${root}/member/rest/',
        type : 'put',
        contentType: 'application/json;charset=UTF-8',
        data: data,
        success: function(data){
          $('#myModalLabel').text("개인정보 수정");
          
          var str = '<div class="well row text-center">';
          str += '<label class="col-xs-12 control-label">개인정보가 수정되었습니다.</label>'
          str += '</div>';
          $('.modal-body').html(str);
          
          str = '<button type="button" class="btn btn-default" id="modalClose">Close</button>';
          
          $('.modal-footer').html(str);
          
          $('#myModal').modal();
        },
        error: function(xhr, status, error){
          console.log("status: " + status);
        } 
      }).done(function() {
         $.ajax({
           url : '${root}/member/rest/${id}',
           type : 'get',
           dataType : 'json',
           success: function(data){
             $('#id').text(data.id);
             $('#name').text(data.name);
             $('#birth').text(data.birth);
             if(data.gender == '0') {
               $('#gender').text('남자');
             } else if(data.gender == '1') {
               $('#gender').text('여자');
             }
             $('#phone').text(data.phone);
             $('#email').text(data.email);
             $('#addr').text(data.addr);
             $('#addrcode').text(data.addrcode);
             $('#addr2').text(data.addr2);
             $('#addrBtnArea').empty();
             
             var str = '<button id="updateConfirm" class="btn btn-success btn-default">수정</button> ';
             str += '<button id="delete" class="btn btn-success btn-default">삭제</button> ';
             str += '<a href="./list" class="btn btn-large btn-default">목록</a>';
             
             $('#buttonGroup').html(str);
           },
           error: function(xhr, status, error){
             console.log("status: " + status);
           }
         });
      });
    });
    
    $(document).on("click", "#modalClose", function() {
      $('#myModal').modal('hide');
      var str = '...';
      $('.modal-body').html(str);
      
      str = '<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>';
      str += '<button type="button" class="btn btn-primary">Save changes</button>';
      
      $('.modal-footer').html(str);
    });
    
    $(document).on("click", '#delete', function(){
      $('#myModalLabel').text("회원 탈퇴");
      
      var str = '<div class="well row text-center">';
      str += '<label class="col-xs-12 control-label">정말로 탈퇴하시겠습니까?</label>'
      str += '</div>';
      $('.modal-body').html(str);
      
      str = '<button type="button" class="btn btn-default" id="modalClose">Close</button>';
      str += '<button type="button" class="btn btn-primary" id="modalDelete">Agree</button>';
      
      $('.modal-footer').html(str);
      
      $('#myModal').modal(); 
    })
     $(document).on("click", '#modalDelete', function(){
	      $.ajax({
	        url : '${root}/member/rest/${id}',
	        type : 'DELETE',
	        contentType: 'application/json;charset=UTF-8',
	        success: function(data){
	          location.href = '${root}/logout'
	        },
	        error: function(xhr, status, error){
	          console.log("status: " + status);
	        }
	      });
     });
  });
  
  
  
  function addr(currentPage, value) {
    $.ajax({
      async: true,
      type: 'GET',
      url: "${pageContext.request.contextPath}/member/postcode/" + currentPage + "?query=" + value,
      contentType: "application/json; charset=UTF-8",
      success: function(data) {
        var str = '';
        console.log(JSON.parse(data));
        var data = JSON.parse(data);
        if(data.errorCode != null && data.errorCode != ''){
          str += '<tr>';
          str += '<td colspan="2">';
          str += data.errorMessage;
          str += '</td>';
          str += '</tr>';
        }
        else{
          var list = data.list;
          
          $.each(list, function(index, data) {
            str += "<tr>";
            str += "<td>";
            str += data.postcode;
            str += "</td>";
            str += "<td>";
            str += '<a href="#" class="adaptAddr" postcode="'+data.postcode+'">' + data.address + '</a>';
            str += "</td>";
            str += "</tr>";
          });
          str += '<tr>';
          str += '<td colspan="2">';
          str += '<nav>';
          str += '<ul class="pagination pagination-sm pagination-sm">';
          
          if(data.isNowFirst) {
            str += '<li class="disabled">';
            str += '<span>';
            str += '<span aria-hidden="true">&laquo;</span>';
            str += '</span>';
            str += '</li>';
          } else {
            str += '<li>';
            str += '<span>';
            str += '<a href="#" id="prevAddrBtn" currentPage="' + currentPage + '">&laquo;</a>'
            str += '</span>';
            str += '</li>';
          }
          
          for(var i = data.startPage; i <= data.endPage; i++) {
            if(i == data.currentPage) {
              str += '<li class="active">';
              str += '<span>' + i + '<span class="sr-only">(current)</span></span>';
              str += '</li>';
            }else {
              str += '<li>';
              str += '<a href="#" class="addrBtn">' + i + '</a>';
              str += '</li>';
            }
          }
          
          if(data.isNowEnd) {
            str += '<li class="disabled">';
            str += '<span>';
            str += '<span aria-hidden="true">&raquo;</span>';
            str += '</span>';
            str += '</li>';
          } else {
            str += '<li>';
            str += '<span>';
            str += '<a href="#" id="nextAddrBtn" currentPage="' + currentPage + '">&raquo;</a>'
            str += '</span>';
            str += '</li>';
          }
          
          str += '</ul>';
          str += '</nav>';
          str += '</td>';
          str += '</tr>';
        }
        $('#resultAddr').html('');
        
        $('#resultAddr').append(str);
      }
    });
  }
  
  function putaddr(postcode, address) {
    $('#myModal').modal('hide');
    
    $('#addrcode').children("input").val(postcode);
    $('#addr').children("input").val(address);
    $('#addr2').children("input").focus();
    var str = '...';
    $('.modal-body').html(str);
    
    str = '<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>';
    str += '<button type="button" class="btn btn-primary">Save changes</button>';
    
    $('.modal-footer').html(str);
  }
  
</script>
<!-- Container ======================================================================================= -->
<div class="container">
	<div class="row">

		<!-- ★★★ Contents -->
		<div class="col-lg-12">
			<div class="page-header2">
				<h3>회원정보</h3>
			</div>


			<div class="table-responsive">
				<table class="table table-bordered">
					<colgroup>
						<col width="120">
						<col width="180">
						<col width="120">
						<col width="180">
						<col width="120">
            <col width="*">
					</colgroup>
					<tbody class="form-horizontal" id ="detail">
						<tr>
							<th class="text-center">ID</th>
							<td id="id" class="text-left"></td>
							<th class="text-center">회원명</th>
							<td id="name" class="text-left"></td>
							<th class="text-center">생년월일</th>
              <td id="birth" class="text-left"></td>
						</tr>
						<tr>
							<th class="text-center">성별</th>
              <td id="gender" class="text-left"></td>
              <th class="text-center">전화번호</th>
              <td id="phone" class="text-left"></td>
              <th class="text-center">이메일</th>
              <td id="email" class="text-left"></td>
						</tr>
						<tr>
						  <th class="text-center">우편번호</th>
              <td id="addrcode" class="text-left"></td>
              <th class="text-center">주소</th>
              <td colspan=3 id="addr" class="text-left"></td>
            </tr>
						<tr>
              <th class="text-center">상세주소</th>
              <td colspan=4 id="addr2" class="text-left"></td>
              <td id="addrBtnArea" class="text-left"></td>
            </tr>
						
					</tbody>
				</table>
			</div>


			<div class="pull-right" id="buttonGroup">
				<!--button class="btn btn-success">수정</button-->
				<button id="updateConfirm" class="btn btn-success btn-default">수정</button>
				<button id="delete" class="btn btn-success btn-default">삭제</button>
				<%-- 
				<a
					href="${pageContext.request.contextPath }/member/delete?id=${info.id}"
					class="btn btn-large btn-default">삭제</a> 
				 --%>
				<a href="./list" class="btn btn-large btn-default">목록</a>
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