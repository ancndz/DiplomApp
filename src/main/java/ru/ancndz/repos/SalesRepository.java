package ru.ancndz.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.ancndz.model.Sale;

@Repository
public interface SalesRepository extends JpaRepository<Sale, String> {
}
