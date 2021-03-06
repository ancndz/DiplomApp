package ru.ancndz.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Objects;

/**
 * Продажа.
 */
@Entity
@Table
public class Sale {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private String id;

    /**
     * Дата продажи.
     */
    @Column
    @NotNull
    private LocalDate saleDate;

    /**
     * Количество проданного товара.
     */
    @Column
    @NotNull
    private Double saleCount;

    @Transient
    DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy.MM.dd");

    public Sale() {
    }

    public Sale(LocalDate saleDate, Double saleCount) {
        this.saleDate = saleDate;
        this.saleCount = saleCount;
    }

    public Sale(String id, LocalDate saleDate, Double saleCount) {
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

    public LocalDate getSaleDate() {
        return saleDate;
    }

    public void setSaleDate(LocalDate saleDate) {
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

    @Override
    public String toString() {
        return String.format("Дата продажи: %s, Количество: %s", this.saleDate.format(this.dateTimeFormatter), this.saleCount.toString());
    }
}
