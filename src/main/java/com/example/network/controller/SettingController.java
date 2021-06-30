package com.example.network.controller;

import com.example.network.domain.User;
import com.example.network.repos.MessageRepo;
import com.example.network.repos.UserRepo;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Objects;
import java.util.UUID;

@Controller
public class SettingController {

    private final UserRepo userRepo;
    private final MessageRepo messageRepo;

    @Value("${upload.path}")
    private String uploadPath;

    public SettingController(UserRepo userRepo, MessageRepo messageRepo) {
        this.userRepo = userRepo;
        this.messageRepo = messageRepo;
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
                             @RequestParam(required = false, defaultValue = "") String password,
                             @RequestParam("file") MultipartFile file) throws IOException {


        currentUser.setFirstname(firstname);
        currentUser.setSurname(surname);
        currentUser.setEmail(email);
        currentUser.setGender(gender);
        currentUser.setUsername(username);
        currentUser.setPassword(password);

        if (file != null && !Objects.requireNonNull(file.getOriginalFilename()).isEmpty()) {
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFilename));

            currentUser.setAvatar(resultFilename);

            model.addAttribute("currentUser", currentUser);
        }
        userRepo.save(currentUser);


        model.addAttribute("currentUser", currentUser);
        return "setting";
    }
}
