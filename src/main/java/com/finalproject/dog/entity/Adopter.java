package com.finalproject.dog.entity;

public class Adopter {

    private Long id;
    private String name;
    private String email;
    private String address;
    private String interest; 
    private String experience;
    private String dogId;  

    public Adopter() {}

    public Adopter(Long id, String name, String email, String address, String interest, String experience, String dogId) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.address = address;
        this.interest = interest;
        this.experience = experience;
        this.dogId = dogId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getInterest() {
        return interest;
    }

    public void setInterest(String interest) {
        this.interest = interest;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getDogId() {
        return dogId;
    }

    public void setDogId(String dogId) {
        this.dogId = dogId;
    }
}
