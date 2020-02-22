package club.boot.NewsManage.service;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;



import club.boot.NewsManage.bean.News;
import club.boot.NewsManage.repository.FirstViewRepository;

@Service
public class FirstViewService {

	@Resource
	private FirstViewRepository firstViewRepository;
	
	public List<News> selectByNews() {
		return firstViewRepository.selectByNews();
	}
	
}
