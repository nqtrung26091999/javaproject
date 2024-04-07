package com.ex.spring.service.impl;

import com.ex.spring.converter.FileConvert;
import com.ex.spring.entity.CategoryEntity;
import com.ex.spring.entity.NewsEntity;
import com.ex.spring.converter.NewsConverter;
import com.ex.spring.dto.NewsDTO;
import com.ex.spring.repository.CategoryRepository;
import com.ex.spring.repository.NewsRepository;
import com.ex.spring.service.INewsService;
import com.ex.spring.util.ConvertBase64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
public class NewsService implements INewsService {

    @Autowired
    NewsRepository newsRepository;

    @Autowired
    CategoryRepository categoryRepository;

    @Autowired
    NewsConverter converter;

    @Override
    public List<NewsDTO> findAll(Pageable pageable) {
        List<NewsDTO> newsDTOList = new ArrayList<>();
        List<NewsEntity> newsEntities = newsRepository.findAll(pageable).getContent();
        for (NewsEntity entity : newsEntities) {
            NewsDTO dto = converter.toDto(entity);
            newsDTOList.add(dto);
        }
        return newsDTOList;
    }

    @Override
    public List<NewsDTO> findAll() {
        List<NewsDTO> newsDTOList = new ArrayList<>();
        List<NewsEntity> newsEntities = newsRepository.findAll();
        for (NewsEntity entity : newsEntities) {
            NewsDTO dto = converter.toDto(entity);
            newsDTOList.add(dto);
        }
        return newsDTOList;
    }

    @Override
    public NewsDTO findOne(Long id) {
        NewsEntity newsEntity = newsRepository.findOne(id);
        return converter.toDto(newsEntity);
    }

    @Override
    public int getTotalItem() {
        return (int) newsRepository.count();
    }

    @Override
    @Transactional
    public NewsDTO save(NewsDTO newsDTO) {
        CategoryEntity categoryEntity = categoryRepository.findByCode(newsDTO.getCategory().getCode());
        NewsEntity news = new NewsEntity();
        if (newsDTO.getId() != null) {
            NewsEntity oldNews = newsRepository.findOne(newsDTO.getId());
            oldNews.setCategory(categoryEntity);
            news = converter.toEntity(oldNews, newsDTO);
        } else {
            news = converter.toEntity(newsDTO);
            news.setCategory(categoryEntity);
        }
        return converter.toDto(newsRepository.save(news));
    }

    @Override
    @Transactional
    public void delete(long[] ids) {
        for (long id : ids) {
            newsRepository.delete(id);
        }
    }

    @Override
    public void uploadFile(MultipartFile file, Long id) throws IOException {
        NewsEntity entity = newsRepository.findOne(id);
        entity.setThumbnail(ConvertBase64.encoder(FileConvert.convertMultiPartToFile(file)));
        newsRepository.save(entity);
    }

    @Override
    public NewsDTO findOneByMaxId() {
        Long id = newsRepository.findMaxId();
        NewsEntity entity = newsRepository.findOne(id);
        return converter.toDto(entity);
    }
}
