package com.epam.javatraining.spring.web.dao.impl;

import com.epam.javatraining.spring.web.dao.UserDao;
import com.epam.javatraining.spring.web.domain.User;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class UserDaoJdbc extends AbstractDao implements UserDao {

    @Override
    public Long insert(User user) {
        String sql = "INSERT INTO users (first_name, last_name, email, role, username, password, verified, activated) " +
                "VALUES(:first_name, :last_name, :email, :role, :username, :password, :verified, :activated)";

        KeyHolder keyHolder = new GeneratedKeyHolder();
        SqlParameterSource params = getParameterSrc(user);
        getTemplate().update(sql, params, keyHolder);

        Long genId = keyHolder.getKey().longValue();
        user.setId(genId);

        return genId;
    }

    @Override
    public int update(User user) {

        String sql = "UPDATE users SET " +
                "first_name = :first_name, " +
                "last_name = :last_name, " +
                "email = :email, " +
                "role = :role, " +
                "username = :username, " +
                "password = :password, " +
                "verified = :verified " +
                "activated = :activated " +
                "WHERE user_id = :user_id";

        SqlParameterSource params = getParameterSrc(user);
        int count = getTemplate().update(sql, params);

        return count;
    }

    @Override
    public Long save(User user) {

        if(update(user) == 0) {
            insert(user);
        }

        return user.getId();
    }

    @Override
    public void delete(User user) {
        deleteById(user.getId());
    }

    @Override
    public void deleteById(Long id) {
        String sql = "DELETE FROM users WHERE user_id = ?";
        getTemplate().getJdbcOperations().update(sql, id);
    }

    @Override
    public User findOneById(Long id) {
        String sql = "SELECT * FROM users WHERE user_id = ?";
        JdbcOperations jops = getTemplate().getJdbcOperations();

        return jops.queryForObject(sql, new Object[] {id}, this::rowMap);
    }

    @Override
    public User findOneByUsername(String username) {
        String sql = "SELECT * FROM users WHERE username = ?";
        JdbcOperations jops = getTemplate().getJdbcOperations();

        return jops.queryForObject(sql, new Object[] {username}, this::rowMap);
    }

    @Override
    public User findOne(User user) {
        return (user.getId() != null) ?
                findOneById(user.getId()) :
                findOneByUsername(user.getUsername());
    }

    @Override
    public List<User> findAll(long offset, long count) {
        String sql = "SELECT * FROM users ORDER BY username LIMIT ?, ?";
        JdbcOperations jops = getTemplate().getJdbcOperations();

        return jops.query(sql, new Object[] {offset, count}, this::rowMap);
    }

    @Override
    public List<User> findAll() {
        String sql = "SELECT * FROM users ORDER BY username";

        return getTemplate().query(sql, this::rowMap);
    }

    @Override
    public Long count() {
        String sql = "SELECT COUNT(*) FROM users";

        return getTemplate().getJdbcOperations().queryForObject(sql, Long.class);
    }

    private User rowMap(ResultSet rs, int row) throws SQLException {

        User user = new User();
        user.setId( rs.getLong("user_id") );
        user.setFirstName( rs.getString("first_name") );
        user.setLastName( rs.getString("last_name") );
        user.setEmail( rs.getString("email") );
        user.setUsername( rs.getString("username") );
        user.setPassword( rs.getString("password") );
        user.setVerified( rs.getBoolean("verified"));
        user.setActivated( rs.getBoolean("activated"));
        user.setRole( rs.getString("role") );

        return user;
    }

    private SqlParameterSource getParameterSrc(User user) {
        return new MapSqlParameterSource()
                .addValue("user_id", user.getId())
                .addValue("first_name", user.getFirstName())
                .addValue("last_name", user.getLastName())
                .addValue("email", user.getEmail())
                .addValue("role", user.getRole())
                .addValue("username", user.getUsername())
                .addValue("password", user.getPassword())
                .addValue("verified", user.isVerified())
                .addValue("activated", user.isActivated());
    }
}
