<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Đăng ký người dùng</title>
</head>
<body>
<div id="login">
    <div class="container">
        <div id="login-row"
             class="row justify-content-center align-items-center">
            <div id="login-column" class="col-md-6">
                <div id="login-box" class="col-md-12">
                    <form id="login-form" class="form" action="#">
                        <div class="form-group">
                            <label for="username" class="text-info">username:</label><br>
                            <input type="text" name="username" id="username"
                                   class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="fullName" class="text-info">Full name:</label><br>
                            <input type="text" name="fullName" id="fullName"
                                   class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="password" class="text-info">Password:</label><br>
                            <input type="password" name="password" id="password"
                                   class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="rePassword" class="text-info">Re-Password:</label><br>
                            <input type="password" name="rePassword" id="rePassword"
                                   class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="remember-me" class="text-info">
                                <span>Tôi đồng ý với các điều khoản</span>
                                 
                                <span>
                                    <input id="remember-me" name="remember-me" type="checkbox">
                                </span>
                            </label>
                            <br>
                            <input type="submit" id="submit" class="btn btn-info btn-md" value="Register">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $("#submit").on("click", (e) => {
        e.preventDefault();
        var validation = {};
        var data = {};
        var formData = $("#login-form").serializeArray();
        $.each(formData, function (i, v) {
            data["" + v.name + ""] = v.value;
        });
        if (data) {
            $("div .alert").remove();
            if (data['remember-me'] === undefined || data['remember-me'] === "") {
                validation['remember-me'] = "<div class='alert alert-danger'>" +
                    "Vui lòng đồng ý với các điều khoản của chúng tôi" +
                    "</div>";
            }
            if (data['username'] === undefined || data['username'] === "") {
                validation['username'] = "<div class='alert alert-danger'>" +
                    "Vui lòng nhập username" +
                    "</div>";
            }
            if (data['password'] === undefined || data['password'] === "") {
                validation['password'] = "<div class='alert alert-danger'>" +
                    "Vui lòng nhập password" +
                    "</div>";
            }
            if (data['rePassword'] === undefined || data['rePassword'] === "") {
                validation['rePassword'] = "<div class='alert alert-danger'>" +
                    "Vui lòng nhập re-password" +
                    "</div>";
            }
            if (data['fullName'] === undefined || data['fullName'] === "") {
                validation['fullName'] = "<div class='alert alert-danger'>" +
                    "Vui lòng nhập full name" +
                    "</div>";
            }
            if (!jQuery.isEmptyObject(validation)) {
                $.each(validation, (i, v) => {
                    $("#login-form").prepend(v);
                });
                return;
            }
            handleRegister(data);
        }
        console.log(data)
    });
    function handleRegister(data) {
        $.ajax({
           url: "/api/register",
            type: "post",
            contentType: "application/json",
            data: JSON.stringify(data),
            dataType: "json",
            success: rs => {
                window.location.href = "/dang-nhap"
            },
            error: err => {
                console.log(err)
            }
        });
    }
</script>
</body>
</html>