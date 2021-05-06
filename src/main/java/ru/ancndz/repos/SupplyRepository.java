package ru.ancndz.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.ancndz.model.Supply;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface SupplyRepository extends JpaRepository<Supply, String> {
    Supply findFirstByOrderByBeginDateAsc();

    Supply findFirstByOrderByEndDateDesc();

    List<Supply> findAllByBeginDateIsAfterAndEndDateIsBefore(LocalDate minDate, LocalDate maxDate);
}
