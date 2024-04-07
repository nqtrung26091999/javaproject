<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/common/taglib.jsp" %>
<!-- Side widgets-->
<div class="col-lg-4">
  <!-- Search widget-->
  <div class="card mb-4">
    <div class="card-header">Tìm kiếm</div>
    <div class="card-body">
      <div class="input-group">
        <input class="form-control" type="text" placeholder="Nhập tên bài viết..."
               aria-label="Enter search term..." aria-describedby="button-search"/>
        <button class="btn btn-primary" id="button-search" type="button">Go!</button>
      </div>
    </div>
  </div>
  <!-- Categories widget-->
  <div class="card mb-4">
    <div class="card-header">Thể loại</div>
    <div class="card-body">
      <div class="row">
        <div class="col-sm-6">
          <ul class="list-unstyled mb-0">
            <c:forEach items="${categories}" var="item">
              <li class="mb-2"><a class="badge bg-secondary text-decoration-none link-light" href="#!"><c:out value="${item.value}"/></a></li>
            </c:forEach>
          </ul>
        </div>
      </div>
    </div>
  </div>
<%--  <!-- Side widget-->--%>
<%--  <div class="card mb-4">--%>
<%--    <div class="card-header">Side Widget</div>--%>
<%--    <div class="card-body">You can put anything you want inside of these side widgets. They are easy to use,--%>
<%--      and feature the Bootstrap 5 card component!--%>
<%--    </div>--%>
<%--  </div>--%>
</div>