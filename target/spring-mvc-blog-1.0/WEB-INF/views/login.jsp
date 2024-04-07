<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Đăng nhập</title>
</head>
<body>
	<div id="login">
		<div class="container">
			<div id="login-row"
				class="row justify-content-center align-items-center">
				<div id="login-column" class="col-md-6">
					<div id="login-box" class="col-md-12">
						<form id="login-form" class="form"
							action="j_spring_security_check" method="post">
							<c:if test="${param.incorrectAccount != null}">
								<div class="alert alert-danger">
									Username or password incorrect
								</div>
							</c:if>
							<c:if test="${param.accessDenied != null}">
								<div class="alert alert-danger">
									Not permission
								</div>
							</c:if>
							<div class="form-group">
								<label for="username" class="text-info">Username:</label><br>
								<input type="text" name="j_username" id="userName"
									class="form-control">
							</div>
							<div class="form-group">
								<label for="password" class="text-info">Password:</label><br>
								<input type="password" name="j_password" id="password"
									class="form-control">
							</div>
							<div class="form-group">
								<label for="remember-me" class="text-info"><span>Remember
										me</span> <span><input id="remember-me" name="remember-me"
										type="checkbox"></span></label><br> <input type="submit"
									name="submit" class="btn btn-info btn-md" value="Login">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>