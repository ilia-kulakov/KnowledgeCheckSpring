package com.epam.javatraining.spring.web.service;
import org.springframework.stereotype.Service;

@Service
public class UserRoleService {
    private static final String[] roles = new String[]{
            "ROLE_ADMIN",
            "ROLE_TUTOR",
            "ROLE_STUDENT"
    };

    private static final String[] descriptions = new String[]{
            "app.account.role.administrator",
            "app.account.role.tutor",
            "app.account.role.student"
    };

    public String[] getList() {
        return roles;
    }

    public String getDescription(String role) {
        for(int i = 0; i < roles.length; i++) {
            if(roles[i].equals(role)) {
                return descriptions[i];
            }
        }
        return null;
    }
}
