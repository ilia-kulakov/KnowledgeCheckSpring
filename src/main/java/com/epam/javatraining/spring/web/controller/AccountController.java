package com.epam.javatraining.spring.web.controller;

import com.epam.javatraining.spring.web.controller.dto.UserDto;
import com.epam.javatraining.spring.web.service.UserRoleService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.LocaleResolver;

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

    @RequestMapping(value="/register", method=GET)
    public String register(Model model) {
        UserDto userDto = new UserDto();
        model.addAttribute("user", userDto);
        model.addAttribute("roles", new UserRoleService());

        return "account/register";
    }

    @RequestMapping(value="/recovery", method=GET)
    public String recovery(Model model) {
        return "account/recovery";
    }

}
