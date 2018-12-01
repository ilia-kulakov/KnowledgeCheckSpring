package com.epam.javatraining.spring.web.controller;

import com.epam.javatraining.spring.web.controller.dto.UserDto;
import com.epam.javatraining.spring.web.domain.User;
import com.epam.javatraining.spring.web.exception.UsernameExistsException;
import com.epam.javatraining.spring.web.service.UserRoleService;
import com.epam.javatraining.spring.web.service.UserService;
import com.epam.javatraining.spring.web.tools.AlertManager;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import javax.validation.Valid;

import java.util.List;
import java.util.Locale;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
@RequestMapping( "/account" )
public class AccountController {

    public static Logger logger = LogManager.getLogger("ControllerLogger");


    private LocaleResolver localeResolver;
    private MessageSource messageSource;
    private UserRoleService userRoleService;
    private UserService userService;

    @Autowired
    public void setLocalResolver(LocaleResolver localeResolver) {
        this.localeResolver = localeResolver;
    }

    @Autowired
    public void setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }

    @Autowired
    public void setUserRoleService(UserRoleService userRoleService) {
        this.userRoleService = userRoleService;
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

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
        model.addAttribute("roles", userRoleService);

        return "account/register";
    }

    @RequestMapping(value="/register", method=POST)
    public String processRegistration(
            @Valid @ModelAttribute("userDto") UserDto userDto, BindingResult bindingResult ,
            HttpServletRequest req,
            Model model,
            RedirectAttributes redirectModel) {

        model.addAttribute("roles", userRoleService);

        if(bindingResult.hasErrors()) {
            return "account/register";
        }

        try {
            userService.registerNewUserAccount(userDto);
        } catch(UsernameExistsException e) {

            Locale locale = localeResolver.resolveLocale(req);
            String errMsg = messageSource.getMessage("app.account.username.exists", new Object[0], locale);

            ObjectError error = new FieldError(
                    bindingResult.getObjectName(),"username", errMsg);
            bindingResult.addError(error);
            return "account/register";
        }

        AlertManager manager = new AlertManager();
        manager.success("app.account.email_activation");
        redirectModel.addFlashAttribute("alertManager", manager);

        return "redirect:/";
    }

    @RequestMapping(value="/recovery", method=GET)
    public String recovery(Model model) {
        return "account/recovery";
    }

}
