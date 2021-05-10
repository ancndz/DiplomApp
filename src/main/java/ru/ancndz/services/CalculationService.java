package ru.ancndz.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.ancndz.model.Sale;
import ru.ancndz.model.Supply;
import ru.ancndz.repos.SalesRepository;
import ru.ancndz.repos.SupplyRepository;

import java.time.LocalDate;
import java.util.List;

@Service
public class CalculationService {

    private final SalesRepository salesRepository;
    private final SupplyRepository supplyRepository;

    @Autowired
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
        return saleLastDate.isAfter(supplyLastDate) ? supplyLastDate : saleLastDate;
    }
}
