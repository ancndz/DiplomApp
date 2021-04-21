package ru.ancndz.calculations;

import org.junit.jupiter.api.Test;

class DemandVariableTest {

    DemandVariable d = new DemandVariable();

    @Test
    void pToZ() {
        System.out.println(d.serviceLevelToZ(0.99));
    }
}