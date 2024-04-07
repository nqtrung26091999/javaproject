package com.ex.spring.converter;

import com.ex.spring.dto.CategoryDTO;
import com.ex.spring.entity.NewsEntity;
import com.ex.spring.dto.NewsDTO;
import com.ex.spring.util.ConvertBase64;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class NewsConverter {
    public NewsDTO toDto(NewsEntity newsEntity) {
        NewsDTO result = new NewsDTO();
        result.setId(newsEntity.getId());
        result.setTitle(newsEntity.getTitle());
        result.setShortDescription(newsEntity.getShortDescription());
        result.setContent(newsEntity.getContent());
        CategoryDTO categoryDTO = new CategoryDTO();
        categoryDTO.setCode(newsEntity.getCategory().getCode());
        categoryDTO.setName(newsEntity.getCategory().getName());
        result.setCategory(categoryDTO);
        result.setExportThumbnail(newsEntity.getThumbnail());
        result.setCreatedDate(newsEntity.getCreatedDate());
        result.setCreatedBy(newsEntity.getCreatedBy());
        return result;
    }

    public NewsEntity toEntity(NewsDTO newsDTO) {
        NewsEntity result = new NewsEntity();
        result.setTitle(newsDTO.getTitle());
        result.setShortDescription(newsDTO.getShortDescription());
        result.setContent(newsDTO.getContent());
        return result;
    }

    public NewsEntity toEntity(NewsEntity entity, NewsDTO newsDTO) {
        entity.setTitle(newsDTO.getTitle());
        entity.setShortDescription(newsDTO.getShortDescription());
        entity.setContent(newsDTO.getContent());
        return entity;
    }

}
