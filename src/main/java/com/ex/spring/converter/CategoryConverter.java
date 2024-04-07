package com.ex.spring.converter;

import com.ex.spring.dto.NewsDTO;
import com.ex.spring.entity.CategoryEntity;
import com.ex.spring.dto.CategoryDTO;
import com.ex.spring.entity.NewsEntity;
import org.springframework.stereotype.Component;

@Component
public class CategoryConverter {
    public CategoryDTO toDto(CategoryEntity entity) {
        CategoryDTO result = new CategoryDTO();
        result.setId(entity.getId());
        result.setName(entity.getName());
        result.setCode(entity.getCode());
        return result;
    }

    public CategoryEntity toEntity(CategoryDTO dto) {
        CategoryEntity result = new CategoryEntity();
        result.setCode(dto.getCode());
        result.setName(dto.getName());
        return result;
    }

    public CategoryEntity toEntity(CategoryEntity entity, CategoryDTO dto) {
        entity.setCode(dto.getCode());
        entity.setName(dto.getName());
        return entity;
    }
}
