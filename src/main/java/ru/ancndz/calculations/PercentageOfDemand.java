package ru.ancndz.calculations;

import ru.ancndz.model.Sale;
import ru.ancndz.model.Supply;

import java.util.List;

/**
 * Реализация модели на основе учета процента от спроса во время выполнения заказа.
 */
public class PercentageOfDemand extends LeadAndDemandVariable {

    /**
     * Конструктор.
     *
     * @param demandVolumeLevel уровень сервиса
     * @param leadCycle         планируемое время выполнения заказа (дни)
     * @param demand            дневной спрос
     */
    public PercentageOfDemand(Double demandVolumeLevel, Double leadCycle, Double demand) {
        super(demandVolumeLevel, leadCycle);
        this.dailyDemand = demand;
    }

    @Override
    public void calculate(List<Sale> sales, List<Supply> supplies) {
        stock = (leadCycle * dailyDemand) * (demandVolumeLevel / 100);
        logger.info(String.format("PercentageOfDemand Calculation Info #1: Stock: %s", stock));
    }
}
