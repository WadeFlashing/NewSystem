package club.boot.NewsManage.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import club.boot.NewsManage.bean.Manager;
import club.boot.NewsManage.bean.Person;

public interface ManagerRepository {

		@Select("select * from manager where name=#{name}")
		public Manager selectByManagername(String name);
	
		//管理用户信息
		@Select("select * from user")
		public List<Person> selectByUser();
		
		@Update("update user set username=#{username},password=#{password},sex=#{sex},phone=#{phone},address=#{address} where uid=#{uid}")
		public int UpdateUser(Person user);
		
		@Select("select * from user where uid = #{uid}")
		public Person getUserById(Integer uid);
		
		@Delete("delete from newsdata where uid=#{uid}")
		public int deleteNews(Integer uid);
		
		@Delete("delete from user where uid=#{uid}")
		public int deleteUser(Integer uid);
	
}
