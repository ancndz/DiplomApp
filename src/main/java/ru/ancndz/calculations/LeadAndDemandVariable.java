package ru.ancndz.calculations;

public class LeadAndDemandVariable extends Calculation {

    @Override
    public void calculate() {
        double[] a = getSalesArray();

        double[] b = getSupplyDaysArray();

        double averageD = calcAverage(a);

        this.stock = serviceLevelToZ() * Math.sqrt((Math.pow(standardDev(a), 2) * (leadCycle + standardDev(b))) + (Math.pow(averageD, 2) * Math.pow(standardDev(b), 2)));
    }
}
