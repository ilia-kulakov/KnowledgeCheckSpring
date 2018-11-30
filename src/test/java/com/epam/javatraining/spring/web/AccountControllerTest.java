package com.epam.javatraining.spring.web;

import com.epam.javatraining.spring.web.controller.AccountController;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.testng.annotations.Test;

public class AccountControllerTest {

    public static Logger logger = LogManager.getLogger("TestLogger");

    @Test
    public void testShouldShowLoginForm() throws Exception {

        testGetMethod("/account/login", "account/login");
    }

    @Test
    public void testShouldShowLogoutForm() throws Exception {

        testGetMethod("/account/logout", "account/logout");
    }

    @Test
    public void testShouldShowRecoveryForm() throws Exception {

        testGetMethod("/account/recovery", "account/recovery");
    }

    @Test
    public void testShouldShowRegisterForm() throws Exception {

        testGetMethod("/account/register", "account/register");
    }

    private void testGetMethod(String urlTemplate, String expectedViewName) throws Exception {
        AccountController controller = new AccountController();
        MockMvc mockMvc = MockMvcBuilders.standaloneSetup(controller).build();
        mockMvc.perform(MockMvcRequestBuilders.get(urlTemplate))
                .andExpect(MockMvcResultMatchers.view().name(expectedViewName));
    }
}
