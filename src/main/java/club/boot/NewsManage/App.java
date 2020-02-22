package club.boot.NewsManage;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import club.boot.NewsManage.App;

@SpringBootApplication
@MapperScan("club.boot.NewsManage.repository")
public class App {

	  public static void main( String[] args )
	    {
	        SpringApplication.run(App.class, args);
	    }
	  
}
