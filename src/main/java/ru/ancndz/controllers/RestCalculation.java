package ru.ancndz.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.ancndz.calculations.BaurCalculation;
import ru.ancndz.calculations.Calculation;
import ru.ancndz.calculations.DemandVariable;
import ru.ancndz.calculations.LeadAndDemandVariable;
import ru.ancndz.calculations.LeadVariable;
import ru.ancndz.calculations.PercentageOfDemand;
import ru.ancndz.model.Response;
import ru.ancndz.model.RestModel;
import ru.ancndz.services.CalculationService;


@RestController
@RequestMapping("/api")
public class RestCalculation {

    private final CalculationService calculationService;

    @Autowired
    public RestCalculation(CalculationService calculationService) {
        this.calculationService = calculationService;
    }

    @PostMapping("/poc")
    public Response percentageOfDemandCalculationAPI(@RequestBody RestModel restModel) {
        Calculation calc = new PercentageOfDemand(restModel.getSupplyTime(), restModel.getDailyDemand(), restModel.getDemandVolumeLevel());

        calc.calculate(calculationService.findSalesDependsOnDate(restModel.getMinDate(), restModel.getMaxDate()),
                calculationService.findSuppliesDependsOnDate(restModel.getMinDate(), restModel.getMaxDate()));

        return new Response("OK",calc.getStockFormatted());
    }

    @PostMapping("/lv")
    public Response leadVariableCalculation(@RequestBody RestModel restModel) {
        Calculation calc = new LeadVariable(restModel.getDemandVolumeLevel(), restModel.getDailyDemand());

        calc.calculate(calculationService.findSalesDependsOnDate(restModel.getMinDate(), restModel.getMaxDate()),
                calculationService.findSuppliesDependsOnDate(restModel.getMinDate(), restModel.getMaxDate()));

        return new Response("OK",calc.getStockFormatted());
    }

    @PostMapping("/dv")
    public Response demandVariableCalculation(@RequestBody RestModel restModel) {
        Calculation calc = new DemandVariable(restModel.getDemandVolumeLevel(), restModel.getSupplyTime());

        calc.calculate(calculationService.findSalesDependsOnDate(restModel.getMinDate(), restModel.getMaxDate()),
                calculationService.findSuppliesDependsOnDate(restModel.getMinDate(), restModel.getMaxDate()));

        return new Response("OK",calc.getStockFormatted());
    }

    @PostMapping("/ldv")
    public Response leadAndDemandVariableCalculation(@RequestBody RestModel restModel) {
        Calculation calc = new LeadAndDemandVariable(restModel.getDemandVolumeLevel(), restModel.getSupplyTime());

        calc.calculate(calculationService.findSalesDependsOnDate(restModel.getMinDate(), restModel.getMaxDate()),
                calculationService.findSuppliesDependsOnDate(restModel.getMinDate(), restModel.getMaxDate()));

        return new Response("OK",calc.getStockFormatted());
    }

    @PostMapping("/bv")
    public Response baurCalculation(@RequestBody RestModel restModel) {
        Calculation calc = new BaurCalculation(restModel.getDemandVolumeLevel(), restModel.getOrderVal());

        calc.calculate(calculationService.findSalesDependsOnDate(restModel.getMinDate(), restModel.getMaxDate()),
                calculationService.findSuppliesDependsOnDate(restModel.getMinDate(), restModel.getMaxDate()));

        return new Response("OK",calc.getStockFormatted());
    }

}
