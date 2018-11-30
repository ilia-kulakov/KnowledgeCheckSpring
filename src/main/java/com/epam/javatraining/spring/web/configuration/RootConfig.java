package com.epam.javatraining.spring.web.configuration;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@Configuration
@ComponentScan(basePackages={"com.epam.javatraining.spring.web"}, excludeFilters =
        { @ComponentScan.Filter(type= FilterType.ANNOTATION,
                value= EnableWebMvc.class)})
public class RootConfig {
}
