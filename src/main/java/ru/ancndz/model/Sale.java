package ru.ancndz.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import java.time.LocalDateTime;
import java.util.Objects;

@Entity
@Table
public class Sale {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private String id;

    @Column
    private LocalDateTime saleDate;

    @Column
    private Double saleCount;

    public Sale() {
    }

    public Sale(LocalDateTime saleDate, Double saleCount) {
        this.saleDate = saleDate;
        this.saleCount = saleCount;
    }

    public Sale(String id, LocalDateTime saleDate, Double saleCount) {
        this.id = id;
        this.saleDate = saleDate;
        this.saleCount = saleCount;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public LocalDateTime getSaleDate() {
        return saleDate;
    }

    public void setSaleDate(LocalDateTime saleDate) {
        this.saleDate = saleDate;
    }

    public Double getSaleCount() {
        return saleCount;
    }

    public void setSaleCount(Double saleCount) {
        this.saleCount = saleCount;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Sale sale = (Sale) o;
        return saleDate.equals(sale.saleDate) &&
                saleCount.equals(sale.saleCount);
    }

    @Override
    public int hashCode() {
        return Objects.hash(saleDate, saleCount);
    }
}
