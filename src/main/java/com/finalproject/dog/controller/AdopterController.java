package com.finalproject.dog.controller;

import com.finalproject.dog.dao.AdopterDAO;
import com.finalproject.dog.entity.Adopter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/adopters")
public class AdopterController {

    @Autowired
    private AdopterDAO adopterDAO;

    @GetMapping("/apply")
    public String showForm(Model model) {
        model.addAttribute("adopter", new Adopter());
        return "apply"; 
    }

    @PostMapping("/apply")
    public String submitForm(@ModelAttribute("adopter") Adopter adopter, RedirectAttributes redirectAttributes) {
        try {
            adopterDAO.saveAdopter(adopter);
            redirectAttributes.addFlashAttribute("successMessage", "Congrats! Your adoption application has been successfully submitted.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Error submitting form.");
            return "redirect:/adopters/apply";
        }
        return "redirect:/adopters/confirmation";
    }

    @GetMapping("/confirmation")
    public String showConfirmation(@RequestParam(name = "message", required = false) String message, Model model) {
        model.addAttribute("message", message);
        return "confirmation"; 
    }
}
