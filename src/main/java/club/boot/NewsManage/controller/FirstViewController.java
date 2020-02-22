package club.boot.NewsManage.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import club.boot.NewsManage.bean.News;
import club.boot.NewsManage.service.FirstViewService;


@Controller
public class FirstViewController {

	@Resource
	private FirstViewService firstViewService;
	
	@RequestMapping(value = "/firstview")
	public String selectByNews(HttpServletRequest request, HttpServletResponse response,HttpSession session)
			throws SQLException, ServletException, IOException {		
		
		  session.invalidate();	  
		  List<News> list = new ArrayList<News>();		  
		  List<News> rs = firstViewService.selectByNews();		  
		  for (int i = 0; i < rs.size(); i++) { 
			  News news = new News();
			  news.setNews_id(rs.get(i).getNews_id());
			  news.setUid(rs.get(i).getUid());
			  news.setTitle(rs.get(i).getTitle().toString());
			  news.setType(rs.get(i).getType().toString());
			  news.setContent(rs.get(i).getContent().toString());
			  news.setPost_time(rs.get(i).getPost_time());
			  list.add(news);
		  }
		// 将list数据打包	
		  request.setAttribute("list", list);
		  return "firstview"; 	
	}
	
	
	@RequestMapping(value = "/view")
	public String News(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
			
		  List<News> list = new ArrayList<News>();
		  
		  List<News> rs = firstViewService.selectByNews();
		  
		  for (int i = 0; i < rs.size(); i++) { 
			  News news = new News();
			  news.setNews_id(rs.get(i).getNews_id());
			  news.setUid(rs.get(i).getUid());
			  news.setTitle(rs.get(i).getTitle().toString());
			  news.setType(rs.get(i).getType().toString());
			  news.setContent(rs.get(i).getContent().toString());
			  news.setPost_time(rs.get(i).getPost_time());
			  list.add(news);
		  }
		// 将list数据打包	
		  request.setAttribute("list", list);
		  return "view"; 	
	}
	
}
