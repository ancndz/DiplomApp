package ru.ancndz.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.ancndz.model.Supply;

@Repository
public interface SupplyRepository extends JpaRepository<Supply, String> {
}
