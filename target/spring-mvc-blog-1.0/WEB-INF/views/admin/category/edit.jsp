<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:url var="categoryAPIUrl" value="/api/admin/category/post"/>
<html>
<head>
    <title>Chỉnh sửa thể loại</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs', 'fixed')
                } catch (e) {
                }
            </script>
            <ul class="breadcrumb">
                <li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a></li>
                <li><a href="#">Forms</a></li>
                <li class="active">Form Elements</li>
            </ul>
        </div>
        <div class="page-content">
            <div class="page-header">
                <h1>
                    Form Elements <small> <i
                        class="ace-icon fa fa-angle-double-right"></i> Common form
                    elements and layouts
                </small>
                </h1>
            </div>
            <c:if test="${not empty message}">
                <div class="alert alert-${message.alert}">
                        ${message.message}
                </div>
            </c:if>
            <div class="row">
                <div class="col-xs-12">
                    <%--@elvariable id="model" type=""--%>
                    <form:form class="form-horizontal" role="form" id="formSubmit" modelAttribute="model" accept-charset="utf-8">
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"
                                   for="name"> Tên thể loại </label>
                            <div class="col-sm-3">
                                <form:input path="name" cssClass="col-xs-10 col-sm-5"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"
                                   for="code"> Code </label>
                            <div class="col-sm-3">
                                <form:input path="code" cssClass="col-xs-10 col-sm-5"/>
                            </div>
                        </div>
                        <div class="clearfix form-actions">
                            <div class="col-md-offset-3 col-md-9">
                                <button class="btn btn-info" type="button" id="btnAddOrUpdate">
                                    <i class="ace-icon fa fa-check bigger-110"></i> Submit
                                </button>
                                <button class="btn" type="reset">
                                    <i class="ace-icon fa fa-undo bigger-110">
                                    </i> Reset
                                </button>
                            </div>
                        </div>
                        <form:input path="id" type="hidden" cssClass="col-xs-10 col-sm-5"/>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $('#btnAddOrUpdate').click(function (e) {
        e.preventDefault();
        var data = {};
        var formData = $("#formSubmit").serializeArray();
        $.each(formData, (i, v) => {
            data[""+v.name+""] = v.value;
        });
        update(data);
    });

    function update(data) {
        $.ajax({
            url: "${categoryAPIUrl}",
            type: "POST",
            contentType: "application/json",
            dataType: "json",
            data: JSON.stringify(data),
            success: (rs) => {
                window.location.href = "/quan-tri/the-loai/danh-sach?page=1&limit=2&message=insert_news"
            },
            error: (e) => {
                console.log(e)
            }
        });
    }
</script>
</body>
</html>