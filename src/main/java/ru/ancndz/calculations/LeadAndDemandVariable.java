package ru.ancndz.calculations;

import ru.ancndz.model.Sale;
import ru.ancndz.model.Supply;

import java.util.List;

public class LeadAndDemandVariable extends DemandVariable {

    public LeadAndDemandVariable(Double demandVolumeLevel, Double leadCycle) {
        super(demandVolumeLevel, leadCycle);
    }

    @Override
    public void calculate(List<Sale> sales, List<Supply> supplies) {
        double[] salesArray = getSalesArray(sales);
        double[] supplyDaysArray = getSupplyDaysArray(supplies);
        this.stock = serviceLevelToZ() *
                Math.sqrt((Math.pow(standardDev(salesArray), 2) * (leadCycle + standardDev(supplyDaysArray)))
                        + (Math.pow(calcAverage(salesArray), 2) * Math.pow(standardDev(supplyDaysArray), 2)));
    }
}
