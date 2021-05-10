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
        this.stock = serviceLevelToZ() * standardDev(getSalesArray(sales)) * Math.sqrt(leadCycle);
    }


}
