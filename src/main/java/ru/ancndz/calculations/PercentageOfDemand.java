package ru.ancndz.calculations;

import ru.ancndz.model.Sale;
import ru.ancndz.model.Supply;

import java.util.List;

/**
 * Класс, отвечающий за расчет оптимального запаса для товаров с длительным,
 * но постоянным временем выполнения заказа и довольно постоянным спросом
 * или товаров с очень коротким временем выполнения заказа и существенными колебаниями спроса от месяца к месяцу.
 */
public class PercentageOfDemand extends LeadAndDemandVariable {

    public PercentageOfDemand(Double demandVolumeLevel, Double leadCycle, Double demand) {
        super(demandVolumeLevel, leadCycle);
        this.demand = demand;
    }

    @Override
    public void calculate(List<Sale> sales, List<Supply> supplies) {
        stock = (leadCycle * demand) * (demandVolumeLevel / 100);
    }

}
