package ru.ancndz.calculations;

import org.apache.commons.math3.special.Erf;
import org.apache.commons.math3.stat.descriptive.moment.StandardDeviation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import ru.ancndz.model.Sale;
import ru.ancndz.model.Supply;

import java.time.Period;
import java.util.Arrays;
import java.util.List;

/**
 * Класс, являющийся основой для конечных реализаций моделей.
 */
public abstract class Calculation {

    /**
     * Логгер.
     */
    static final Logger logger = LoggerFactory.getLogger(Calculation.class);

    /**
     * Страховой запас.
     */
    protected Double stock = .0;

    /**
     * Уровень сервиса.
     */
    protected Double demandVolumeLevel;

    /**
     * Планируемое время выполнения заказа (дни).
     */
    protected Double leadCycle = .0;

    /**
     * Дневной спрос.
     */
    protected Double dailyDemand = .0;

    /**
     * Величина заказа.
     */
    protected Double orderVal = .0;

    /**
     * Конструктор.
     *
     * @param demandVolumeLevel уровень сервиса
     */
    public Calculation(Double demandVolumeLevel) {
        this.demandVolumeLevel = demandVolumeLevel;
    }

    /**
     * Расчет.
     */
    public abstract void calculate(List<Sale> sales, List<Supply> supplies);

    /**
     * Получение нормального ответа.
     *
     * @return рассчитанная величина страхового запаса.
     */
    public Double getStock() {
        return Math.abs(stock) < 1e-5 || stock.isNaN() ? 0 : stock;
    }

    /**
     * Стандартное отклонение.
     *
     * @param array исследуемый массив
     * @return стандартное отклонение
     */
    protected Double standardDev(double[] array) {
        StandardDeviation standardDeviation = new StandardDeviation(false);
        return standardDeviation.evaluate(array);
    }

    /**
     * Среднее.
     *
     * @param array исследуемый массив
     * @return среднее
     */
    protected Double calcAverage(double[] array) {
        return Arrays.stream(array).average().orElse(Double.NaN);
    }

    /**
     * Расчет Z коэффициента.
     *
     * @return Z коэффициент
     */
    protected double serviceLevelToZ() {
        return Math.sqrt(2) * Erf.erfcInv(2 * (1 - (demandVolumeLevel / 100)));
    }

    /**
     * Преобразование списка продаж в массив.
     *
     * @param saleList список продаж
     * @return массив
     */
    protected double[] getSalesArray(List<Sale> saleList) {
        double[] array = new double[saleList.size()];
        for (int i = 0; i < saleList.size(); i++) {
            array[i] = saleList.get(i).getSaleCount();
        }
        return array;
    }

    /**
     * Преобразование списка поставок в массив интервалов между поставками.
     *
     * @param supplyList список поставок
     * @return массив интервалов
     */
    protected double[] getSupplyDaysArray(List<Supply> supplyList) {
        double[] array = new double[supplyList.size()];
        for (int i = 0; i < supplyList.size(); i++) {
            array[i] = Period.between(supplyList.get(i).getBeginDate(), supplyList.get(i).getEndDate()).getDays();
        }
        return array;
    }
}
