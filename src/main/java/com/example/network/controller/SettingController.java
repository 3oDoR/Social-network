package com.example.network.controller;

import com.example.network.domain.Role;
import com.example.network.domain.User;
import com.example.network.repos.UserRepo;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Collections;
import java.util.Map;

@Controller
public class SettingController {

    private final UserRepo userRepo;

    public SettingController(UserRepo userRepo) {
        this.userRepo = userRepo;
    }

    @GetMapping("/setting")
    public String setting(Model model,
                           @AuthenticationPrincipal User currentUser) {

        model.addAttribute("currentUser", currentUser);

        return "setting";
    }

    @PostMapping("/setting")
    public String changeUser(@AuthenticationPrincipal User currentUser, Model model,
                             @RequestParam(required = false, defaultValue = "") String firstname,
                             @RequestParam(required = false, defaultValue = "") String surname,
                             @RequestParam(required = false, defaultValue = "") String email,
                             @RequestParam(required = false, defaultValue = "") String gender,
                             @RequestParam(required = false, defaultValue = "") String username,
                             @RequestParam(required = false, defaultValue = "") String password) {


        currentUser.setFirstname(firstname);
        currentUser.setSurname(surname);
        currentUser.setEmail(email);
        currentUser.setGender(gender);
        currentUser.setUsername(username);
        currentUser.setPassword(password);
        userRepo.save(currentUser);
        model.addAttribute("currentUser", currentUser);
        return "setting";
    }
}
