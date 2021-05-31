package ru.ancndz.calculations;

import ru.ancndz.model.Sale;
import ru.ancndz.model.Supply;

import java.util.List;

/**
 * Реализация модели с неопределенностью продаж.
 */
public class DemandVariable extends Calculation {

    /**
     * Конструктор.
     *
     * @param demandVolumeLevel уровень сервиса
     * @param leadCycle         планируемое время выполнения заказа (дни)
     */
    public DemandVariable(Double demandVolumeLevel, Double leadCycle) {
        super(demandVolumeLevel);
        this.leadCycle = leadCycle;
    }

    @Override
    public void calculate(List<Sale> sales, List<Supply> supplies) {
        Double saleDev = standardDev(getSalesArray(sales));
        Double z = serviceLevelToZ();

        this.stock = z * saleDev * Math.sqrt(leadCycle);
        logger.info(String.format("DemandVariable Calculation Info #1: SaleDev: %s, serviceLevelToZ: %s, stock: %s",
                saleDev, z, stock));
    }
}
