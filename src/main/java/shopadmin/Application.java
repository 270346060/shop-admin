package shopadmin;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
// 相当于
// @Configuration 
// @EnableAutoConfiguration 开启自动配置支持（根据某些类是否存在、某些bean是否存在来自动配置某些工具）
// @ComponentScan 扫描当前包
public class Application { // 项目的主类，要放在项目顶层包下

	public static void main(String[] args) { // 项目的入口
	    // 运行自带的Tomcat，创建bean容器，自动注册springmvc的servlet、springsecurity的filter
		SpringApplication.run(Application.class, args);
	}
}
