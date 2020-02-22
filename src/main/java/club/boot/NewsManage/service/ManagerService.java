package club.boot.NewsManage.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import club.boot.NewsManage.bean.Manager;
import club.boot.NewsManage.bean.Person;
import club.boot.NewsManage.repository.ManagerRepository;

@Service
public class ManagerService {

	@Resource
	private ManagerRepository managerRepository;
	
	public Manager selectByManagername(String name) {
		return managerRepository.selectByManagername(name);
	}
	
	//管理客户信息
	public List<Person> selectByUser(){
		return managerRepository.selectByUser();
	}
	
	public int UpdateUser(Person user) {
		return managerRepository.UpdateUser(user);
	}
	
	public Person getUserById(Integer uid) {
		return managerRepository.getUserById(uid);
	}
	
	public int deleteNews(Integer uid) {
		return managerRepository.deleteNews(uid);
	}
	
	public int deleteUser(Integer uid) {
		return managerRepository.deleteUser(uid);
	}
	
}
