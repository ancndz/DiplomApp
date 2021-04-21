package ru.ancndz.calculations;

public class DemandVariable extends Calculation {

    @Override
    public void calculate() {
        double[] a = getSalesArray();
        this.stock = serviceLevelToZ() * standardDev(a) * Math.sqrt(leadCycle);
    }


}
