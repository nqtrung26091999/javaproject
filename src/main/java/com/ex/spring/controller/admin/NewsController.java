package com.ex.spring.controller.admin;

import com.ex.spring.service.INewsService;
import com.ex.spring.dto.NewsDTO;
import com.ex.spring.service.ICategoryService;
import com.ex.spring.util.MessageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller(value = "newsControllerOfAdmin")
public class NewsController {

    @Autowired
    private INewsService newsService;

    @Autowired
    private ICategoryService categoryService;

    @Autowired
    private MessageUtils messageUtils;

    @RequestMapping(value = "/quan-tri/bai-viet/danh-sach", method = RequestMethod.GET)
    public ModelAndView showList(@RequestParam("page") int page, @RequestParam("limit") int limit, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("/admin/news/list");
        Pageable pageable = new PageRequest(page - 1, limit);
        NewsDTO dto = new NewsDTO();
        dto.setPage(page);
        dto.setLimit(limit);
        dto.setTotalItem(newsService.getTotalItem());
        dto.setTotalPage((int) Math.ceil((double) dto.getTotalItem() / dto.getLimit()));
        dto.setListResult(newsService.findAll(pageable));
        mav.addObject("message", handleMessage(request.getParameter("message")));
        mav.addObject("model", dto);
        return mav;
    }

    @RequestMapping(value = "/quan-tri/bai-viet/chinh-sua", method = RequestMethod.GET)
    public ModelAndView editNews(@RequestParam(value = "id", required = false) Long id, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/news/edit");
        NewsDTO model = new NewsDTO();
        if (id != null) {
            model = newsService.findOne(id);
        }
        mav.addObject("message", handleMessage(request.getParameter("message")));
        mav.addObject("model", model);
        mav.addObject("categories", categoryService.findAll());
        return mav;
    }

    private Map<String, String> handleMessage(String message) {
        Map<String, String> messageAndAlert = new HashMap<>();
        if (message != null) {
            messageAndAlert = messageUtils.getMessage(message);
        }
        return messageAndAlert;
    }
}
