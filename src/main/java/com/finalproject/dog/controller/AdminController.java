package com.finalproject.dog.controller;

import com.finalproject.dog.dao.AdopterDAO;
import com.finalproject.dog.dao.DogDAO;
import com.finalproject.dog.entity.Adopter;
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
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdopterDAO adopterDAO;

    @Autowired
    private DogDAO dogDAO;

    @GetMapping
    public String adminHome() {
        return "admin"; 
    }

    @GetMapping("/dogs")
    public String viewDogs(Model model) {
        List<Dog> dogs = dogDAO.getAllDogs();
        model.addAttribute("dogs", dogs);
        model.addAttribute("dog", new Dog());
        return "dogs";
    }


    @PostMapping("/dogs/add")
    public String addDog(Dog dog, RedirectAttributes redirectAttributes) {
        dogDAO.saveDog(dog);
        redirectAttributes.addFlashAttribute("successMessage", "Dog added successfully!");
        return "redirect:/admin/dogs";
    }

    @PostMapping("/dogs/delete")
    public String deleteDog(@RequestParam String name, RedirectAttributes redirectAttributes) {
        dogDAO.deleteDog(name);
        redirectAttributes.addFlashAttribute("successMessage", "Dog deleted successfully!");
        return "redirect:/admin/dogs";
    }

    @GetMapping("/adopters")
    public String viewAdopters(Model model) {
        List<Adopter> adopters = adopterDAO.getAllAdopters();
        model.addAttribute("adopters", adopters);
        return "adopters"; 
    }

    @PostMapping("/adopters/delete")
    public String deleteAdopters(@RequestParam List<Long> ids, RedirectAttributes redirectAttributes) {
        for (Long id : ids) {
            adopterDAO.deleteAdopter(id);
        }
        redirectAttributes.addFlashAttribute("successMessage", "Selected adopters deleted successfully!");
        return "redirect:/admin/adopters";
    }
}
