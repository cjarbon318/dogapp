package com.finalproject.dog.dao;

import com.finalproject.dog.entity.Dog;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class DogDAO {

    private final JdbcTemplate jdbcTemplate;

    public DogDAO(@Qualifier("dogsJdbcTemplate") JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private static final class DogRowMapper implements RowMapper<Dog> {
        @Override
        public Dog mapRow(ResultSet rs, int rowNum) throws SQLException {
            Dog dog = new Dog();
            dog.setName(rs.getString("name"));
            dog.setBreed(rs.getString("breed"));
            dog.setSize(rs.getString("size"));
            dog.setAge(rs.getInt("age"));
            dog.setColor(rs.getString("color"));
            return dog;
        }
    }

    public List<Dog> getAllDogs() {
        String sql = "SELECT * FROM dog";
        return jdbcTemplate.query(sql, new DogRowMapper());
    }

    public void saveDog(Dog dog) {
        String sql = "INSERT INTO dog (name, breed, size, age, color) VALUES (?, ?, ?, ?, ?)"; 
        jdbcTemplate.update(sql, dog.getName(), dog.getBreed(), dog.getSize(), dog.getAge(), dog.getColor());
    }

    public void deleteDog(String name) {
        String sql = "DELETE FROM dog WHERE name = ?";
        jdbcTemplate.update(sql, name);
    }
}
