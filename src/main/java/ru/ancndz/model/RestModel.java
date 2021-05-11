package ru.ancndz.model;


import java.time.LocalDate;

public class RestModel {

    private Double supplyTime;

    private Double dailyDemand;

    private Double demandVolumeLevel;

    private LocalDate minDate;

    private LocalDate maxDate;

    private Double orderVal;

    public RestModel() {
    }

    public Double getSupplyTime() {
        return supplyTime;
    }

    public void setSupplyTime(Double supplyTime) {
        this.supplyTime = supplyTime;
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
