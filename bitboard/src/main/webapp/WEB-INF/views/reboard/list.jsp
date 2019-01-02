<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp"%>
<!-- Container ======================================================================================= -->
<script type="text/javascript">
  $(document).ready(function() {
    control="${root}/reboard";
    
    initVars();
    $(".writeBtn").click(function() {
      $("#commonForm").attr("method", "get").attr("action", writepath).submit();
    });
    $(".posting").click(function() {
      $("#seq").val($(this).attr("article-no"));
      $("#commonForm").attr("method", "get").attr("action", viewpath).submit();
    });
    
    $("#firstpage").click(function() {
      $("#pg").val("1");
      $("#key").val("");
      $("#word").val("");
      $("#commonForm").attr("method", "get").attr("action", listpath).submit();
    });
    
    $(".mvpage").click(function() {
      $("#pg").val($(this).attr("move-page-no"));
      $("#commonForm").attr("method", "get").attr("action", listpath).submit();
    });
    
    $("#searchBtn").click(function() {
      $("#pg").val("1");
      $("#key").val($("#skey").val());
      $("#word").val($("#sword").val());
      $("#commonForm").attr("method", "get").attr("action", listpath).submit();
    });
    
    $("#myBtn").click(function() {
        $("#pg").val("1");
        $("#key").val("id");
        $("#word").val("${user.username}");
        $("#commonForm").attr("method", "get").attr("action", listpath).submit();
    });
  });
</script>
<div class="container">
  <div class="row">
        <div class="col-lg-12">
            <!-- ★★★ Tab Panel -->
            <div id="communityList" class="tab-content">
                <!-- ★★★ 가입 커뮤니티 -->
                <div class="tab-pane fade active in" id="joined">
                    <div class="page-header">
                        <h2 id="container">${bname}</h2>
                    </div>
                    
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <form class="form-search">
                            <div class="col-xs-2">
	                            <select class="form-control" name="key" id="skey" class="inp">
	                              <option value="subject">글제목</option>
	                              <option value="name">글쓴이</option>
	                              <option value="seq">글번호</option>
	                            </select>
                            </div>
                            <div class="col-xs-8">
                              <div class="input-group">
                                <input type="text" class="form-control" placeholder="검색하세요..." id="sword"> 
                                <span class="input-group-btn">
                                    <button type="button" id="searchBtn" class="btn btn-primary">검색</button>
                                </span>
                              </div>
                            </div>
                            <div class="col-xs-1 text-center">
                              <button type="button" id="myBtn" class="btn btn-info">내글보기</button>
                            </div>
                            <div class="col-xs-1 text-center">
                              <button type="button" class="btn btn-info writeBtn">글쓰기</button>
                            </div>
                            </form>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                              <th class="text-right" colspan="5">새글 ${navigator.newArticleCount } / 전체 ${navigator.totalArticleCount }</th>
                            </tr>
                            <tr>
                                <th width="50" class="text-center">번호</th>
                                <th class="text-center">제목</th>
                                <th width="150" class="text-center">글쓴이</th>
                                <th width="50" class="text-center">조회</th>
                                <th width="120" class="text-center">날짜</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="article" items="${articlelist }">
                              <tr class="posting" article-no="${article.seq }">
                                <td align="center" class="text-cente">${article.seq }</td>
                                <td>
                                  <img src="${root }/img/blank.gif" height="1" width="${article.lev * 10 }">
                                  <a class="posting" href="#">${article.subject.replace("<", "&lt;") }</a>
                                </td>
	                                <td>${article.name }</td>
	                                <td>${article.hit }</td>
	                                <td>${article.logtime }</td>
                                </tr>
                            </c:forEach>
                            <tr>
	                            <td class="text-center" colspan="4">${navigator.navigator }</td>
	                            <td style="vertical-align: middle;" class="text-center"><nav><b>${navigator.pageNo }</b> / ${navigator.totalPageCount } pages</nav></td>
	                          </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
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