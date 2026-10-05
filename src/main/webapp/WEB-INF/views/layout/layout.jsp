<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><tiles:getAsString name="title"/></title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common/layout.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/board/board.css">
    <link rel="icon" href="${pageContext.request.contextPath}/images/favicon.ico">
</head>

<body>

<div class="layout">
    <aside class="aside">
        <tiles:insertAttribute name="aside"/>
    </aside>

    <div class="content">

        <header class="header">
            <tiles:insertAttribute name="header"/>
        </header>

        <main class="body">
            <tiles:insertAttribute name="body"/>
        </main>

    </div>

</div>

</body>
</html>