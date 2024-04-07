<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Trang chủ</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="<c:url value='/template/web/assets/favicon.ico'/>"/>
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="<c:url value='/template/web/css/styles.css'/>" rel="stylesheet" type="text/css"/>
</head>
<body>
<%-- Header --%>
<%@include file="/common/web/header.jsp" %>

<%-- Content --%>
<div class="container mt-4">
    <div class="row">
        <dec:body/>
        <%@include file="/common/web/side-widget.jsp" %>
    </div>
</div>

<%-- Footer --%>
<%@include file="/common/web/footer.jsp" %>

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="<c:url value='/template/web/js/scripts.js'/>"></script>
</body>
</html>