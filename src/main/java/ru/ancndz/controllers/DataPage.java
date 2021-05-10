package ru.ancndz.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import ru.ancndz.services.CalculationService;

@Controller
@RequestMapping("/data")
public class DataPage {

    private final CalculationService service;

    @Autowired
    public DataPage(CalculationService service) {
        this.service = service;
    }

    @GetMapping("/")
    public String viewAllData(Model model) {
        model.addAttribute("sales", service.findAllSales());
        model.addAttribute("supplies", service.findAllSupplies());
        return "data";
    }
}
