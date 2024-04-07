<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="newsAPIUrl" value="/api/admin/news/post"/>
<html>
<head>
    <title>Chỉnh sửa bài viết</title>
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
                    <form:form class="form-horizontal" role="form" id="formSubmit" modelAttribute="model"
                               accept-charset="utf-8">
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"
                                   for="thumbnail"> Ảnh bài viết </label>
                            <div class="col-sm-3">
                                <input type="file" id="thumbnail" name="thumbnail">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"
                                   for="thumbnail"> Hình ảnh </label>
                            <div class="col-sm-3">
                                <c:if test="${model.exportThumbnail == null}">
                                    <img src="<c:url value="/template/default-image.jpg"/>" id="imgThumbnail"
                                         height="250" width="350" alt="">
                                </c:if>
                                <c:if test="${model.exportThumbnail != null}">
                                    <img src="<c:url value="data:image/jpeg;base64, ${model.exportThumbnail}"/>"
                                         id="imgThumbnail" height="250" width="350" alt="">
                                </c:if>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"
                                   for="cateCode"> Thể loại </label>
                            <div class="col-sm-9">
                                <label>
                                    <select>
                                        <option selected></option>
                                        <c:forEach items="${categories}" var="category">
                                            <option value="<c:out value="${category.key}"/>"
                                                    <c:if test="${model.category.code} == ${category.key}">
                                                        selected
                                                    </c:if>
                                            ><c:out value="${category.value}"/></option>
                                        </c:forEach>
                                    </select>
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"
                                   for="title"> Tiêu đề </label>
                            <div class="col-sm-9">
                                <form:input path="title" cssClass="col-xs-10 col-sm-5"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"
                                   for="shortDescription"> Mô tả ngắn </label>
                            <div class="col-sm-9">
                                <form:textarea path="shortDescription" id="shortDescription" rows="5" cols="50"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"
                                   for="content"> Nội dung </label>
                            <div class="col-sm-9">
                                <form:textarea path="content" id="content" rows="5" cols="50"/>
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
    jQuery(function ($) {
        $('#thumbnail').ace_file_input({
            no_file: 'No File ...',
            btn_choose: 'Choose',
            btn_change: 'Change',
            droppable: false,
            onchange: null,
            thumbnail: false,
            //| true | large
            //whitelist:'gif|png|jpg|jpeg'
            //blacklist:'exe|php'
            //onchange:''
            //
        });
        //pre-show a file name, for example a previously selected file
        //$('#id-input-file-1').ace_file_input('show_file_list', ['myfile.txt'])
    });

    $('#thumbnail').on('change', function (e) {
        e.preventDefault();
        var formData = new FormData();
        var file = $('input[name="thumbnail"]')[0].files[0];
        formData.append("file", file);
    })

    $('#btnAddOrUpdate').click(function (e) {
        e.preventDefault();
        var data = {};
        var file = $('input[name="thumbnail"]')[0].files[0];
        var formData = $("#formSubmit").serializeArray();
        $.each(formData, (i, v) => {
            data["" + v.name + ""] = v.value;
        });
        data["thumbnail"] = file;
        console.log(data);
        updateNews(data);
    });

    function updateNews(data) {
        $.ajax({
            url: "${newsAPIUrl}",
            type: "POST",
            contentType: "application/json",
            dataType: "json",
            data: JSON.stringify(data),
            success: (rs) => {
                if (data["thumbnail"]) {
                    uploadFile(rs, data["thumbnail"]);
                }
                window.location.href = "/quan-tri/bai-viet/danh-sach?page=1&limit=2&message=insert_news"
            },
            error: (e) => {
                console.log(e)
            }
        });
    }

    function uploadFile(rs, file) {
        var formData = new FormData();
        formData.append("thumbnail", file);
        formData.append("id", rs["id"]);
        $.ajax({
            url: "/api/upload",
            type: "POST",
            method: "POST",
            enctype: "multipart/form-data",
            contentType: false,
            processData: false,
            cache: false,
            data: formData,
            success: (rs) => {
                console.log(rs)
            },
            error: (e) => {
                console.log(e)
            }
        });
    }

    $("#thumbnail").on('change', function (e) {
        e.preventDefault();
        readUrl(this);
    })

    function readUrl(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#imgThumbnail').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
</body>
</html>