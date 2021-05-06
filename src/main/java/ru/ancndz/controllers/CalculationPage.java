package ru.ancndz.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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

import java.time.LocalDate;

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

    @PostMapping("/poc")
    public String percentageOfDemandCalculation(@RequestParam Double time, @RequestParam Double demand,
                                                @RequestParam Double demandVolumeLevel,
                                                @RequestParam String minDate, @RequestParam String maxDate,
                                                Model model) {
        Calculation calc = new PercentageOfDemand(time, demand, demandVolumeLevel);
        calc.calculate(calculationService.findSalesDependsOnDate(LocalDate.parse(minDate), LocalDate.parse(maxDate)),
                calculationService.findSuppliesDependsOnDate(LocalDate.parse(minDate), LocalDate.parse(maxDate)));
        model.addAttribute("resultPOC", calc.getStockFormatted());
        return calculation(model);
    }

    @PostMapping("/lv")
    public String leadVariableCalculation(@RequestParam Double demand, @RequestParam Double demandVolumeLevel,
                                          @RequestParam String minDate, @RequestParam String maxDate, Model model) {
        Calculation calc = new LeadVariable(demandVolumeLevel, demand);
        calc.calculate(calculationService.findSalesDependsOnDate(LocalDate.parse(minDate), LocalDate.parse(maxDate)),
                calculationService.findSuppliesDependsOnDate(LocalDate.parse(minDate), LocalDate.parse(maxDate)));
        model.addAttribute("resultLV", calc.getStockFormatted());
        return calculation(model);
    }

    @PostMapping("/dv")
    public String demandVariableCalculation(@RequestParam Double leadCycle, @RequestParam Double demandVolumeLevel,
                                            @RequestParam String minDate, @RequestParam String maxDate, Model model) {
        Calculation calc = new DemandVariable(demandVolumeLevel, leadCycle);
        calc.calculate(calculationService.findSalesDependsOnDate(LocalDate.parse(minDate), LocalDate.parse(maxDate)),
                calculationService.findSuppliesDependsOnDate(LocalDate.parse(minDate), LocalDate.parse(maxDate)));
        model.addAttribute("resultDV", calc.getStockFormatted());
        return calculation(model);
    }

    @PostMapping("/ldv")
    public String leadAndDemandVariableCalculation(@RequestParam Double demandVolumeLevel, @RequestParam Double time,
                                                   @RequestParam String minDate, @RequestParam String maxDate, Model model) {
        Calculation calc = new LeadAndDemandVariable(demandVolumeLevel, time);
        calc.calculate(calculationService.findSalesDependsOnDate(LocalDate.parse(minDate), LocalDate.parse(maxDate)),
                calculationService.findSuppliesDependsOnDate(LocalDate.parse(minDate), LocalDate.parse(maxDate)));
        model.addAttribute("resultLDV", calc.getStockFormatted());
        return calculation(model);
    }

    @PostMapping("/bv")
    public String baurCalculation(@RequestParam Double demandVolumeLevel, @RequestParam Double orderVal,
                                  @RequestParam String minDate, @RequestParam String maxDate, Model model) {
        Calculation calc = new BaurCalculation(demandVolumeLevel, orderVal);
        calc.calculate(calculationService.findSalesDependsOnDate(LocalDate.parse(minDate), LocalDate.parse(maxDate)),
                calculationService.findSuppliesDependsOnDate(LocalDate.parse(minDate), LocalDate.parse(maxDate)));
        model.addAttribute("resultBV", calc.getStockFormatted());
        return calculation(model);
    }

}
