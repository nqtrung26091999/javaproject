package com.ex.spring.controller.web;

import com.ex.spring.dto.NewsDTO;
import com.ex.spring.service.ICategoryService;
import com.ex.spring.service.INewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@Controller(value = "newsControllerOfWeb")
public class NewsController {
    @Autowired
    private INewsService newsService;
    @Autowired
    private ICategoryService categoryService;

    @RequestMapping(value = "/bai-viet", method = RequestMethod.GET)
    public ModelAndView postPage(@RequestParam(value = "id") Long id) {
        NewsDTO model = newsService.findOne(id);
        ModelAndView mav = new ModelAndView("/web/news/post");
        Map<String, String> categories = categoryService.findAll();
        mav.addObject("categories", categories);
        mav.addObject("model", model);
        return mav;
    }
}
