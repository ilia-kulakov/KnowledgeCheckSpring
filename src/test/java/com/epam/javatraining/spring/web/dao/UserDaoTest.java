package com.epam.javatraining.spring.web.dao;

import com.epam.javatraining.spring.web.configuration.DataConfig;
import com.epam.javatraining.spring.web.domain.User;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.support.EncodedResource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.init.ScriptUtils;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import org.springframework.test.jdbc.JdbcTestUtils;
import org.testng.Assert;
import org.testng.annotations.Test;

import javax.sql.DataSource;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@ContextConfiguration(classes=DataConfig.class)
public class UserDaoTest extends AbstractTestNGSpringContextTests {

    public static Logger logger = LogManager.getLogger("TestLogger");

    private final String DAO_TABLE = "users";

    @Autowired
    private UserDao userDao;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private DataSource dataSource;

    @Test
    public void testInsert() {

        prepare();

        long oldSize = JdbcTestUtils.countRowsInTable(jdbcTemplate, DAO_TABLE);

        User user = getTestUser();
        userDao.insert(user);

        long newSize = JdbcTestUtils.countRowsInTable(jdbcTemplate, DAO_TABLE);

        Assert.assertEquals(oldSize + 1, newSize);
    }

    @Test(expectedExceptions = org.springframework.dao.DuplicateKeyException.class)
    public void testInsertDuplicateUsername() {

        prepare();

        User user = getTestUser();
        userDao.insert(user);

        user.setId(user.getId() + 1);
        user.setFirstName("New First Name");
        user.setLastName("New Last Name");
        userDao.insert(user);
    }

    @Test(expectedExceptions = org.springframework.dao.DataIntegrityViolationException.class)
    public void testInsertWithoutFirstName() {

        User user = getTestUser();
        user.setFirstName(null);
        userDao.insert(user);
    }

    @Test(expectedExceptions = org.springframework.dao.DataIntegrityViolationException.class)
    public void testInsertWithoutLastName() {

        User user = getTestUser();
        user.setLastName(null);
        userDao.insert(user);
    }

    @Test(expectedExceptions = org.springframework.dao.DataIntegrityViolationException.class)
    public void testInsertWithoutEmail() {

        User user = getTestUser();
        user.setEmail(null);
        userDao.insert(user);
    }

    @Test(expectedExceptions = org.springframework.dao.DataIntegrityViolationException.class)
    public void testInsertWithoutUsername() {

        User user = getTestUser();
        user.setUsername(null);
        userDao.insert(user);
    }

    @Test(expectedExceptions = org.springframework.dao.DataIntegrityViolationException.class)
    public void testInsertWithoutPassword() {

        User user = getTestUser();
        user.setPassword(null);
        userDao.insert(user);
    }

    @Test(expectedExceptions = org.springframework.dao.DataIntegrityViolationException.class)
    public void testInsertWithoutRole() {

        User user = getTestUser();
        user.setRole(null);
        userDao.insert(user);
    }

    @Test
    public void testFindOne() {

        prepare();

        User user = getTestUser();
        userDao.insert(user);

        User find = userDao.findOne(user);
        Assert.assertEquals(user, find);
    }

    @Test
    public void testFindOneById() {

        prepare();

        User user = getTestUser();
        userDao.insert(user);

        User find = userDao.findOneById(user.getId());
        Assert.assertEquals(user, find);
    }

    @Test
    public void testFindOneByUsername() {

        prepare();

        User user = getTestUser();
        userDao.insert(user);

        User find = userDao.findOneByUsername(user.getUsername());
        Assert.assertEquals(user, find);
    }

    @Test
    public void testUpdate() {

        prepare();

        User user = getTestUser();
        userDao.insert(user);
        user.setUsername("updated_username");
        userDao.update(user);

        User updated = userDao.findOne(user);
        Assert.assertEquals(updated.getUsername(), user.getUsername());
    }

    @Test
    public void testSaveUnique() {

        prepare();

        User user = getTestUser();
        userDao.save(user);

        User saved = userDao.findOne(user);
        Assert.assertEquals(saved, user);
    }

    @Test
    public void testSaveDuplicate() {

        prepare();

        User user = getTestUser();

        Long id = userDao.save(user);
        user.setFirstName("Duplicate");
        userDao.save(user);

        User saved = userDao.findOne(user);
        Assert.assertEquals(saved, user);
        Assert.assertEquals(saved.getId(), id);
    }

    @Test
    public void testFindAll() {

        JdbcTestUtils.deleteFromTables(jdbcTemplate, DAO_TABLE);

        User u0 = getTestUser();
        User u1 = new User();
        User u2 = new User();

        u1.setFirstName("Bob");
        u1.setLastName("Learner");
        u1.setUsername("boblearner");
        u1.setEmail("email@mail.ru");
        u1.setPassword("password");
        u1.setRole(User.Role.STUDENT);

        u2.setFirstName("Mary");
        u2.setLastName("White");
        u2.setUsername("marywhite");
        u2.setEmail("mary@mail.ru");
        u2.setPassword("security");
        u2.setRole(User.Role.TUTOR);

        List<User> users = Arrays.asList(u0, u1, u2);

        for(User u : users) {
            userDao.insert(u);
        }

        List<User> foundUsers = userDao.findAll();
        Assert.assertEquals(foundUsers.size(), users.size());

        for(User u : foundUsers) {
            Assert.assertTrue(users.contains(u));
        }
    }

    @Test
    void testDeleteById() {
        prepare();

        long oldSize = JdbcTestUtils.countRowsInTable(jdbcTemplate, DAO_TABLE);
        Long id = userDao.insert(getTestUser());
        userDao.deleteById(id);
        long newSize = JdbcTestUtils.countRowsInTable(jdbcTemplate, DAO_TABLE);

        Assert.assertEquals(oldSize, newSize);
    }

    @Test
    void testDelete() {
        prepare();

        long oldSize = JdbcTestUtils.countRowsInTable(jdbcTemplate, DAO_TABLE);
        User user = getTestUser();
        userDao.insert(user);
        userDao.delete(user);
        long newSize = JdbcTestUtils.countRowsInTable(jdbcTemplate, DAO_TABLE);

        Assert.assertEquals(oldSize, newSize);
    }

    @Test
    void testTryDeleteWrongUser() {
        prepare();

        long oldSize = JdbcTestUtils.countRowsInTable(jdbcTemplate, DAO_TABLE);
        userDao.deleteById(Long.valueOf(-1));
        long newSize = JdbcTestUtils.countRowsInTable(jdbcTemplate, DAO_TABLE);

        Assert.assertEquals(oldSize, newSize);
    }

    @Test
    public void testCount() {

        prepare();

        List<User> users = userDao.findAll();
        Long count = userDao.count();

        Assert.assertTrue(users.size() == count);
    }

    private void prepare() {
        EncodedResource er = new EncodedResource(new ClassPathResource("sql/UserDaoTest.sql"),
                StandardCharsets.UTF_8);

        try (Connection connection = dataSource.getConnection()){
            ScriptUtils.executeSqlScript(connection, er);
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage(), e);
        }
    }

    private User getTestUser() {

        User user = new User();
        user.setFirstName("Test");
        user.setLastName("User");
        user.setUsername("test_user");
        user.setEmail("email@mail.crg");
        user.setPassword((new Date()).toString());
        user.setRole(User.Role.ADMINISTRATOR);

        return user;
    }
}
