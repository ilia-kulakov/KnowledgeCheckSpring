package com.epam.javatraining.spring.web.controller;

import com.epam.javatraining.spring.web.controller.dto.UserDto;
import com.epam.javatraining.spring.web.service.UserRoleService;
import com.epam.javatraining.spring.web.tools.AlertManager;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import java.util.List;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

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
        model.addAttribute("userDto", userDto);
        model.addAttribute("roles", new UserRoleService());

        return "account/register";
    }

    @RequestMapping(value="/register", method=POST)
    public String processRegistration(
            @Valid @ModelAttribute("userDto") UserDto userDto, BindingResult bindingResult ,
            HttpServletRequest req,
            Model model,
            RedirectAttributes redirectModel) {

        AlertManager manager = AlertManager.pullFromSession(req.getSession(true));

        model.addAttribute("roles", new UserRoleService());

        if(bindingResult.hasErrors()) {
            return "account/register";
        }

       // manager.success("More...");
       // model.addFlashAttribute("user", userDto);
        //return "redirect:/account/register";
        return "account/register";
    }

    @RequestMapping(value="/recovery", method=GET)
    public String recovery(Model model) {
        return "account/recovery";
    }

}
