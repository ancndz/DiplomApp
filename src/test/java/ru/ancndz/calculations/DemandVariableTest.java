package ru.ancndz.calculations;

import org.junit.jupiter.api.Test;

class DemandVariableTest {

    DemandVariable d = new DemandVariable(0.99, 3.);


    @Test
    void pToZ() {
        System.out.println(d.serviceLevelToZ());
    }
}