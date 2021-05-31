package ru.ancndz.calculations;

import ru.ancndz.model.Sale;
import ru.ancndz.model.Supply;

import java.util.List;

/**
 * Реализация модели с неопределенностью поставки и спроса.
 */
public class LeadAndDemandVariable extends DemandVariable {

    /**
     * Конструктор.
     *
     * @param demandVolumeLevel уровень сервиса
     * @param leadCycle         планируемое время выполнения заказа (дни)
     */
    public LeadAndDemandVariable(Double demandVolumeLevel, Double leadCycle) {
        super(demandVolumeLevel, leadCycle);
    }

    @Override
    public void calculate(List<Sale> sales, List<Supply> supplies) {
        double[] salesArray = getSalesArray(sales);
        double[] supplyDaysArray = getSupplyDaysArray(supplies);

        Double averageSales = calcAverage(salesArray);
        Double saleDev = standardDev(salesArray);
        Double suppliesDaysDev = standardDev(supplyDaysArray);

        double z = serviceLevelToZ();
        this.stock = z * Math.sqrt((Math.pow(saleDev, 2) * (leadCycle + suppliesDaysDev))
                + (Math.pow(averageSales, 2) * Math.pow(suppliesDaysDev, 2)));

        logger.info(String.format("LeadAndDemandVariable Calculation Info #1: AverageSales: %s, SaleDev: %s, SuppliesDaysDev: %s, ServiceLevelToZ: %s, Stock: %s",
                averageSales, saleDev, suppliesDaysDev, z, stock));
    }
}
