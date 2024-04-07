<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<c:url var="insertOrUpdateUrl" value="/quan-tri/bai-viet/chinh-sua"/>
<c:url var="newsAPIUrl" value="/api/admin/news"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách bài viết</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner ms-2 me-2">
        <div class="breadcrumbs ace-save-state" id="breadcrumbs">
            <ul class="breadcrumb">
                <li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Trang
                    chủ</a></li>
            </ul>
        </div>
        <c:if test="${not empty message}">
            <div class="alert alert-${message.alert}">
                    ${message.message}
            </div>
        </c:if>
        <form action="<c:url value='#'/>" method="get" id="formSubmit" style="margin: 10px;">
            <div class="widget-box table-filter">
                <div class="table-btn-controls">
                    <div class="pull-right tableTools-container">
                        <div class="dt-buttons btn-overlap btn-group">
                            <a flag="info"
                               class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
                               data-toggle="tooltip" title='Thêm bài viết'
                               href="<c:url value='${insertOrUpdateUrl}'/>"> <span>
										<i class="fa fa-plus-circle bigger-110 purple"></i>
								</span>
                            </a>
                            <button id="btnDelete" type="button"
                                    class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
                                    data-toggle="tooltip" title='Xóa bài viết'>
									<span> <i class="fa fa-trash-o bigger-110 pink"></i>
									</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th><input type="checkbox" name="checkAll" id="checkAll">
                    </th>
                    <th>Title</th>
                    <th>Short-description</th>
                    <th>Content</th>
                    <th>Edit</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${model.listResult}">
                    <tr>
                        <td><input type="checkbox" name="checkItem" id="checkItem" value="${item.id}"></td>
                        <td>${item.title}</td>
                        <td>${item.shortDescription}</td>
                        <td>${item.content}</td>
                        <td>
                            <c:url var="editNewsUrl" value="${insertOrUpdateUrl}">
                                <c:param name="id" value="${item.id}"/>
                            </c:url>
                            <a class="btn btn-sm btn-primary btn-edit"
                               data-toggle="tooltip" title="Cập nhật bài viết"
                               href='${editNewsUrl}'>
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <ul class="pagination" id="pagination"></ul>
            <input type="hidden" id="page" name="page">
            <input type="hidden" id="limit" name="limit">
        </form>
    </div>
</div>
<script type="text/javascript">
    var totalPages = ${model.totalPage};
    var currentPage = ${model.page};
    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPages,
            visiblePages: 10,
            startPage: currentPage,
            onPageClick: function (event, page) {
                if (currentPage != page) {
                    $('#limit').val(2);
                    $('#page').val(page);
                    $('#formSubmit').submit();
                }
            }
        });
    });
    jQuery(function ($) {
        $("#btnDelete").on(ace.click_event, function () {
            var data = {};
            var dataArray = $('tbody input[type=checkbox]:checked').map(function () {
                return $(this).val();
            }).get();
            if (dataArray.length) {
                bootbox.confirm("Are you sure?", function (result) {
                    if (result) {
                        data['ids'] = dataArray;
                        deleteNews(data);
                        console.log(data);
                    }
                });
            }
        });
    });


    // $('#btnDelete').click(function () {
    //
    //     var data = {};
    //     var dataArray = $('tbody input[type=checkbox]:checked').map(function () {
    //         return $(this).val();
    //     }).get();
    //     data['ids'] = dataArray;
    //     deleteNews(data);
    //     console.log(data);
    // });

    function deleteNews(data) {
        $.ajax({
            url: '${newsAPIUrl}',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (rs) {
                window.location.href = "/quan-tri/bai-viet/danh-sach?page=1&limit=2&message=delete_news";
                console.log(rs);
            },
            error: function (err) {
                console.log(err);
            }
        });
    }

    $("#checkAll").click(function () {
        $("input[type=checkbox]").prop('checked', $(this).prop('checked'));
    });

</script>
</body>
</html>