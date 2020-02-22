package club.boot.NewsManage.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import club.boot.NewsManage.bean.News;

public interface MynewsRepository {

	@Select("select * from newsdata where uid=(select uid from user where username=#{username})")
	public List<News> selectMyNews(String username);
	
	@Insert("insert into newsdata(uid,title,type,content,post_time) value(#{uid},#{title},#{type},#{content},#{post_time})")
	public int insertNews(int uid, String title, String type, String content, String post_time);
	
	@Update("update newsdata set title=#{title},type=#{type},content=#{content},post_time=#{post_time} where news_id=#{news_id}")
	public int updateNews(String title, String type, String content, String post_time,int news_id);
	
	@Delete("delete from newsdata where news_id=#{news_id}")
	public int deleteNews(int news_id);
	
	//搜索新闻
	@Select("select * from newsdata where uid = #{uid}")
	public List<News> SearchUid(int uid);
	
	@Select("select * from newsdata where type = #{type}")
	public List<News> SearchType(String type);
	
	@Select("select * from newsdata where title LIKE #{title}")
	public List<News> SearchTitle(String title);
	
	//搜索我的新闻
	@Select("select * from newsdata where type=#{type} and uid = #{uid}")
	public List<News> SearchMyType(int uid,String type);
	
	@Select("select * from newsdata where title LIKE #{title} and uid = #{uid}")
	public List<News> SearchMyTitle(int uid,String title);
	
}
