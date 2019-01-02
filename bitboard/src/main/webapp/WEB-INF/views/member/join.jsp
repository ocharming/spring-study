<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp"%>
	<!-- Container ======================================================================================= -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12">

				<div class="page-header">
					<h2 id="container">회원 가입하기</h2>
				</div>

				<div class="well">
					<p>회원가입을 위해 아래 내용들을 작성해 주세요.</p>
					<form class="form-horizontal" method="post"
						action="${root}/member/insert">
						<fieldset>
							<div class="form-group">
								<label class="col-lg-2 control-label">아이디</label>

								<div class="col-lg-8">
									<input type="text" class="form-control" name="id" id="id"
										placeholder="아이디">
								</div>
								<div class="col-lg-2">
								<button id="idcheck" type="button" class="btn btn-primary">중복확인</button>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">이름</label>

								<div class="col-lg-10">
									<input type="text" class="form-control" name="name" id="name"
										placeholder="이름">
								</div>
							</div>
							<div class="form-group">
                <label class="col-lg-2 control-label">이메일</label>

                <div class="col-lg-10">
                  <input type="email" class="form-control" name="email" id="email"
                    placeholder="이메일">
                </div>
              </div>
							<div class="form-group">
								<label class="col-lg-2 control-label">비밀번호</label>

								<div class="col-lg-10">
									<input type="password" class="form-control" name="password"
										id="password" placeholder="비밀번호">
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">비밀번호 확인</label>

								<div class="col-lg-10">
									<input type="password" class="form-control" id="password2"
										placeholder="비밀번호 확인">
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">생년월일</label>

								<div class="col-lg-10">
									<input type="text" class="form-control" name="birth" id="birth"
										placeholder="생년월일 (입력 예: 2000-12-01)">
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">성별</label>

								<div class="col-lg-10">
									<div class="radio">
										<label> <input type="radio" name="gender" id="gender"
											id="optionsRadios1" value="0" checked> 남자
										</label>
									</div>
									<div class="radio">
										<label> <input type="radio" name="gender"
											id="optionsRadios2" value="1"> 여자
										</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">전화번호</label>

								<div class="col-lg-10">
									<input type="text" class="form-control" name="phone" id="phone"
										placeholder="전화번호">
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">우편번호</label>
                <div class="col-lg-8">
                  <input type="text" class="form-control" name="addrcode"
                    id="addrcode" placeholder="우편번호">
                    
                </div>
                <div class="col-lg-2">
                <button id="postcode" type="button" class="btn btn-primary">검색</button>
 
                </div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">주소</label>

								<div class="col-lg-10">
									<input type="text" class="form-control" name="addr" id="addr"
										placeholder="주소">
								</div>
							</div>
							<div class="form-group">
                <label class="col-lg-2 control-label">상세주소</label>

                <div class="col-lg-10">
                  <input type="text" class="form-control" name="addr" id="addr2"
                    placeholder="상세주소">
                </div>
              </div>
							<div class="form-group">
								<div class="col-lg-10 col-lg-offset-2">
									<button id="insertBtn" type="button" class="btn btn-primary">확인</button>
									<a href="${pageContext.request.contextPath}/index.jsp"
										class="btn btn-large btn-default">취소</a>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
			</div>

		</div>

		<!-- Footer ========================================================================================== -->
		<footer>
			<div class="row">
				<div class="col-lg-12">
					<ul class="list-unstyled">
						<li class="pull-right"><a href="#top">위로 이동</a></li>
						<li><a href="#">커뮤니티 홈</a></li>
						<li><a href="#">RSS</a></li>
						<li><a href="#">이용약관</a></li>
						<li><a href="#">도움말</a></li>
						<li><a href="#">회원탈퇴</a></li>
					</ul>
					<p>© BitCamp 2018.</p>
				</div>
			</div>
		</footer>
	</div>

  <script type="text/javascript">
  $(document).ready(function() {
	  var re = /^[a-zA-Z0-9]{8,16}$/; // 아이디와 패스워드가 적합한지 검사할 정규식
	  var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	  var re3 = /^(\d+)[/|\-|\s]+[0|1](\d)[/|\-|\s]+([0|1|2|3]\d)$/;
	  var re4 = /^\d{2,3}-\d{3,4}-\d{4}$/;
	  
	  //아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
	  var idck = 0;
    //idck 버튼을 클릭했을 때 
    $("#idcheck").click(function() {
      //userid 를 param.
      var memberid = $("#id").val();
      if (memberid.trim() == '') {
        $('#myModalLabel').text("아이디 중복체크");
        
        var str = '<div class="well row text-center">';
        str += '<label class="col-xs-12 control-label">아이디를 입력해주세요.</label>'
        str += '</div>';
        $('.modal-body').html(str);
        
        str = '<button type="button" class="btn btn-default" id="modalClose">Close</button>';
        
        $('.modal-footer').html(str);
        
        $('#myModal').modal();
        
      } else {
        $.ajax({
          async: true,
          type: 'POST',
          data: memberid,
          url: "${pageContext.request.contextPath}/member/idcheck",
          dataType: "json",
          contentType: "application/json; charset=UTF-8",
          success: function(data) {
            if (data.cnt > 0) {
              $('#myModalLabel').text("아이디 중복체크");
              
              var str = '<div class="well row text-center">';
              str += '<label class="col-xs-12 control-label">아이디가 존재합니다. 다른 아이디를 입력해주세요.</label>'
              str += '</div>';
              $('.modal-body').html(str);
              
              str = '<button type="button" class="btn btn-default" id="modalClose">Close</button>';
              
              $('.modal-footer').html(str);
              
              $('#myModal').modal();
              $("#userid").focus();

            } else {
              $('#myModalLabel').text("아이디 중복체크");
              
              var str = '<div class="well row text-center">';
              str += '<label class="col-xs-12 control-label">사용 가능한 아이디입니다.</label>'
              str += '</div>';
              $('.modal-body').html(str);
              
              str = '<button type="button" class="btn btn-default" id="modalClose">Close</button>';
              
              $('.modal-footer').html(str);
              
              $('#myModal').modal();
              $("#userid").focus();
              idck = 1;
            }
          },
          error: function(error) {

            alert("error : " + error);
          }
        });
      }
     
    });
	  
	  
	  
	  
	  
	  
    $("#insertBtn").click(function() {
    	
      var id = $("#id").val();
      var name = $("#name").val();
      var email = $("#email").val();
      var password = $("#password").val();
      var password2 = $("#password2").val();
      
      var birth = $("#birth").val();
      var gender;
      if($("#gender").attr("checked", "checked")) {
        gender = 0;
      } else {
        gender = 1;
      } 
      var phone = $("#phone").val();
      var addrcode = $("#addrcode").val();
      var addr = $("#addr").val();
      var addr2 = $("#addr2").val();
      
      if(id.trim() == ""){
    	  
     	  $('#myModalLabel').text("가입 에러");
        var str = 'ID를 입력해주세요.';
        $('.modal-body').html(str);
        str = '<button type="button" class="btn btn-default" id="modalClose">Close</button>';
        $('.modal-footer').html(str);
        $('#myModal').modal();
        return false;
   		}
        
      if(!check(re, id, "아이디는 8~16자의 영문 대소문자와 숫자로만 입력해주세요")){
    	  return false;
      }
        
      if (idck != 1){
    	  $('#myModalLabel').text("가입 에러");
    	  var str = 'ID 중복확인 해주세요.';
        $('.modal-body').html(str);
        str = '<button type="button" class="btn btn-default" id="modalClose">Close</button>';
        $('.modal-footer').html(str);
        $('#myModal').modal();
        return false;
      }
      
			if(name.trim() == ""){
	   	  $('#myModalLabel').text("가입 에러");
	       var str = '이름을 입력해주세요.';
	       $('.modal-body').html(str);
	       str = '<button type="button" class="btn btn-default" id="modalClose">Close</button>';
	       $('.modal-footer').html(str);
	       $('#myModal').modal();
	       return false;
  		}
			
			
			if(email.trim() == ""){
	   	  $('#myModalLabel').text("가입 에러");
	       var str = '이메일을 입력해주세요.';
	       $('.modal-body').html(str);
	       str = '<button type="button" class="btn btn-default" id="modalClose">Close</button>';
	       $('.modal-footer').html(str);
	       $('#myModal').modal();
	       return false;
  		}
			
			if(!check(re2, email, "이메일 형식으로 입력해주세요.")){
		    return false;
		  }
			
			if(password.trim() == ""){
	   	  $('#myModalLabel').text("가입 에러");
	       var str = '비밀번호를 입력해주세요.';
	       $('.modal-body').html(str);
	       str = '<button type="button" class="btn btn-default" id="modalClose">Close</button>';
	       $('.modal-footer').html(str);
	       $('#myModal').modal();
	       return false;
  		}
			
			if(!check(re, password, "비밀번호는 8~16자의 영문 대소문자와 숫자로만 입력해주세요")){
		    return false;
		  }
			
			if(password2.trim() == ""){
	   	  $('#myModalLabel').text("가입 에러");
	       var str = '비밀번호 확인을 입력해주세요.';
	       $('.modal-body').html(str);
	       str = '<button type="button" class="btn btn-default" id="modalClose">Close</button>';
	       $('.modal-footer').html(str);
	       $('#myModal').modal();
	       return false;
		  }
					
			if(!check(re, password2, "비밀번호 확인은 8~16자의 영문 대소문자와 숫자로만 입력해주세요")){
		    return false;
		  }
			
			if(password!=password2){
				$('#myModalLabel').text("가입 에러");
	       var str = '비밀번호가 맞지 않습니다.';
	       $('.modal-body').html(str);
	       str = '<button type="button" class="btn btn-default" id="modalClose">Close</button>';
	       $('.modal-footer').html(str);
	       $('#myModal').modal();
	       return false;
			}
			
			if (birth.trim().length != 10){
				$('#myModalLabel').text("가입 에러");
	       var str = '생년월일의 형식이 올바르지 않습니다.';
	       $('.modal-body').html(str);
	       str = '<button type="button" class="btn btn-default" id="modalClose">Close</button>';
	       $('.modal-footer').html(str);
	       $('#myModal').modal();
			  return false;
			}
			
			if(!check(re3, birth, "생년월일의 형식이 올바르지 않습니다.")){
				return false;
		  }
			

			if (phone.trim() != 12 && phone.trim().length != 13){
				$('#myModalLabel').text("가입 에러");
	       var str = '전화번호 형식이 올바르지 않습니다.';
	       $('.modal-body').html(str);
	       str = '<button type="button" class="btn btn-default" id="modalClose">Close</button>';
	       $('.modal-footer').html(str);
	       $('#myModal').modal();
			  return false;
			}
		
			if(!check(re4, phone, "전화번호의 형식이 올바르지 않습니다.")){
				return false;
		  }
			
			
			if (addrcode == ""){
				$('#myModalLabel').text("가입 에러");
	       var str = '우편번호 형식이 올바르지 않습니다.';
	       $('.modal-body').html(str);
	       str = '<button type="button" class="btn btn-default" id="modalClose">Close</button>';
	       $('.modal-footer').html(str);
	       $('#myModal').modal();
			  return false;
			}
			if (addr2 == ""){
				$('#myModalLabel').text("가입 에러");
	       var str = '상세주소를 입력해주세요.';
	       $('.modal-body').html(str);
	       str = '<button type="button" class="btn btn-default" id="modalClose">Close</button>';
	       $('.modal-footer').html(str);
	       $('#myModal').modal();
			  return false;
			}
			
	     var parameter = JSON.stringify({
	            'id' : id,
	            'name' : name,
	            'email' : email,
	            'password' : password,
	            'birth' : birth,
	            'gender' : gender,
	            'phone' : phone,
	            'addrcode' : addrcode,
	            'addr' : addr,
	            'addr2' : addr2
	    });
	    
	    $.ajax({
	      url:'${pageContext.request.contextPath}/member/rest',
	      data: parameter,
	      contentType: 'application/json;charset=UTF-8',
	      type: 'POST',
	      success: function() {
	        location.href='${root}/'
	      }
	    }); 
      
    });
    

    
    $("#postcode").click(function() {
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
	  
	  $(document).on("click", "#modalClose", function() {
	    $('#myModal').modal('hide');
	    var str = '...';
	    $('.modal-body').html(str);
	    
	    str = '<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>';
	    str += '<button type="button" class="btn btn-primary">Save changes</button>';
	    
	    $('.modal-footer').html(str);
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
    
    $('#addrcode').val(postcode);
    $('#addr').val(address);
    $('#addrcode').attr("readonly","readonly");
    $('#addr').attr("readonly","readonly");
    $('#addr2').focus();
    var str = '...';
    $('.modal-body').html(str);
    
    str = '<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>';
    str += '<button type="button" class="btn btn-primary">Save changes</button>';
    
    $('.modal-footer').html(str);
  }
  function check(re, what, message) {
      if(re.test(what)) {
          return true;
      }
      $('#myModalLabel').text("가입 에러");
      $('.modal-body').html(message);
      var str = '<button type="button" class="btn btn-default" id="modalClose">Close</button>';
      $('.modal-footer').html(str);
      $('#myModal').modal();
      what.val("");
      what.focus();
      //return false;
  }
  </script>

</body>
</html>