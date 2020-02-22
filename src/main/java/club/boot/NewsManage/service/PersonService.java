package club.boot.NewsManage.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import club.boot.NewsManage.bean.Person;
import club.boot.NewsManage.repository.PersonRepository;


@Service
public class PersonService {

	@Resource
	private PersonRepository personRepository; 
	
	public int insertPerson(Person person) {
		return personRepository.insertPerson(person);
	}
	
	public Person selectByPersonname(String username) {
		return personRepository.selectByPersonname(username);
	}
	
}
