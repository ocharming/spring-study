<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="bcode" value="${param.bcode }" />
<c:set var="ccode" value="${param.ccode }" />
<c:set var="pg" value="${param.pg }" />
<c:set var="key" value="${param.key }" />
<c:set var="word" value="${param.word }" />
<c:set var="seq" value="${param.seq }" />
<sec:authentication var="user" property="principal"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>BitCamp</title>
    <link href="${root}/css/bootstrap.css" rel="stylesheet">
    <link href="${root}/css/bootswatch.min.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="${root}/js/jquery-2.1.0.js"></script>
    <script src="${root}/js/bootstrap.min.js"></script>
    <script src="${root}/js/bootswatch.js"></script>
    <script src="${root}/js/board.js"></script>
</head>
<body>

<!-- Main Navigation ========================================================================================== -->
<div class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${root}/member/list">BitCamp</a>
        </div>
        <div class="navbar-collapse collapse navbar-responsive-collapse">
            <ul class="nav navbar-nav">
              <c:choose>
                <c:when test="${bcode eq null }">
                  <li class="active">
                </c:when>
                <c:otherwise>
                  <li>
                </c:otherwise>
              </c:choose>
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">회원관리</a>
                  <ul class="dropdown-menu">
                        <li><a href="${root}/member/insert">회원등록</a></li>
                        <li><a href="${root}/member/list">회원목록</a></li>
                    </ul>
                </li>
                <c:set var="idx" value="0" />
                <c:forEach var="board" items="${menu }" varStatus="i">
                  <c:if test="${board.ccode != idx}">
                    <c:choose>
                      <c:when test="${board.ccode == ccode }">
                        <li class="active">
                      </c:when>
                      <c:otherwise>
                        <li>
                      </c:otherwise>
                    </c:choose>
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">${board.cname }</a>
                    <c:set var="idx" value="${board.ccode }" />
                    <ul class="dropdown-menu">
                  </c:if>
                  <li><a href="${root}/${board.control}/list?bcode=${board.bcode }&ccode=${board.ccode }&pg=1&key=&word=">${board.bname }</a></li>
                  <c:if test="${i.index < menu.size() - 1 }">
                    <c:if test="${idx !=  menu.get(i.index + 1).ccode}">
                      </ul>
                    </c:if>
                  </c:if>
                </c:forEach>
                </li>
                </ul>
            </ul>
            <sec:authorize access="isAnonymous()">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${root}/">로그인 </a></li>
            </ul>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${root}/logout">${user.username}님 로그아웃 </a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">설정 <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="${root}/member/view?id=${user.username}">개인정보</a></li>
                    </ul>
                </li>
            </ul>
            </sec:authorize>
        </div>
    </div>
</div>
<form id="commonForm" method="get" action="">
  <input type="hidden" id="bcode" name="bcode" value="${bcode }">
  <input type="hidden" id="pg" name="pg" value="${pg }">
  <input type="hidden" id="key" name="key" value="${key }">
  <input type="hidden" id="word" name="word" value="${word }">
  <input type="hidden" id="seq" name="seq" value="">
</form>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-lg modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>