package shopadmin.config;

import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;
import org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver;


@Configuration
@ComponentScan("shopadmin")
@EnableWebMvc 
@PropertySource("classpath:jdbc.properties")
@MapperScan("shopadmin.mapper")
public class AppConfig extends WebMvcConfigurerAdapter {

    @Bean
    public ViewResolver freeMarkerViewResolver() {
        FreeMarkerViewResolver vr = new FreeMarkerViewResolver("", ".ftl");
        vr.setCache(false);
        vr.setContentType("text/html;charset=utf-8");
        return vr;
    }
    
    @Bean
    public FreeMarkerConfigurer freeMarkerConfigurer() {
        FreeMarkerConfigurer config = new FreeMarkerConfigurer();
        config.setTemplateLoaderPath("/WEB-INF/freemarker/");
        return config;
    }
    
    @Bean
    public DataSource dataSource(Environment env) { 
        DriverManagerDataSource ds = new DriverManagerDataSource(
                env.getProperty("jdbc.url"),
                env.getProperty("jdbc.username"),
                env.getProperty("jdbc.password"));
        ds.setDriverClassName(env.getProperty("jdbc.driverClassName"));
        return ds;
    }   
    
    @Bean 
    public SqlSessionFactoryBean sqlSessionFactory(DataSource dataSource) {
        SqlSessionFactoryBean sf = new SqlSessionFactoryBean();
        sf.setConfigLocation(new ClassPathResource("mybatis-config.xml"));
        sf.setDataSource(dataSource);
        return sf;
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    
    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }
}