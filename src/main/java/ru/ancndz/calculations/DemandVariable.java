package ru.ancndz.calculations;

import ru.ancndz.model.Sale;
import ru.ancndz.model.Supply;

import java.util.List;

public class DemandVariable extends Calculation {

    public DemandVariable(Double demandVolumeLevel, Double leadCycle) {
        super(demandVolumeLevel);
        this.leadCycle = leadCycle;
    }

    @Override
    public void calculate(List<Sale> sales, List<Supply> supplies) {
        double[] a = getSalesArray(sales);
        this.stock = serviceLevelToZ() * standardDev(a) * Math.sqrt(leadCycle);
    }


}
