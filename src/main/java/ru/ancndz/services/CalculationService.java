package ru.ancndz.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.ancndz.model.Sale;
import ru.ancndz.model.Supply;
import ru.ancndz.repos.SalesRepository;
import ru.ancndz.repos.SupplyRepository;

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
}
