package club.boot.NewsManage.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
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
import club.boot.NewsManage.service.MynewsService;

@Controller
public class MynewsController {

	@Resource
	private MynewsService mynewsService;
	
	//跳转接口
	@RequestMapping("/topublish")
	public String topublish(){
		return "publish";
	}
	
	//更新新闻
	@RequestMapping("/UpdateNews")
	public String updatenews(){
		return "UpdateNews";
	}
	//未登录搜索新闻
	@RequestMapping("/FirstsearchPage")
	public String FirstsearchPage() {
		return "FirstsearchPage";
	}
	
	//搜索新闻
	@RequestMapping("/searchPage")
	public String searchnews() {
		return "searchPage";
	}
	
	//搜索我的新闻
	@RequestMapping("/searchMyPage")
	public String searchmynews() {
		return "searchMyPage";
	}
	
	//新闻详情页
		@RequestMapping("/details")
		public String details() {
			return "details";
		}
		
	//新闻首页详情页
		@RequestMapping("/Firstdetails")
		public String Firstdetails() {
			return "Firstdetails";
		}		
		
	
	//我的新闻
	@RequestMapping("/mynews")
	public String selectMyNews(HttpServletRequest request,HttpServletResponse response,String username) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		 List<News> list = new ArrayList<News>();
		  
		  List<News> rs = mynewsService.selectMyNews(username);
		  
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
		  	request.setAttribute("list", list);
		  	return "mynews";
		}
	
	//发布新闻
	@RequestMapping("/publish")
	public void insertNews(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		int uid = (int)session.getAttribute("uid");
		String title =request.getParameter("title");
		String type =request.getParameter("type");
		String content =request.getParameter("content");
		String post_time =request.getParameter("post_time");
		mynewsService.insertNews(uid,title,type,content,post_time);
		
		try {
			request.getRequestDispatcher("mynews").forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}
	
	//更新新闻
	@RequestMapping("/update")
	public void updateNews(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String title =request.getParameter("title");		
		String type =request.getParameter("type");
		String content =request.getParameter("content");
		String post_time =request.getParameter("post_time");
		int news_id =Integer.parseInt(request.getParameter("news_id"));
		mynewsService.updateNews(title, type, content, post_time, news_id);
		
		try {
			request.getRequestDispatcher("mynews").forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}
	
	//删除新闻
	@RequestMapping("/DeleteNews")
	public void deleteNews(HttpServletRequest request,HttpServletResponse response) {
		int news_id = Integer.parseInt(request.getParameter("news_id"));
		mynewsService.deleteNews(news_id);
		try {
			request.getRequestDispatcher("mynews").forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}
	
	//搜索新闻
	@RequestMapping("/search")
	public void SearchNews(HttpServletRequest request,HttpServletResponse response){
		String choose = request.getParameter("choose");
		String values = request.getParameter("values");
		List<News> rs  = new ArrayList<News>(); 
		if( choose.equals("1") ){ 
            //根据uid搜索 
			 	 rs = mynewsService.SearchUid(Integer.parseInt(values));
			}
			else if( choose.equals("2") ){ 
            //根据type搜索 
				 rs = mynewsService.SearchType(values);
			} else {
			 //根据新闻标题
				 rs = mynewsService.SearchTitle("%"+values+"%");
			}
		
		ArrayList<News> list  = new ArrayList<News>();
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
		  	request.setAttribute("list", list);
		  	try {
				request.getRequestDispatcher("searchPage").forward(request, response);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
	}
	
	
	//搜索我的新闻
	@RequestMapping("/searchmynews")
	public void SearchMyNews(HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		String choose = request.getParameter("choose");
		String values = request.getParameter("values");
		int uid = (int)session.getAttribute("uid");
		List<News> rs  = new ArrayList<News>(); 
		
		if( choose.equals("2") ){ 
            //根据uid搜索 
			 	 rs = mynewsService.SearchMyType(uid, values);
			}
			else if( choose.equals("3") ){ 
            //根据type搜索 
				 rs = mynewsService.SearchMyTitle(uid, "%"+values+"%");
			}
		ArrayList<News> list  = new ArrayList<News>();
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
		  	request.setAttribute("list", list);
		  	try {
				request.getRequestDispatcher("searchMyPage").forward(request, response);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}		
	}
	
	
	//未登录搜索
	@RequestMapping("/Firstsearch")
	public void FirstSearch(HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		String choose = request.getParameter("choose");
		String values = request.getParameter("values");
		List<News> rs  = new ArrayList<News>(); 	
		if( choose.equals("1") ){ 
            //根据uid搜索 
			 	 rs = mynewsService.SearchUid(Integer.parseInt(values));
			}
			else if( choose.equals("2") ){ 
            //根据type搜索 
				 rs = mynewsService.SearchType(values);
			} else {
			 //根据新闻标题
				 rs = mynewsService.SearchTitle("%"+values+"%");
			}
		ArrayList<News> list  = new ArrayList<News>();
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
		  	request.setAttribute("list", list);
		  	try {
				request.getRequestDispatcher("FirstsearchPage").forward(request, response);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}		
	}
	
	
}
