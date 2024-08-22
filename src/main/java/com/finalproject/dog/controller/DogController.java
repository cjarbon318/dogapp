package com.finalproject.dog.controller;

import com.finalproject.dog.dao.DogDAO;
import com.finalproject.dog.entity.Dog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/dogs")
public class DogController {

    @Autowired
    private DogDAO dogDAO;

    @GetMapping("/list")
    public String listDogs(Model model) {
        List<Dog> dogs = dogDAO.getAllDogs();
        model.addAttribute("dogs", dogs);
        return "dogList";
    }
}
