package ru.ancndz.calculations;

import org.apache.commons.math3.special.Erf;
import ru.ancndz.model.Sale;
import ru.ancndz.model.Supply;

import java.util.List;

public class BaurCalculation extends Calculation {

    public BaurCalculation(Double demandVolumeLevel, Double orderVal) {
        super(demandVolumeLevel);
        this.orderVal = orderVal;
    }

    @Override
    public void calculate(List<Sale> sales, List<Supply> supplies) {
        double[] salesArray = getSalesArray(sales);
        double[] supplyDaysArray = getSupplyDaysArray(supplies);

        double fullDev = (Math.sqrt((Math.pow(calcAverage(salesArray), 2) * Math.pow(standardDev(supplyDaysArray), 2))
                + (calcAverage(supplyDaysArray) * Math.pow(standardDev(salesArray), 2))));

        double fk = ((1 - (demandVolumeLevel / 100)) * orderVal) / fullDev;

        this.stock = Erf.erfcInv(fk) * fullDev;
    }

}
