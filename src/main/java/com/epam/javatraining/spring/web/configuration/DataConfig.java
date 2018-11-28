package com.epam.javatraining.spring.web.configuration;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import javax.sql.DataSource;

@Configuration
@ComponentScan("com.epam.javatraining.spring.web.dao")
@PropertySource("classpath:dataconfig.properties")
public class DataConfig {
    public static Logger logger = LogManager.getLogger("ConfigurationLogger");

    @Value("${jdbc.driver}")
    private String jdbcDriver;

    @Value("${jdbc.url}")
    private String jdbcUrl;

    @Value("${jdbc.username}")
    private String jdbcUsername;

    @Value("${jdbc.password}")
    private String jdbcPassword;

    @Bean
    public DataSource dataSource() {

        BasicDataSource ds = new BasicDataSource();
        ds.setDriverClassName(jdbcDriver);
        ds.setUrl(jdbcUrl);
        ds.setUsername(jdbcUsername);
        ds.setPassword(jdbcPassword);
        ds.setInitialSize(5);
        logger.trace("Create Data Source " + ds);
        return ds;
    }

    @Bean
    public JdbcTemplate jdbcTemplate(DataSource ds) {
        return new JdbcTemplate(ds);
    }

    @Bean
    public NamedParameterJdbcTemplate namedParJdbcTemplate(DataSource ds) {
        NamedParameterJdbcTemplate t = new NamedParameterJdbcTemplate(ds);
        logger.trace("Create Data Source " + t);
        return t;//new NamedParameterJdbcTemplate(ds);
    }
}
