package ru.ancndz.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import ru.ancndz.services.CalculationService;

@Controller
@RequestMapping("/calculations")
public class CalculationPage {

    private final CalculationService calculationService;

    @Autowired
    public CalculationPage(CalculationService calculationService) {
        this.calculationService = calculationService;
    }

    @GetMapping("")
    public String calculation(Model model) {
        model.addAttribute("minDate", calculationService.getMinDate());
        model.addAttribute("maxDate", calculationService.getMaxDate());
        return "calculations";
    }

}
