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

        AccountController controller = new AccountController();
        MockMvc mockMvc = MockMvcBuilders.standaloneSetup(controller).build();
        mockMvc.perform(MockMvcRequestBuilders.get("/account/login"))
                .andExpect(MockMvcResultMatchers.view().name("account/login"));
    }

    @Test
    public void testShouldShowLogoutForm() throws Exception {

        AccountController controller = new AccountController();
        MockMvc mockMvc = MockMvcBuilders.standaloneSetup(controller).build();
        mockMvc.perform(MockMvcRequestBuilders.get("/account/logout"))
                .andExpect(MockMvcResultMatchers.view().name("account/logout"));
    }
}
