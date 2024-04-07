package com.ex.spring.service;

import com.ex.spring.dto.CategoryDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

public interface ICategoryService {
	Map<String, String> findAll();
	List<CategoryDTO> findAll(Pageable pageable);
	int getTotalItem();
	CategoryDTO findOne(Long id);
	CategoryDTO save(CategoryDTO categoryDTO);
	void delete(long[] id);
}
