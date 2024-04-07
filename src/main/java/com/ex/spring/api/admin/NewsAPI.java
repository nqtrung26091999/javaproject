package com.ex.spring.api.admin;

import com.ex.spring.dto.NewsDTO;
import com.ex.spring.service.INewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.IOException;

@RestController(value = "newsAPIOfAdmin")
public class NewsAPI {

    @Autowired
    private INewsService newsService;

    @PostMapping(value = "/api/admin/news/post")
    public NewsDTO updateNews(@RequestBody NewsDTO newsDTO) {
        return newsService.save(newsDTO);
    }

    @PostMapping(value = "/api/upload")
    public void upload(MultipartHttpServletRequest request) throws IOException {
        newsService.uploadFile(request.getFile("thumbnail"), Long.valueOf(request.getParameter("id")));
    }

    @DeleteMapping("/api/admin/news")
    public void deleteNews(@RequestBody NewsDTO newsDTO) {
        newsService.delete(newsDTO.getIds());
    }
}
