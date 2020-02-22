package club.boot.NewsManage.repository;


import java.util.List;

import org.apache.ibatis.annotations.Select;

import club.boot.NewsManage.bean.News;

public interface FirstViewRepository{

	@Select("select * from newsdata")
	public List<News> selectByNews();
	
}
