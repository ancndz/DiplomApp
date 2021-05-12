package ru.ancndz.calculations;

import ru.ancndz.model.Sale;
import ru.ancndz.model.Supply;

import java.util.List;


public class PercentageOfDemand extends LeadAndDemandVariable {

    public PercentageOfDemand(Double demandVolumeLevel, Double leadCycle, Double demand) {
        super(demandVolumeLevel, leadCycle);
        this.demand = demand;
    }

    @Override
    public void calculate(List<Sale> sales, List<Supply> supplies) {
        stock = (leadCycle * demand) * (demandVolumeLevel / 100);
        logger.info(String.format("PercentageOfDemand Calculation Info #1: Stock: %s", stock));
    }

}
