package com.epam.javatraining.spring.web.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

@Controller
@RequestMapping( "/account" )
public class AccountController {

    public static Logger logger = LogManager.getLogger("ControllerLogger");

    @RequestMapping(value="/login", method=GET)
    public String login(Model model) {
        return "account/login";
    }

    @RequestMapping(value="/logout", method=GET)
    public String logout(Model model) {
        return "account/logout";
    }

}
