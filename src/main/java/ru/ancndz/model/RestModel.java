package ru.ancndz.model;


import java.time.LocalDate;

/**
 * Модель запроса.
 */
public class RestModel {

    /**
     * Планируемое время выполнения заказа (дни).
     */
    private Double leadCycle;

    /**
     * Дневной спрос.
     */
    private Double dailyDemand;

    /**
     * Уровень сервиса.
     */
    private Double demandVolumeLevel;

    /**
     * Начальная дата исследования.
     */
    private LocalDate minDate;

    /**
     * Конечная дата исследования.
     */
    private LocalDate maxDate;

    /**
     * Величина заказа.
     */
    private Double orderVal;

    public RestModel() {
    }

    public Double getLeadCycle() {
        return leadCycle;
    }

    public void setLeadCycle(Double leadCycle) {
        this.leadCycle = leadCycle;
    }

    public Double getDailyDemand() {
        return dailyDemand;
    }

    public void setDailyDemand(Double dailyDemand) {
        this.dailyDemand = dailyDemand;
    }

    public Double getDemandVolumeLevel() {
        return demandVolumeLevel;
    }

    public void setDemandVolumeLevel(Double demandVolumeLevel) {
        this.demandVolumeLevel = demandVolumeLevel;
    }

    public LocalDate getMinDate() {
        return minDate;
    }

    public void setMinDate(LocalDate minDate) {
        this.minDate = minDate;
    }

    public LocalDate getMaxDate() {
        return maxDate;
    }

    public void setMaxDate(LocalDate maxDate) {
        this.maxDate = maxDate;
    }

    public Double getOrderVal() {
        return orderVal;
    }

    public void setOrderVal(Double orderVal) {
        this.orderVal = orderVal;
    }
}
