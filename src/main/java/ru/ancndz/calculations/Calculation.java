package ru.ancndz.calculations;

import org.apache.commons.math3.special.Erf;
import org.apache.commons.math3.stat.descriptive.moment.StandardDeviation;
import ru.ancndz.model.Sale;
import ru.ancndz.model.Supply;

import java.time.Duration;
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
     * Продажи.
     */
    protected List<Sale> saleList;

    /**
     * Планируемое время выполнения заказа.
     */
    protected Double leadCycle;

    /**
     * Даты заказов и поставок.
     */
    protected List<Supply> supplyList;

    /**
     * Дневной спрос.
     */
    protected Double demand;

    /**
     * Расчет.
     */
    public abstract void calculate();

    public Double getStock() {
        return stock;
    }

    protected Double standardDev(double[] array) {
        StandardDeviation standardDeviation = new StandardDeviation(false);
        return standardDeviation.evaluate(array);

        /*Double average = Arrays.stream(array).average().orElse(Double.NaN);

        double dev = .0;
        int size = array.length - 1;

        for (Double each: array) {
            dev += Math.pow(each - average, 2) / size;
        }

        return Math.sqrt(dev);*/
    }

    protected Double calcAverage(double[] array) {
        return Arrays.stream(array).average().orElse(Double.NaN);
    }

    protected double serviceLevelToZ() {
        return Math.sqrt(2) * Erf.erfcInv(2 * (1 - (demandVolumeLevel / 100)));
    }

    protected double[] getSupplyDaysArray() {
        double[] a = new double[saleList.size()];
        for (int i = 0; i < saleList.size(); i++) {
            a[i] = saleList.get(i).getSaleCount();
        }
        return a;
    }

    protected double[] getSalesArray() {
        double[] b = new double[supplyList.size()];
        for (int i = 0; i < supplyList.size(); i++) {
            b[i] = Duration.between(supplyList.get(i).getBeginDate(), supplyList.get(i).getEndDate()).toDays();
        }
        return b;
    }

    public void setDemandVolumeLevel(Double demandVolumeLevel) {
        this.demandVolumeLevel = demandVolumeLevel;
    }

    public void setSaleList(List<Sale> saleList) {
        this.saleList = saleList;
    }

    public void setLeadCycle(Double leadCycle) {
        this.leadCycle = leadCycle;
    }

    public void setSupplyList(List<Supply> supplyList) {
        this.supplyList = supplyList;
    }

    public void setDemand(Double demand) {
        this.demand = demand;
    }
}
