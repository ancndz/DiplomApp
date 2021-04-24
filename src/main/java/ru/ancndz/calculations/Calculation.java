package ru.ancndz.calculations;

import org.apache.commons.math3.special.Erf;
import org.apache.commons.math3.stat.descriptive.moment.StandardDeviation;
import org.springframework.stereotype.Component;
import ru.ancndz.model.Sale;
import ru.ancndz.model.Supply;

import java.time.Duration;
import java.time.Period;
import java.util.Arrays;
import java.util.List;

public abstract class Calculation {

    /**
     * Страховой запас.
     */
    protected Double stock = .0;

    /**
     * Уровень сервиса.
     */
    protected Double demandVolumeLevel;

    /**
     * Планируемое время выполнения заказа.
     */
    protected Double leadCycle = .0;

    /**
     * Дневной спрос.
     */
    protected Double demand = .0;


    protected Double orderVal = .0;

    public Calculation() {}

    public Calculation(Double demandVolumeLevel) {
        this.demandVolumeLevel = demandVolumeLevel;
    }

    /**
     * Расчет.
     */
    public abstract void calculate(List<Sale> sales, List<Supply> supplies);

    public Double getStock() {
        System.out.println(stock);
        return stock;
    }

    protected Double standardDev(double[] array) {
        StandardDeviation standardDeviation = new StandardDeviation(false);
        return standardDeviation.evaluate(array);
    }

    protected Double calcAverage(double[] array) {
        return Arrays.stream(array).average().orElse(Double.NaN);
    }

    protected double serviceLevelToZ() {
        return Math.sqrt(2) * Erf.erfcInv(2 * (1 - (demandVolumeLevel / 100)));
    }

    protected double[] getSalesArray(List<Sale> saleList) {
        double[] a = new double[saleList.size()];
        for (int i = 0; i < saleList.size(); i++) {
            a[i] = saleList.get(i).getSaleCount();
        }
        return a;
    }

    protected double[] getSupplyDaysArray(List<Supply> supplyList) {
        double[] b = new double[supplyList.size()];
        for (int i = 0; i < supplyList.size(); i++) {
            b[i] = Period.between(supplyList.get(i).getBeginDate(), supplyList.get(i).getEndDate()).getDays();
        }
        return b;
    }

    public void setStock(Double stock) {
        this.stock = stock;
    }

    public Double getDemandVolumeLevel() {
        return demandVolumeLevel;
    }

    public void setDemandVolumeLevel(Double demandVolumeLevel) {
        this.demandVolumeLevel = demandVolumeLevel;
    }

    public Double getLeadCycle() {
        return leadCycle;
    }

    public void setLeadCycle(Double leadCycle) {
        this.leadCycle = leadCycle;
    }

    public Double getDemand() {
        return demand;
    }

    public void setDemand(Double demand) {
        this.demand = demand;
    }

    public Double getOrderVal() {
        return orderVal;
    }

    public void setOrderVal(Double orderVal) {
        this.orderVal = orderVal;
    }
}
