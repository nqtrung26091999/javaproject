<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home Page</title>
</head>
<body>
<!-- Blog entries-->
<div class="col-lg-8">
    <!-- Featured blog post-->
    <div class="card mb-4">
        <a href="#!"><img class="card-img-top" src="data:image/jpeg;base64, ${newest.exportThumbnail}"
                          alt="..." height="400"/></a>
        <div class="card-body">
            <div class="small text-muted">${newest.createdDate}</div>
            <h2 class="card-title">${newest.title}</h2>
            <p class="card-text">${newest.shortDescription}</p>
            <a class="btn btn-primary" href="<c:url value="/bai-viet?id=${newest.id}"/>">Đọc bài viết →</a>
        </div>
    </div>
    <!-- Nested row for non-featured blog posts-->
    <div class="row">
        <c:forEach var="item" items="${model}">
            <div class="col-lg-6">
                <!-- Blog post-->
                <div class="card mb-4">
                    <a href="#!"><img class="card-img-top"
                                      src="data:image/jpeg;base64, ${item.exportThumbnail}" alt="..." height="220"/></a>
                    <div class="card-body">
                        <div class="small text-muted">${item.createdDate}</div>
                        <h2 class="card-title h4">${item.title}</h2>
                        <p class="card-text">${item.shortDescription}</p>
                        <a class="btn btn-primary" href="<c:url value="/bai-viet?id=${item.id}"/>">Đọc bài viết →</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <!-- Pagination-->
    <nav aria-label="Pagination">
        <hr class="my-0"/>
        <ul class="pagination justify-content-center my-4">
            <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">Newer</a>
            </li>
            <li class="page-item active" aria-current="page"><a class="page-link" href="#!">1</a></li>
            <li class="page-item"><a class="page-link" href="#!">2</a></li>
            <li class="page-item"><a class="page-link" href="#!">3</a></li>
            <li class="page-item disabled"><a class="page-link" href="#!">...</a></li>
            <li class="page-item"><a class="page-link" href="#!">15</a></li>
            <li class="page-item"><a class="page-link" href="#!">Older</a></li>
        </ul>
    </nav>
</div>
</body>
</html>