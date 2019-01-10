<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp"%>
<c:if test="${article == null }">
  <script>
  alert("글이 삭제되었거나 잘못된 URL접근입니다.");
  document.location.href = "${root}/index.jsp";
  </script>
</c:if>
<c:if test="${article != null }">
<script type="text/javascript">
  $(document).ready(function() {
    control="${root}/reboard";
        
    initVars();
    
    getMemoList();
    
    $(".writeBtn").click(function() {
      $("#commonForm").attr("method", "get").attr("action", writepath).submit();
    });
    
    $(".replyBtn").click(function() {
      $("#seq").val("${article.seq}");
      $("#commonForm").attr("method", "get").attr("action", replypath).submit();
    });
    
    $("#update").click(function() {
      $("#commonForm").attr("method", "get").attr("action", modifypath).submit();
    });
    
    $(".newpage").click(function() {
        $("#pg").val(1);
        $("#key").val("");
        $("#word").val("");
        $("#commonForm").attr("method", "get").attr("action", listpath).submit();
    });
    
    $(".mvpage").click(function() {
        $("#commonForm").attr("method", "get").attr("action", listpath).submit();
    });
    
    ///////////////////////////////////// 댓글 ////////////////////////////////////////
    
    $("#memoBtn").click(function() {
      var seq = "${article.seq}";
      var mcontent = $("#mcontent").val();
      $("#mcontent").val("");
      var parameter = JSON.stringify({'seq' : seq, 'mcontent' : mcontent});
      if(mcontent.trim() != 0) {
        $.ajax({
          url : '${root}/memo',
          type : 'POST',
          contentType : 'application/json;charset=UTF-8',
          dataType : 'json',
          data : parameter,
          success : function(data) {
            makeList(data);
          }
        });
      }
      
    });
    
    $(document).on("click", ".viewMemoModifyBtn", function() {
      var mseq = $(this).parent("td").attr("memo-mseq");
      $("#div"+mseq).css("display", "");
    });
    
    $(document).on("click", ".memoCancelBtn", function() {
      $(this).parents("div").css("display", "none");
    });
    
    $(document).on("click", ".memoModifyBtn", function() {
      var mseq = $(this).parents("td").attr("memo-mseq");
      $("#div"+mseq).css("display", "none");
      var seq = '${article.seq}';
      var mcontent = $("#mcontent"+mseq).val();
      var parameter = JSON.stringify({'mseq' : mseq, 'seq' : seq, 'mcontent' : mcontent});
      if (mcontent.trim().length != 0) {
        $.ajax({
          url : '${root}/memo',
          type : 'PUT',
          contentType : 'application/json;charset=UTF-8',
          dataType : 'json',
          data : parameter,
          success : function(data) {
            makeList(data);
          }
        });
      } 
    });
    
    $(document).on("click", ".memoDeleteBtn", function() {
      if(confirm("정말삭제?")) {
        var mseq = $(this).parent("td").attr("memo-mseq");
        $.ajax({
          url : '${root}/memo/${article.seq}/' + mseq,
          type : 'DELETE',
          contentType : 'application/json;charset=UTF-8',
          dataType : 'json',
          success : function(data) {
            makeList(data);
          }
        });
      }
    });
    
    function getMemoList() {
      $.ajax({
        url : '${root}/memo/${article.seq}' ,
        type : 'GET',
        contentType : 'application/json;charset=UTF-8',
        dataType : 'json',
        success : function(data) {
          makeList(data);
        }
      });
    }
    
    function makeList(memos) {
      $("#memoview").empty();
      var mlist = memos.memolist;
      var output = '';
      var len = mlist.length;
      for(var i=0; i<len; i++) {
        output += '<tr>';
        output += '  <td width="150" height="70">' + mlist[i].name + '</td>';
        output += '  <td>' + mlist[i].mcontent + '</td>';
        output += '  <td width="200">' + mlist[i].mtime + '</td>';
        if (mlist[i].id == '${userInfo.id}') {
          output += '  <td with="120" memo-mseq="' + mlist[i].mseq + '">';
          output += '    <label class="viewMemoModifyBtn">수정</label>';
          output += '    <label class="memoDeleteBtn">삭제</label>';
          output += '  </td>';
          output += '</tr>';
          output += '<tr>';
          output += '  <td colspan="4" memo-mseq="' + mlist[i].mseq + '">';
          output += '    <div id="div' + mlist[i].mseq + '" style="display: none;">';
          output += '      <textarea id="mcontent' + mlist[i].mseq + '" style="resize: none;" rows="3" cols="150">' + mlist[i].mcontent + '</textarea>';
          output += '      <input type="button" value="수정" class="memoModifyBtn">';
          output += '      <input type="button" value="취소" class="memoCancelBtn">';
          output += '    </div>';
          output += '  </td>';
        }
        output += '</tr>';
        output += '<tr>';
        output += '  <td class="bg_board_title_02" height="1" colspan="11"'
        output += '  style="overflow: hidden; padding: 0px"></td>';
        output += '</tr>';
      }
      $("#memoview").append(output);
    }
    
  });


</script>
<!-- Container ======================================================================================= -->
<div class="container">
	<div class="row">

		<!-- ★★★ Contents -->
		<div class="col-lg-12">
			<div class="page-header2">
				<h3> ${article.subject.replace("<", "&lt;") } </h3>
			</div>


			<div class="table-responsive">
				<table class="table table-bordered">
					<colgroup>
						<col width="50">
						<col width="50">
						<col width="100">
						<col width="100">
						<col width="50">
            <col width="50">
            <col width="100">
            <col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th class="text-center">번호</th>
							<td id="id" class="text-left">${article.seq }</td>
							<th class="text-center">글쓴이</th>
							<td id="name" class="text-left">${article.name }</td>
							<th class="text-center">조회</th>
              <td id="birth" class="text-left">${article.hit }</td>
              <th class="text-center">날짜</th>
              <td id="gender" class="text-left">${article.logtime }</td>
						</tr>
						<tr>
							<td style="padding-bottom: 8px; line-height: 1.3" colspan="8"><p style="padding: 50px">${article.content }</p></td>
						</tr>
					</tbody>
				</table>
			</div>


			<div class="pull-right">
				<!--button class="btn btn-success">수정</button-->
				<c:if test="${user.username == article.id }">
				<button id="update" class="btn btn-success btn-default">수정</button>
				<button id="delete" class="btn btn-success btn-default">삭제</button>
				</c:if>
				<%-- 
				<a
					href="${pageContext.request.contextPath }/member/delete?id=${info.id}"
					class="btn btn-large btn-default">삭제</a> 
				 --%>
				<a href="#" class="btn btn-large btn-default mvpage">목록</a>
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
</c:if>