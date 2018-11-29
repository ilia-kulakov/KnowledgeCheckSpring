package com.epam.javatraining.spring.web.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScans;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.sql.DataSource;

@Configuration
@ComponentScan("com.epam.javatraining.spring.web.configuration")
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private DataSource dataSource;

    @Override
    protected void configure(AuthenticationManagerBuilder auth)
        throws Exception {

        String sqlUsers = "SELECT username, password, verified "
                + "from users "
                + "where username=?";

        String sqlAuth = "SELECT username, role "
                + "from users "
                + "where username=?";

        auth
            .jdbcAuthentication()
                .dataSource(dataSource)
                .usersByUsernameQuery(sqlUsers)
                .authoritiesByUsernameQuery(sqlAuth)
                .passwordEncoder(passwordEncoder());

    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http
            .formLogin()
                .loginProcessingUrl("/account/login")
        .and()
            .rememberMe()
                .tokenValiditySeconds(30)
                .key("KnowledgeCheckKey")
        .and()
            .logout()
                .logoutUrl("/account/logout")
                .logoutSuccessUrl("/")
        .and()
            .authorizeRequests()
                .antMatchers("/admin").hasRole("ADMIN")
                .antMatchers("/tutor").hasRole("TUTOR")
                .antMatchers("/student").hasRole("STUDENT")
                .antMatchers("/login").permitAll()
                .antMatchers("/").permitAll()
                //.anyRequest().authenticated()
        .and()
            .requiresChannel()
                .antMatchers("/spitter/form")
                    .requiresSecure();

    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
