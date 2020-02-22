package club.boot.NewsManage.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import club.boot.NewsManage.bean.News;
import club.boot.NewsManage.repository.MynewsRepository;

@Service
public class MynewsService {

	@Resource
	private MynewsRepository mynewsRepository;
	
	public List<News> selectMyNews(String username) {
		return mynewsRepository.selectMyNews(username);
	}
	
	public int insertNews(int uid, String title, String type, String content, String post_time) {
		return mynewsRepository.insertNews(uid, title, type, content, post_time);
	}
	
	public int updateNews(String title, String type, String content, String post_time,int news_id) {
		return mynewsRepository.updateNews(title, type, content, post_time, news_id);
	}
	
	public int deleteNews(int news_id) {
		return mynewsRepository.deleteNews(news_id);
	}
	
	//搜索新闻
	public List<News> SearchUid(int uid) {
		return mynewsRepository.SearchUid(uid);
	}
	
	public List<News> SearchType(String type) {
		return mynewsRepository.SearchType(type);
	}
	
	public List<News> SearchTitle(String title) {
		return mynewsRepository.SearchTitle("%"+title+"%");
	}
	
	//搜索我的新闻
	public List<News> SearchMyType(int uid,String type){
		return mynewsRepository.SearchMyType(uid, type);
	}
	
	public List<News> SearchMyTitle(int uid,String title){
		return mynewsRepository.SearchMyTitle(uid, "%"+title+"%");
	}
	
}
