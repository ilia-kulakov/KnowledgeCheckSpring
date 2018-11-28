package com.epam.javatraining.spring.web.controller;

import com.epam.javatraining.spring.web.dao.UserDao;
import com.epam.javatraining.spring.web.domain.User;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

@Controller
@RequestMapping( {"/"} )
public class HomeController {

    public static Logger logger = LogManager.getLogger("ControllerLogger");


    @Autowired
    private UserDao userDao;

    @RequestMapping(method=GET)
    public String home(Model model) {
        return "home";
    }

}
