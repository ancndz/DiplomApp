package ru.ancndz.calculations;

import ru.ancndz.model.Sale;
import ru.ancndz.model.Supply;

import java.util.List;

/**
 * Реализация модели с неопределенностью поставки.
 */
public class LeadVariable extends Calculation {

    /**
     * Конструктор.
     *
     * @param demandVolumeLevel уровень сервиса
     * @param demand            дневной спрос
     */
    public LeadVariable(Double demandVolumeLevel, Double demand) {
        super(demandVolumeLevel);
        this.dailyDemand = demand;
    }

    @Override
    public void calculate(List<Sale> sales, List<Supply> supplies) {
        Double suppliesDaysDev = standardDev(getSupplyDaysArray(supplies));
        double z = serviceLevelToZ();
        this.stock = z * suppliesDaysDev * dailyDemand;
        logger.info(String.format("LeadVariable Calculation Info #1: SuppliesDaysDev: %s, ServiceLevelToZ: %s, Stock: %s",
                suppliesDaysDev, z, stock));
    }
}
