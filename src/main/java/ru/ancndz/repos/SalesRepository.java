package ru.ancndz.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.ancndz.model.Sale;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface SalesRepository extends JpaRepository<Sale, String> {
    Sale findFirstByOrderBySaleDateAsc();

    Sale findFirstByOrderBySaleDateDesc();

    List<Sale> findAllBySaleDateBetween(LocalDate minDate, LocalDate maxDate);
}
