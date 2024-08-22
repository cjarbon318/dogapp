package com.finalproject.dog.controller;

import com.finalproject.dog.entity.LoginForm;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String showLoginPage(Model model) {
        model.addAttribute("command", new LoginForm()); // Ensure this line is present
        return "login"; // This should match the name of your JSP file for login
    }

    @PostMapping("/login")
    public String loginUser(@ModelAttribute("command") LoginForm loginForm, RedirectAttributes redirectAttributes) {
        if ("admin".equals(loginForm.getUsername()) && "adminpass".equals(loginForm.getPassword())) {
            return "redirect:/admin"; // Redirect to the admin dashboard
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "Invalid username or password");
            return "redirect:/login"; 
        }
    }


    @GetMapping("/logout")
    public String logout(RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("logoutMessage", "You have been logged out successfully");
        return "redirect:/login"; // Redirect to login page after logout
    }
}
