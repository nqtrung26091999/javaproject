package com.ex.spring.api.web;

import com.ex.spring.dto.NewsDTO;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController(value = "newsAPIOfWeb")
public class NewsAPI {
	
	@PostMapping("/api/news")
	public NewsDTO creatNews(@RequestBody NewsDTO newsDTO) {
		return newsDTO;
	}
	
	@PutMapping("api/news")
	public NewsDTO updateNews(@RequestBody NewsDTO newsDTO) {
		return newsDTO;
	}
	
	@DeleteMapping("api/news")
	public void deleteNews(@RequestBody long[] ids) {
		System.out.println("OK");
	}
}
