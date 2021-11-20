package com.example.sweater.config;


import com.example.sweater.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;

import javax.sql.DataSource;
import javax.xml.crypto.Data;


@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
//    @Autowired
//    private DataSource dataSource;

    @Value("${upload.path}")
    private String uploadPath;

    @Autowired
    private UserService userService;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()        //switch on authorization
                .antMatchers("/", "/registration", "/static/**").permitAll()   //allow full access for the address("/")
                    .anyRequest().authenticated()       // for another address we require authorization
                .and()
                    .formLogin()       //switch on login.ftlh form
                    .loginPage("/login")//.defaultSuccessUrl("/main", true)       //login.ftlh path is located on this mapping
                    .permitAll()        //allow all the people use it
                .and()
                    .logout()       //switch on logout
                    .permitAll();
    }



    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userService)
                .passwordEncoder(NoOpPasswordEncoder.getInstance());
    }





//    @Override
//    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//        auth.jdbcAuthentication()
//                .dataSource(dataSource)
//                .passwordEncoder(NoOpPasswordEncoder.getInstance())
//                .usersByUsernameQuery("select username, password, active from usr where username=?")
//        //Запрос необходим для того, чтобы система могла найти пользователя по его имени
//                .authoritiesByUsernameQuery("select u.username, ur.roles from usr u inner join user_role" +
//                        " ur on u.id = ur.user_id where u.username=?");
//        //Этот запрос помогает спрингу получить список пользоваелей с их ролями
//        //Из таблицы usr и присоединенной к ней таблицы user_role,
//        //соединенной через поля id and user_id выбираем поля username and role
//    }


    //    @Bean
//    @Override
//    public UserDetailsService userDetailsService() {
//        UserDetails user =
//                User.withDefaultPasswordEncoder()
//                        .username("u")
//                        .password("u")
//                        .roles("USER")
//                        .build();
//
//        return new InMemoryUserDetailsManager(user);
//    }
//
}
