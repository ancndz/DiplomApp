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

        Double averageSales = calcAverage(salesArray);
        Double averageSuppliesDays = calcAverage(supplyDaysArray);
        Double saleDev = standardDev(salesArray);
        Double suppliesDaysDev = standardDev(supplyDaysArray);

        double fullDev = (Math.sqrt((Math.pow(averageSales, 2) * Math.pow(suppliesDaysDev, 2))
                + (averageSuppliesDays * Math.pow(saleDev, 2))));

        double fk = ((1 - (demandVolumeLevel / 100)) * orderVal) / fullDev;
        if (demandVolumeLevel == 100) {
            fk = .99999 / fullDev;
        }
        double k = Erf.erfcInv(fk);

        this.stock = k * fullDev;

        logger.info(String.format("Baur Calculation Info #1: AverageSales: %s, AverageSuppliesDays: %s, SaleDev: %s, SuppliesDaysDev: %s",
                averageSales, averageSuppliesDays, saleDev, suppliesDaysDev));
        logger.info(String.format("Baur Calculation Info #2: FullDev: %s, f(k): %s, k: %s, Stock: %s",
                fullDev, fk, Erf.erfcInv(fk), stock));
    }

}
