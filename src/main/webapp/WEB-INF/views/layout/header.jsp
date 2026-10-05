<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="header-inner">
    <div class="header-input">
        <input type="text" placeholder="SEARCH . . . ">
    </div>

    <nav class="header-nav">
        <a href="${pageContext.request.contextPath}/board/selectBoardView.do">BOARD</a>
    </nav>

    <a href="${pageContext.request.contextPath}/board/boardInsertView.do" class="header-write">WRITE +</a>
</div>