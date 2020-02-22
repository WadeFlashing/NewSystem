package club.boot.NewsManage.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;


import club.boot.NewsManage.bean.Person;

public interface PersonRepository {

	@Insert("insert into user (username,password,sex,phone,address) values(#{username},#{password},#{sex},#{phone},#{address})" )
	public int insertPerson(Person person);
	
	@Select("select * from user where username=#{username}")
	public Person selectByPersonname(@Param("username") String username);
	
}
