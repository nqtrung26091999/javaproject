<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin</title>
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
                <li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a>
                </li>
                <li class="active">Dashboard</li>
            </ul>
            <!-- /.breadcrumb -->

            <div class="nav-search" id="nav-search">
                <form class="form-search">
							<span class="input-icon"> <label for="nav-search-input"></label><input type="text"
                                                                                                   placeholder="Search ..."
                                                                                                   class="nav-search-input"
                                                                                                   id="nav-search-input"
                                                                                                   autocomplete="off"/> <i
                                    class="ace-icon fa fa-search nav-search-icon"></i>
							</span>
                </form>
            </div>
            <!-- /.nav-search -->
        </div>
        <div class="page-content">
        </div>
        <!-- /.page-content -->
    </div>
</div>
<!-- /.main-content -->
</body>

</html>