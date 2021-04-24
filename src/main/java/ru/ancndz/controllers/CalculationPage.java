package ru.ancndz.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.ancndz.calculations.BaurCalculation;
import ru.ancndz.calculations.Calculation;
import ru.ancndz.calculations.DemandVariable;
import ru.ancndz.calculations.LeadAndDemandVariable;
import ru.ancndz.calculations.LeadVariable;
import ru.ancndz.calculations.PercentageOfDemand;
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
        return "calculations";
    }

    @PostMapping("/poc")
    public String percentageOfDemandCalculation(@RequestParam Double time, @RequestParam Double demand, @RequestParam Double demandVolumeLevel, Model model) {
        Calculation calc = new PercentageOfDemand(time, demand, demandVolumeLevel);
        calc.calculate(calculationService.findAllSales(), calculationService.findAllSupplies());
        model.addAttribute("resultPOC", calc.getStock());
        return "calculations";
    }

    @PostMapping("/lv")
    public String leadVariableCalculation(@RequestParam Double demand, @RequestParam Double demandVolumeLevel, Model model) {
        Calculation calc = new LeadVariable(demandVolumeLevel, demand);
        calc.calculate(calculationService.findAllSales(), calculationService.findAllSupplies());
        model.addAttribute("resultLV", calc.getStock());
        return "calculations";
    }

    @PostMapping("/dv")
    public String demandVariableCalculation(@RequestParam Double time, @RequestParam Double demandVolumeLevel, Model model) {
        Calculation calc = new DemandVariable(demandVolumeLevel, time);
        calc.calculate(calculationService.findAllSales(), calculationService.findAllSupplies());
        model.addAttribute("resultDV", calc.getStock());
        return "calculations";
    }

    @PostMapping("/ldv")
    public String leadAndDemandVariableCalculation(@RequestParam Double demandVolumeLevel, @RequestParam Double time, Model model) {
        Calculation calc = new LeadAndDemandVariable(demandVolumeLevel, time);
        calc.calculate(calculationService.findAllSales(), calculationService.findAllSupplies());
        model.addAttribute("resultLDV", calc.getStock());
        return "calculations";
    }

    @PostMapping("/bv")
    public String baurCalculation(@RequestParam Double demandVolumeLevel, @RequestParam Double orderVal, Model model) {
        Calculation calc = new BaurCalculation(demandVolumeLevel, orderVal);
        calc.calculate(calculationService.findAllSales(), calculationService.findAllSupplies());
        model.addAttribute("resultBV", calc.getStock());
        return "calculations";
    }

}
