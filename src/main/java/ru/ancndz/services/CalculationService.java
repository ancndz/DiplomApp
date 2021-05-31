package ru.ancndz.services;

import org.springframework.stereotype.Service;
import ru.ancndz.model.Sale;
import ru.ancndz.model.Supply;
import ru.ancndz.repos.SalesRepository;
import ru.ancndz.repos.SupplyRepository;

import java.time.LocalDate;
import java.util.List;

/**
 * Сервис для работы с расчетами.
 */
@Service
public class CalculationService {

    /**
     * Репозиторий для работы с продажами товаров.
     */
    private final SalesRepository salesRepository;

    /**
     * Репозиторий для работы с поставками товаров.
     */
    private final SupplyRepository supplyRepository;

    /**
     * Конструктор.
     *
     * @param salesRepository  репозиторий для работы с продажами товаров
     * @param supplyRepository репозиторий для работы с поставками товаров
     */
    public CalculationService(SalesRepository salesRepository, SupplyRepository supplyRepository) {
        this.salesRepository = salesRepository;
        this.supplyRepository = supplyRepository;
    }

    public List<Sale> findAllSales() {
        return salesRepository.findAll();
    }

    public List<Supply> findAllSupplies() {
        return supplyRepository.findAll();
    }

    public List<Sale> findSalesDependsOnDate(LocalDate minDate, LocalDate maxDate) {
        return salesRepository.findAllBySaleDateBetween(minDate, maxDate);
    }

    public List<Supply> findSuppliesDependsOnDate(LocalDate minDate, LocalDate maxDate) {
        return supplyRepository.findAllByBeginDateIsAfterAndEndDateIsBefore(minDate, maxDate);
    }

    public LocalDate getMinDate() {
        LocalDate saleFirstDate = salesRepository.findFirstByOrderBySaleDateAsc().getSaleDate();
        LocalDate supplyFirstDate = supplyRepository.findFirstByOrderByBeginDateAsc().getBeginDate();
        return saleFirstDate.isAfter(supplyFirstDate) ? saleFirstDate : supplyFirstDate;
    }

    public LocalDate getMaxDate() {
        LocalDate saleLastDate = salesRepository.findFirstByOrderBySaleDateDesc().getSaleDate();
        LocalDate supplyLastDate = supplyRepository.findFirstByOrderByEndDateDesc().getEndDate();
        return saleLastDate.isBefore(supplyLastDate) ? saleLastDate : supplyLastDate;
    }
}
