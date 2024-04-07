package com.ex.spring.service.impl;

import com.ex.spring.converter.CategoryConverter;
import com.ex.spring.dto.CategoryDTO;
import com.ex.spring.entity.CategoryEntity;
import com.ex.spring.repository.CategoryRepository;
import com.ex.spring.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CategoryService implements ICategoryService {

    @Autowired
    CategoryRepository categoryRepository;

    @Autowired
    CategoryConverter converter;

    public Map<String, String> findAll() {
        Map<String, String> models = new HashMap<>();
        List<CategoryEntity> entities = categoryRepository.findAll();
        for (CategoryEntity entity : entities) {
            models.put(entity.getCode(), entity.getName());
        }
        return models;
    }

    @Override
    public List<CategoryDTO> findAll(Pageable pageable) {
        List<CategoryEntity> entities = categoryRepository.findAll(pageable).getContent();
        List<CategoryDTO> result = new ArrayList<>();
        for (CategoryEntity entity : entities) {
            CategoryDTO dto = converter.toDto(entity);
            result.add(dto);
        }
        return result;
    }

    @Override
    public int getTotalItem() {
        return (int) categoryRepository.count();
    }

    @Override
    public CategoryDTO findOne(Long id) {
        return converter.toDto(categoryRepository.findOne(id));
    }

    @Override
    public CategoryDTO save(CategoryDTO categoryDTO) {
        CategoryDTO result;
        if (categoryDTO.getId() != null) {
            CategoryEntity categoryEntity = categoryRepository.findOne(categoryDTO.getId());
            result = converter.toDto(categoryRepository.save(converter.toEntity(categoryEntity, categoryDTO)));
        } else {
            result = converter.toDto(categoryRepository.save(converter.toEntity(categoryDTO)));
        }
        return result;
    }

    @Override
    public void delete(long[] id) {

    }
}
