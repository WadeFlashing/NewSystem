package club.boot.NewsManage.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import club.boot.NewsManage.bean.Person;
import club.boot.NewsManage.service.PersonService;

@Controller
public class PersonController {

	@Resource
	private PersonService personService;
	
	
	@RequestMapping("/login")
	public String login() {		
		return "login";
	}
	
	@RequestMapping("/regist")
	public String regist() {
		return "regist";
	}
	
	@RequestMapping("/register")
	public String register(HttpServletRequest request,HttpSession session,Person person)  throws Exception{
		
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			if(username!="" && password!="") {
				personService.insertPerson(person); 
			}		 
			request.setAttribute("msg", "注册成功请登录");		
			 return "login";
		}
	
	@RequestMapping("/logincheck")
	public void logincheck(HttpServletRequest request,HttpServletResponse response,HttpSession session,Person person) throws Exception{
		
		String name = request.getParameter("username");
		String password = request.getParameter("password");
		
		person = personService.selectByPersonname(name);
		
		if(person!=null && person.getPassword().equals(password)) {
			
			session.setAttribute("username", person.getUsername());
			session.setAttribute("uid", person.getUid());
			request.getRequestDispatcher("view").forward(request, response); 
					
		}else {
			request.setAttribute("msg", "账号或密码错误!");
			request.getRequestDispatcher("login").forward(request, response); 
			
		}
		
	}
	
}
