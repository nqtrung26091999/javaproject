package com.ex.spring.api.admin;

import com.ex.spring.dto.CategoryDTO;
import com.ex.spring.dto.NewsDTO;
import com.ex.spring.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController(value = "categoryAPI")
public class CategoryAPI {
    @Autowired
    private ICategoryService categoryService;

    @PostMapping(value = "/api/admin/category/post")
    public CategoryDTO updateCategory(@RequestBody CategoryDTO categoryDTO) {
        return categoryService.save(categoryDTO);
    }

    @DeleteMapping("/api/admin/category")
    public void deleteCategory(@RequestBody NewsDTO newsDTO) {
        categoryService.delete(newsDTO.getIds());
    }
}
