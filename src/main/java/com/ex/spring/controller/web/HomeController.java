package com.ex.spring.controller.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ex.spring.dto.CategoryDTO;
import com.ex.spring.dto.NewsDTO;
import com.ex.spring.service.ICategoryService;
import com.ex.spring.service.INewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller(value = "homeControllerOfWeb")
public class HomeController {
	@Autowired
	private INewsService newsService;
	@Autowired
	private ICategoryService categoryService;

	@RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
	public ModelAndView homePage() {
		List<NewsDTO> model = newsService.findAll();
		Map<String, String> categories = categoryService.findAll();
		ModelAndView mav = new ModelAndView("web/home");
		NewsDTO newest =  newsService.findOneByMaxId();
		mav.addObject("newest", newest);
		mav.addObject("model", model);
		mav.addObject("categories", categories);
        return mav;
	}

	@RequestMapping(value = "/dang-nhap", method = RequestMethod.GET)
	public ModelAndView loginPage() {
        return new ModelAndView("login");
	}

	@RequestMapping(value = "/dang-ky", method = RequestMethod.GET)
	public ModelAndView registerPage() {
        return new ModelAndView("register");
	}
	
	@RequestMapping(value = "/thoat", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if(authentication != null) {
			new SecurityContextLogoutHandler().logout(request, response, authentication);
		}
		return new ModelAndView("redirect:/trang-chu");
	}
	
	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public ModelAndView accessDenied() {
		return new ModelAndView("redirect:/trang-chu");
	}
}
