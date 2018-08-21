package shopadmin.config;

import javax.sql.DataSource;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;


@Configuration
@PropertySource("classpath:jdbc.properties")
@MapperScan("shopadmin.mapper")
public class AppConfig extends WebMvcConfigurerAdapter {
    
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
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

}