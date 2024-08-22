package com.finalproject.dog;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import javax.sql.DataSource;

@SpringBootApplication
public class DogApplication {

    public static void main(String[] args) {
        SpringApplication.run(DogApplication.class, args);
    }

    @Bean
    public DataSource adoptersDataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("org.sqlite.JDBC");
        dataSource.setUrl("jdbc:sqlite:/Users/carliarbon/NetBeansProjects/dogapp/databases/adopters.db");
        return dataSource;
    }

    @Bean
    public DataSource dogsDataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("org.sqlite.JDBC");
        dataSource.setUrl("jdbc:sqlite:/Users/carliarbon/NetBeansProjects/dogapp/databases/dogs.db");
        return dataSource;
    }

    @Bean
    @Qualifier("adoptersJdbcTemplate")
    public JdbcTemplate adoptersJdbcTemplate(DataSource adoptersDataSource) {
        return new JdbcTemplate(adoptersDataSource);
    }

    @Bean
    @Qualifier("dogsJdbcTemplate")
    public JdbcTemplate dogsJdbcTemplate(DataSource dogsDataSource) {
        return new JdbcTemplate(dogsDataSource);
    }
}
