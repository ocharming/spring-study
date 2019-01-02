<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp"%>
<script type="text/javascript">
  $(document).ready(function() {
    control="${root}/reboard";
    
    initVars();
    $("#listBtn").click(function() {
      $("#commonForm").attr("method", "get").attr("action", listpath).submit();
    });
    
    $('#writeBtn').click(function() {
      writeArticle();
    });
    
    function writeArticle(){
      if(document.writeForm.subject.value == ""){
        alert("제목을 입력하세요");
        return;
      }else if(document.writeForm.content.value == ""){
        alert("내용을 입력하세요");
        return;
      }else{
        document.writeForm.action = "${root}/reboard/write";
        document.writeForm.submit();
      }
    }
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


            <div class="table-responsive">
              <form id="writeForm" name="writeForm" method="post">
			          <input type="hidden" name="bcode" value="${bcode }">
			          <input type="hidden" name="pg" value="1">
			          <input type="hidden" name="key" value="">
			          <input type="hidden" name="word" value="">
                <table class="table table-bordered">
                    <colgroup>
                        <col width="120">
                        <col width="*">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th class="text-center">제목</th>
                        <td class="text-left">
                          <input type="text" name="subject" class="form-control" placeholder="글 제목">
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center">내용</th>
                        <td class="text-left">                        
                          <textarea class="form-control" name="content" placeholder="글 내용" rows="10" draggable="false"></textarea>
                        </td>
                    </tr>
                    </tbody>
                </table>
              </form>
            </div>

            
            <div class="pull-right">
                <a href="#" id="writeBtn" class="btn btn-success btn-default">저장</a>
                <button id="listBtn" type="button" class="btn btn-large btn-default">목록</button>
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