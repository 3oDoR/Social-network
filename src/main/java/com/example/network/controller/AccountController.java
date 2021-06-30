package com.example.network.controller;

import com.example.network.domain.Message;
import com.example.network.domain.User;
import com.example.network.repos.MessageRepo;
import com.example.network.repos.UserRepo;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
public class AccountController {

    @Value("${upload.path}")
    private String uploadPath;

    private final MessageRepo messageRepo;
    private final UserRepo userRepo;


    public AccountController(MessageRepo messageRepo, UserRepo userRepo) {
        this.messageRepo = messageRepo;
        this.userRepo = userRepo;

    }

    @GetMapping("/account")
    public String account(@AuthenticationPrincipal User currentUser,
                          @RequestParam(required = false) Message message,
                          Model model) {

        Iterable<Message> messages = messageRepo.findByAuthor(currentUser);

        model.addAttribute("messages", messages);
        model.addAttribute("message", message);
        model.addAttribute("currentUser", currentUser);

        return "account";
    }

    @PostMapping("/account")
    public String add(@AuthenticationPrincipal User user,
                      @RequestParam String text,
                      @RequestParam String tag,
                      @RequestParam("file") MultipartFile file,
                      Model model) throws IOException {

        Message message = new Message(text, tag, user);


        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFilename));

            message.setFilename(resultFilename);
            message.setUser_like(0);
        }

        messageRepo.save(message);

        Iterable<Message> messages = messageRepo.findAll();

        model.addAttribute("messages", messages);
        model.addAttribute("currentUser", user);

        return "account";
    }

    @RequestMapping("/delete")
    public String deletePost(@RequestParam Long id) {
        messageRepo.deleteById(id);

        return "redirect:/";
    }


}
