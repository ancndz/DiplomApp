package ru.ancndz.calculations;

import ru.ancndz.model.Sale;
import ru.ancndz.model.Supply;

import java.util.List;

public class LeadVariable extends Calculation {

    public LeadVariable(Double demandVolumeLevel, Double demand) {
        super(demandVolumeLevel);
        this.demand = demand;
    }

    @Override
    public void calculate(List<Sale> sales, List<Supply> supplies) {
        this.stock = serviceLevelToZ() * standardDev(getSupplyDaysArray(supplies)) * demand;
    }

}
