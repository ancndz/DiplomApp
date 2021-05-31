package ru.ancndz.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import ru.ancndz.services.CalculationService;

@Controller
@RequestMapping("/data")
public class DataPage {

    /**
     * Сервис для работы с расчетами.
     */
    private final CalculationService calculationService;

    /**
     * Конструктор.
     *
     * @param calculationService сервис для работы с расчетами
     */
    public DataPage(CalculationService calculationService) {
        this.calculationService = calculationService;
    }

    @GetMapping("/")
    public String viewAllData(Model model) {
        model.addAttribute("sales", calculationService.findAllSales());
        model.addAttribute("supplies", calculationService.findAllSupplies());
        return "data";
    }
}
