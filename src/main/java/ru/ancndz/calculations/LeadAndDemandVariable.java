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
        double[] a = getSalesArray(sales);
        double[] b = getSupplyDaysArray(supplies);
        double averageD = calcAverage(a);
        this.stock = serviceLevelToZ() *
                Math.sqrt((Math.pow(standardDev(a), 2) * (leadCycle + standardDev(b)))
                        + (Math.pow(averageD, 2) * Math.pow(standardDev(b), 2)));
    }
}
