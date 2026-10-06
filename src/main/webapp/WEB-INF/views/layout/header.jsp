<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="header-inner">
    <nav class="header-nav left">
        <c:set var="uri" value="${requestScope['javax.servlet.forward.request_uri']}" />
        <a href="${pageContext.request.contextPath}/board/selectBoardView.do"
            class="${fn:contains(uri, '/board/selectBoardView.do') || fn:contains(uri, '/board/selectBoardDetailView.do')
            ? 'active' : '' }">BOARD</a>
        <a href="${pageContext.request.contextPath}/board/insertBoardView.do"
           class="header-write ${fn:contains(uri, '/board/insertBoardView.do')
           ? 'active' : ''}">WRITE +</a>
    </nav>
    <nav class="header-nav right">
        <a href="#">LOGIN</a>
    </nav>
</div>