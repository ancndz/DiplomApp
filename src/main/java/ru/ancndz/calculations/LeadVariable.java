package ru.ancndz.calculations;

public class LeadVariable extends Calculation {

    @Override
    public void calculate() {
        double[] a = getSupplyDaysArray();
        this.stock = serviceLevelToZ() * standardDev(a) * demand;
    }

}
