package ru.ancndz.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import ru.ancndz.calculations.Calculation;
import ru.ancndz.calculations.PercentageOfDemand;

import javax.validation.Valid;

@Controller
@RequestMapping("/calculations")
public class CalculationPage {

    @GetMapping("")
    public String calculation(Model model) {
        model.addAttribute("poc", new PercentageOfDemand());
        return "calculations";
    }

    @PostMapping("/poc")
    public String percentageOfDemandCalculation(@Valid @ModelAttribute("poc") PercentageOfDemand calc, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("error", "Ошибка");
        }
        calc.calculate();
        model.addAttribute("resultPOC", calc.getStock());
        return "calculations";
    }

}
