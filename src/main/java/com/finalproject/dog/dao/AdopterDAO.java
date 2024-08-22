package com.finalproject.dog.dao;

import com.finalproject.dog.entity.Adopter;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class AdopterDAO {

    private final JdbcTemplate jdbcTemplate;

    public AdopterDAO(@Qualifier("adoptersJdbcTemplate") JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private static final class AdopterRowMapper implements RowMapper<Adopter> {
        @Override
        public Adopter mapRow(ResultSet rs, int rowNum) throws SQLException {
            Adopter adopter = new Adopter();
            adopter.setId(rs.getLong("id"));
            adopter.setName(rs.getString("name"));
            adopter.setEmail(rs.getString("email"));
            adopter.setAddress(rs.getString("address"));
            adopter.setInterest(rs.getString("interest"));
            adopter.setExperience(rs.getString("experience"));
            adopter.setDogId(rs.getString("dogId")); // Adjusted to String
            return adopter;
        }
    }

    public void saveAdopter(Adopter adopter) {
        if (adopter.getId() == null) {
            String sql = "INSERT INTO adopters (name, email, address, interest, experience, dogId) VALUES (?, ?, ?, ?, ?, ?)";
            jdbcTemplate.update(sql, adopter.getName(), adopter.getEmail(), adopter.getAddress(),
                                adopter.getInterest(), adopter.getExperience(), adopter.getDogId());
        } else {
            String sql = "UPDATE adopters SET name = ?, email = ?, address = ?, interest = ?, experience = ?, dogId = ? WHERE id = ?";
            jdbcTemplate.update(sql, adopter.getName(), adopter.getEmail(), adopter.getAddress(),
                                adopter.getInterest(), adopter.getExperience(), adopter.getDogId(), adopter.getId());
        }
    }

    public Adopter getAdopterById(Long id) {
        String sql = "SELECT * FROM adopters WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new AdopterRowMapper(), id);
    }

    public List<Adopter> getAllAdopters() {
        String sql = "SELECT * FROM adopters";
        return jdbcTemplate.query(sql, new AdopterRowMapper());
    }

    public void deleteAdopter(Long id) {
        String sql = "DELETE FROM adopters WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }
}
