package club.boot.NewsManage.controller;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import club.boot.NewsManage.bean.Manager;
import club.boot.NewsManage.bean.News;
import club.boot.NewsManage.bean.Person;
import club.boot.NewsManage.service.FirstViewService;
import club.boot.NewsManage.service.ManagerService;
import club.boot.NewsManage.service.MynewsService;

@Controller
public class ManagerController {

	@Resource
	private ManagerService managerService;
	
	@Resource
	private FirstViewService firstViewService;
	
	@Resource
	private MynewsService mynewsService;
	
	//管理员登录页面
	@RequestMapping("/Managerlogin")
	public String Managerlogin() {
		return "Managerlogin";
	}
	
	//管理员首页
	@RequestMapping("/Managerview")
	public String managerview(HttpServletRequest request,HttpServletResponse response) {
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
		return "Managerview";
	}
	
	//管理员新闻详情页
	@RequestMapping("/Managerdetails")
	public String Managerdetails() {
		return "Managerdetails";
	}
	
	//管理员搜索新闻
		@RequestMapping("/ManageSearchPage")
		public String ManageSearchPage() {
			return "ManageSearchPage";
		}
	
	
	@RequestMapping("/Checkmanager")
	public void logincheck(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception{
		
		Manager manager = new Manager();
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		
		manager = managerService.selectByManagername(name);
		
		if(manager!=null && manager.getPassword().equals(password)) {
			
			session.setAttribute("username", manager.getName());			
			request.getRequestDispatcher("Managerview").forward(request, response); 
			
		}else {
			request.setAttribute("msg", "账号或密码错误!");
			request.getRequestDispatcher("Managerlogin").forward(request, response); 			
		}		
	}
	
	
	//管理员搜索新闻
		@RequestMapping("/Managesearch")
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
					request.getRequestDispatcher("ManageSearchPage").forward(request, response);
				} catch (ServletException | IOException e) {
					e.printStackTrace();
				}		
		}
			
		//管理客户信息
		@RequestMapping("/manageUser")
		public String selectByUser(Model model) {
			List<Person> list= new ArrayList<>();
			List<Person> user = managerService.selectByUser();		
			for (int i = 0; i < user.size(); i++) { 
				list.add(user.get(i));
			}
			model.addAttribute("user", list);
			return "ManageUser";
		}
		
		//获取客户信息
		@RequestMapping("/getById")
		@ResponseBody
		public Person getUserById(Integer uid) {
			Person user = managerService.getUserById(uid);
			return user;
		}
		
		//修改客户信息
		@RequestMapping("/updateUser")
		@ResponseBody
		public String UpdateUser(Person user) {
			int rows = managerService.UpdateUser(user);
			if(rows > 0) {
				return "OK";
			}else {
				return "FAIL";
			}	
		}
		
		//删除客户信息
		@RequestMapping("/delete")
		@ResponseBody
		public String deleteUser(Integer uid){
			managerService.deleteNews(uid);
			int rows = managerService.deleteUser(uid);
			if(rows>0){
				return "OK";
			}else {
				return "FAIL";
			}
		}
		
}
