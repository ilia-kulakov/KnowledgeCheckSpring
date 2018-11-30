package com.epam.javatraining.spring.web.configuration;

import com.epam.javatraining.spring.web.tools.AlertManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.BadCredentialsException;
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


    private DataSource dataSource;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }

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
            .authorizeRequests()

                .antMatchers("/admin").hasRole("ADMIN")
                .antMatchers("/tutor").hasRole("TUTOR")
                .antMatchers("/student").hasRole("STUDENT")

                .antMatchers("/").permitAll()
                .antMatchers("/account/login").permitAll()
                .antMatchers("/account/login/**").permitAll()
                .antMatchers("/account/logout").permitAll()
                .antMatchers("/account/register").permitAll()
                .antMatchers("/account/register/**").permitAll()
                .antMatchers("/account/recovery").permitAll()
                .antMatchers("/account/recovery/**").permitAll()
                .antMatchers("/resources/static/**").permitAll()
                .anyRequest().authenticated()
        .and()
            .formLogin()
                .loginPage("/account/login")
                .loginProcessingUrl("/account/login/processing")
                .defaultSuccessUrl("/")
                .failureHandler((req, res, exp)->{  // Failure handler invoked after authentication failure

                    String errMsg;
                    if(exp.getClass().isAssignableFrom(BadCredentialsException.class)){
                        errMsg= "app.account.login_error";
                    }else{
                        errMsg= "app.common.unknown_error";
                    }
                    AlertManager.pullFromSession(req.getSession(true)).danger(errMsg);
                    res.sendRedirect(req.getContextPath() + "/account/login"); // Redirect user to login page with error message.
                })
                .permitAll()
        .and()
            .rememberMe()
                .tokenValiditySeconds(30)
                .key("KnowledgeCheckKey")
        .and()
            .logout()
                .logoutUrl("/account/logout/processing")
                .logoutSuccessUrl("/")
                .permitAll()
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
