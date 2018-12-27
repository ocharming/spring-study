<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp" %>
<c:if test="${article == null}">
  <script>
    alert("글이 삭제되었거나 잘못된 URL접근입니다.");
    document.location.href = "${root}/index.jsp"; // 원칙적으로 jsp->jsp로 보내는건 좋지 않다.
  </script>
</c:if>
<c:if test="${article != null}">
<script type="text/javascript">

$(document).ready(function(){
  control = "${root}/reboard";
  
  initVars();
  
  getMemoList();
  //mouseover시 게시판 글 색 변경
  
  $(".posting").click(function(){
    //alert($(this).children().first().text());
    //alert($(this).attr("article-no"));    
    $("#seq").val($(this).attr("article-no"));
    $("#commonForm").attr("method", "get").attr("action", viewpath).submit();
  });
  
  $(".writeBtn").click(function(){
    $("#commonForm").attr("method", "get").attr("action", writepath).submit();
  });
  
  $(".replyBtn").click(function(){
	  $("#seq").val("${article.seq}");
    $("#commonForm").attr("method", "get").attr("action", replypath).submit();
  });
  
  $(".newpage").click(function(){
	  $("#pg").val(1);
	  $("#key").val("");
	  $("#word").val("");
    $("#commonForm").attr("method", "get").attr("action", listpath).submit();
  });
  
  $(".mvpage").click(function(){
    $("#commonForm").attr("method", "get").attr("action", listpath).submit();
  });
  
  /* 댓글관련 */
  $("#memoBtn").click(function(){
	  var seq = "${article.seq}";
	  var mcontent = $("#mcontent").val();
	  $("#mcontent").val("");
	  var parameter = JSON.stringify({'seq' : seq, 'mcontent' : mcontent});
	  if(mcontent.trim().length != 0){
		  $.ajax({
			  url : '${root}/memo',
			  type : 'POST',
			  contentType : 'application/json;charset=UTF-8',
			  dataType : 'json',
			  data : parameter,
			  success : function(data){ // data는 목록을 가져와야한다.
				  makeList(data);
			  }
				
			  
		  });
	  }
  });
  
  $(document).on("click", ".memoDeleteBtn", function() {
  	if(confirm("정말삭제??")){
  		var mseq = $(this).parent("td").attr("memo-mseq");
  	  $.ajax({
          url : '${root}/memo/${article.seq}' + mseq,
          type : 'DELETE',
          contentType : 'application/json;charset=UTF-8',
          dataType : 'json',
          data : {'seq' : '${article.seq}'}
          success : function(data){
        	  makeList(data);
          }
  	  });
  	}
  });
  
  function getMemoList() {
	  $.ajax({
	        url : '${root}/memo/${article.seq}',
	        type : 'GET',
	        contentType : 'application/json;charset=UTF-8',
	        dataType : 'json',
	        success : function(data){ 
	          makeList(data);
	        }
	  });
  }
  
  function makeList(memos){
	  $("#memoview").empty();
	  var mlist = memos.memolist;
	  var output = '';
	  var len = mlist.length;
	  for(var i = 0; i < len; i++){
		  output += '<tr>';
		  output += ' <td width="150" height="70">' + mlist[i].name + '</td>';
		  output += ' <td>' + mlist[i].mcontent + '</td>';
		  output += ' <td width="200">' + mlist[i].mtime + '</td>';
		  if(mlist[i].id == '${userInfo.id}'){
			  output += '<td width="120">';
			  output += '<label>수정</label>';
			  output += '<label>삭제</label>';
			  output += '</td>';
		  }
		  output += '</tr>';
		  output += '<tr>';
		  output += '<td class="bg_board_title_02" height="1" colspan="11"';
		  output += '    style="overflow: hidden; padding: 0px"></td>';
		  output += '</tr>';
	  }
	  $("#memoview").append(output);
  }
  
});

</script>
<!-- title -->
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td><img src="${root}/img/board/m_icon_board.gif" width="9"
			height="9" border="0" align="absmiddle" style="margin-top: -2px">
		<b>자유게시판</b> &nbsp;<font style="font-size: 8pt">|</font>&nbsp; 자유로운 글을
		올리는 공간입니다<br>
		</td>
		<td align="right"></td>
	</tr>
	<tr>
		<td colspan="2" height="19"></td>
	</tr>
</table>

<table border="0" cellpadding="0" cellspacing="0" width="100%">
	<form name="bbsForm" id="bbsbbs" method="post"><input
		type="hidden" name="" value="">
	<tr>
		<td valign="bottom" nowrap>
		
		  <img src="${root}/img/board/btn_write_01.gif" class="writeBtn" 
		  width="64" height="22" border="0" align="absmiddle" alt="글쓰기">
			<img src="${root}/img/board/btn_reply.gif" class="replyBtn" width="40" height="22"
			border="0" align="absmiddle" alt="답글">
			<c:if test="${userInfo.id == article.id}">
				<img src="${root}/img/board/btn_modify.gif" class="modifyBtn" 
	      border="0" align="absmiddle" alt="글수정">
	      <!-- reply와 같은 화면출력하면 된다. -->
	      <img src="${root}/img/board/btn_delete.gif" class="deleteBtn"
	      border="0" align="absmiddle" alt="글삭제">
	      <!-- 삭제 confirm 출력, 답글이 없을 경우, 글번호 전송 -->
	      <!-- db삭제시 reboard 먼저 삭제 후 board 삭제 > delete delete update 필요(transaction) -->
			</c:if>
		</td>
		<td valign="bottom" width="100%" style="padding-left: 4px"></td>
		<td align="right" nowrap valign="bottom">
		  <label class="newpage">최신목록</label> <font color="#c5c5c5">|</font>
      <label class="mvpage">목록</label> <font color="#c5c5c5">|</font> 

		<a href="javascript:goBbsRead();"><img
			src="${root}/img/board/icon_up.gif" border="0" align="absmiddle"
			hspace="3">윗글</a> <font color="#c5c5c5">|</font> <a
			href="javascript:goBbsRead();">아랫글<img
			src="${root}/img/board/icon_down.gif" border="0" align="absmiddle"
			hspace="3"></a></td>
	</tr>
	<tr>
		<td colspan="3" height="5" style="padding: 0px"></td>
	</tr>
</table>

<table border="0" cellpadding="5" cellspacing="0" width="100%">
	<tr>
		<td class="bg_board_title_02" colspan="2" height="2"
			style="overflow: hidden; padding: 0px"></td>
	</tr>
	<tr height="28">
		<td class="bg_board_title" colspan="2" style="padding-left: 14px">
		<b><font class="text"> ${article.subject} </font></b></td>
	</tr>
	<tr>
		<td class="bg_board_title_02" colspan="2" height="1"
			style="overflow: hidden; padding: 0px"></td>
	</tr>
	<tr height="26">
		<td width="100%" style="padding-left: 14px"><font class="stext">번호
		:</font> <font class="text_commentnum">${article.seq}</font> &nbsp; <font
			class="stext">글쓴이 :</font> <a href="javascript:;"
			onClick="showSideView();" class="link_board_02">${article.name}</a><br>
		</td>
		<td style="padding-right: 14px" nowrap class="stext">조회 : <font
			class="text_commentnum">${article.hit}</font> &nbsp; 스크랩 : <font
			class="text_commentnum">0</font> &nbsp; 날짜 : <font
			class="text_commentnum">${article.logtime}</font></td>
	</tr>
	<tr>
		<td class="bg_board_title_02" colspan="2" height="1"
			style="overflow: hidden; padding: 0px"></td>
	</tr>
</table>

<table border="0" cellpadding="15" cellspacing="0" width="100%">
	<tr valign="top">
		<td bgcolor="#ffffff" width="100%" class="text"
			style="padding-bottom: 8px; line-height: 1.3" id="clix_content">



		<P>${article.content}</P>



		</td>
		<td nowrap valign="top" align="right" style="padding-left: 0px">

		</td>
	</tr>
</table>

<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td class="bg_board_title_02" height="1"
			style="overflow: hidden; padding: 0px"></td>
	</tr>
</table>

<!-- 하단 페이징 -->
<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr>
		<td colspan="3" height="5" style="padding: 0px"></td>
	</tr>
	<tr valign="top">
		<td nowrap>
		
		  <img src="${root}/img/board/btn_write_01.gif" class="writeBtn" 
		  width="64" height="22" border="0" align="absmiddle" alt="글쓰기">
			<img src="${root}/img/board/btn_reply.gif" class="replyBtn" 
			width="40" height="22" border="0" align="absmiddle" alt="답글">
		
		</td>
		<td style="padding-left: 4px" width="100%"><a href=""
			target="new"><img src="${root}/img/board/btn_print.gif"
			width="30" height="18" border="0" align="absmiddle" alt="인쇄"></a></td>

		<td align="right" nowrap>
		  <label class="newpage">최신목록</label> <font color="#c5c5c5">|</font>
		  <label class="mvpage">목록</label> <font color="#c5c5c5">|</font> 
		
		<a href="javascript:goBbsRead();"><img
			src="${root}/img/board/icon_up.gif" border="0" align="absmiddle"
			hspace="3">윗글</a> <font color="#c5c5c5">|</font> <a
			href="javascript:goBbsRead();">아랫글<img
			src="${root}/img/board/icon_down.gif" border="0" align="absmiddle"
			hspace="3"></a></td>
	</tr>
</table>
<br>
<!-- html5부터는 style을 inline쓰지 말것을 권고 자동완성 안된다 -->
<table cellpadding="5" cellspacing="5" border = "0" width="100%">
<tr>
  <td colspan="4">
  <textarea id="mcontent" style="resize: none;"rows="3" cols="150" placeholder="댓글입력"></textarea>
  <input type="button" id="memoBtn" value="작성">
  </td>
</tr>
<tbody id="memoview">

</tbody>
</table>
</body>
</html>
</c:if>