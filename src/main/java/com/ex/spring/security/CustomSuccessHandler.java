package com.ex.spring.security;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ex.spring.util.SecurityUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class CustomSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException {
		String targetUrl = determineTargetUrl(authentication);
		if (response.isCommitted()) {
			return;
		}
		redirectStrategy.sendRedirect(request, response, targetUrl);
	}

	private String determineTargetUrl(Authentication authentication) {
		String url = "";
		// if is ADMIN so redirect to controller: /quan-tri/trang-chu
		// if is USER so redirect to controller: /trang-chu
		List<String> roles = SecurityUtils.getAuthorities();
		if (isAdmin(roles)) {
			url = "/quan-tri/trang-chu";
		} else if (isUser(roles)) {
			url = "/trang-chu";
		}
		return url;
	}

	private boolean isAdmin(List<String> roles) {
		if (roles.contains("ADMIN")) {
			return true;
		} else {
			return false;
		}
	}

	private boolean isUser(List<String> roles) {
		if (roles.contains("USER")) {
			return true;
		} else {
			return false;
		}
	}

	public RedirectStrategy getRedirectStrategy() {
		return redirectStrategy;
	}

	public void setRedirectStrategy(RedirectStrategy redirectStrategy) {
		this.redirectStrategy = redirectStrategy;
	}
}
