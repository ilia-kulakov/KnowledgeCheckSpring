package com.epam.javatraining.spring.web.service.impl;
import com.epam.javatraining.spring.web.service.UserRoleService;
import org.springframework.stereotype.Service;

@Service
public class UserRoleServiceImpl implements UserRoleService {
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

    @Override
    public String[] getRoleList() {
        return roles;
    }

    @Override
    public String getRoleDescription(String role) {
        for(int i = 0; i < roles.length; i++) {
            if(roles[i].equals(role)) {
                return descriptions[i];
            }
        }
        return null;
    }
}
