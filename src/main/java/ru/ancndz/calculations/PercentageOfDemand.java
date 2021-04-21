package ru.ancndz.calculations;

/**
 * Класс, отвечающий за расчет оптимального запаса для товаров с длительным,
 * но постоянным временем выполнения заказа и довольно постоянным спросом
 * или товаров с очень коротким временем выполнения заказа и существенными колебаниями спроса от месяца к месяцу.
 */
public class PercentageOfDemand extends Calculation{
    /**
     * Планируемое время выполнения заказа.
     */
    double leadTime;

    /**
     * Дневной спрос.
     */
    double dailyDemand;

    /**
     * Уровень страхового запаса от объема спроса.
     */
    double demandVolumeLevel;

    @Override
    public void calculate() {
        stock = (leadTime * dailyDemand) * (demandVolumeLevel / 100);
    }

    public void setLeadTime(double leadTime) {
        this.leadTime = leadTime;
    }

    public void setDailyDemand(double dailyDemand) {
        this.dailyDemand = dailyDemand;
    }

    public void setDemandVolumeLevel(double demandVolumeLevel) {
        this.demandVolumeLevel = demandVolumeLevel;
    }

    public double getLeadTime() {
        return leadTime;
    }

    public double getDailyDemand() {
        return dailyDemand;
    }

    public double getDemandVolumeLevel() {
        return demandVolumeLevel;
    }

}
