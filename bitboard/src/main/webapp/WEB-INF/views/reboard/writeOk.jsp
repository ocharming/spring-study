<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp" %>

<style type="text/css">
        body {
            padding-top: 100px;
            padding-bottom: 40px;
            background-color: #ecf0f1;
        }
        .info-header {
            max-width: 500px;
            padding: 15px 29px 25px;
            margin: 0 auto;
            background-color: #18bc9c;
            color: white;
            text-align: left;
            -webkit-border-radius: 15px 15px 0px 0px;
            -moz-border-radius: 15px 15px 0px 0px;
            border-radius: 15px 15px 0px 0px;
            -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
            -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
            box-shadow: 0 1px 2px rgba(0,0,0,.05);
        }
        .info-footer {
            max-width: 500px;
            margin: 0 auto 20px;
            padding-left: 10px;
        }
        .info-body {
            max-width: 500px;
            padding: 29px;
            margin: 0 auto 20px;
            background-color: #fff;
            -webkit-border-radius: 0px 0px 15px 15px;
            -moz-border-radius: 0px 0px 15px 15px;
            border-radius: 0px 0px 15px 15px;
            -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
            -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
            box-shadow: 0 1px 2px rgba(0,0,0,.05);
        }
        .info-heading {
            margin-bottom: 15px;
        }
        .info-btn {
            text-align: center;
            padding-top: 20px;
        }

    </style>
<div class="container">

    <!-- header -->
    <div class="info-header">
        <h2 class="info-heading">쓰기 완료</h2>
    </div>

    <!-- body -->
    <div class="info-body">
<c:choose>
  <c:when test="${errorMsg != null }">
    <h3>쓰기 에러</h3>
    <p>${errorMsg }</p>
  </c:when>
<c:otherwise>
    <script type="text/javascript">
      control="${root}/reboard";
      
      initVars();
      $(document).ready(function() {
        
        $("#viewBtn").click(function() {
          $("#seq").val("${wseq}");
          $("#commonForm").attr("method", "get").attr("action", viewpath).submit();
        });
        
        $("#listBtn").click(function() {
          $("#commonForm").attr("method", "get").attr("action", listpath).submit();
        });
        
      });
    </script>
    <h3>글쓰기 완료</h3>
    <p>게시물 등록이 완료되었습니다.</p>
    <div class="row info-btn">
      <button class="btn btn-large btn-default" id ="listBtn">홈으로 이동</button>
      <button class="btn btn-large btn-default" id ="viewBtn">새글 확인</button>
    </div>
  </c:otherwise>
</c:choose>
    </div>
    <!-- footer -->
    <div class="info-footer">
        <p>© BitCamp 2018.</p>
    </div>
</div>

</body>
</html>