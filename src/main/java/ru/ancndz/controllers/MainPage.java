package ru.ancndz.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainPage {
    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("message", "Дипломная работа, Уткаев А.С.");
        return "index";
    }
}
