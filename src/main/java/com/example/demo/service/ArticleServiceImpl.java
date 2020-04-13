package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.ArticleDao;
import com.example.demo.dto.Article;

import lombok.extern.slf4j.Slf4j;


@Service
@Slf4j

public class ArticleServiceImpl implements ArticleService {
	@Autowired
	ArticleDao articleDao;
	
	@Override
	public List<Article> getList() {
		return articleDao.getList();
		}

	
	
	
	
}
