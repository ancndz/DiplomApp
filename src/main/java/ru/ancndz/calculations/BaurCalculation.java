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
        double averageT = calcAverage(supplyDaysArray);
        System.out.println("averageT: " + averageT);
        double averageD = calcAverage(salesArray);
        System.out.println("averageD: " + averageD);
        double fullDev = (Math.sqrt((Math.pow(averageD, 2) * Math.pow(standardDev(supplyDaysArray), 2))
                + (averageT * Math.pow(standardDev(salesArray), 2))));
        System.out.println("fullDev: " + fullDev);
        double fk = ((1 - (demandVolumeLevel / 100)) * orderVal) / fullDev;
        System.out.println("fk: " + fk);
        System.out.println("k: " + Erf.erfcInv(fk));
        this.stock = Erf.erfcInv(fk) * fullDev;
    }

}
