package com.ex.spring.service;

import com.ex.spring.dto.NewsDTO;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

public interface INewsService {
    List<NewsDTO> findAll(Pageable pageable);

    List<NewsDTO> findAll();

    NewsDTO findOne(Long id);

    int getTotalItem();

    NewsDTO save(NewsDTO newsDTO);

    void delete(long[] ids);

    void uploadFile(MultipartFile file, Long id) throws IOException;

    NewsDTO findOneByMaxId();
}
