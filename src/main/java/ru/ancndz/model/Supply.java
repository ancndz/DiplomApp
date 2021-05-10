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

@Entity
@Table
public class Supply {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private String id;

    @Column
    @NotNull
    private LocalDate beginDate;

    @Column
    @NotNull
    private LocalDate endDate;

    @Transient
    DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy.MM.dd");

    public Supply() {
    }

    public Supply(LocalDate beginDate, LocalDate endDate) {
        this.beginDate = beginDate;
        this.endDate = endDate;
    }

    public Supply(String id, LocalDate beginDate, LocalDate endDate) {
        this.id = id;
        this.beginDate = beginDate;
        this.endDate = endDate;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public LocalDate getBeginDate() {
        return beginDate;
    }

    public void setBeginDate(LocalDate beginDate) {
        this.beginDate = beginDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Supply supply = (Supply) o;
        return beginDate.equals(supply.beginDate) &&
                endDate.equals(supply.endDate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(beginDate, endDate);
    }

    @Override
    public String toString() {
        return String.format("Дата заказа: %s, Дата поставки: %s", this.beginDate.format(this.dateTimeFormatter), this.endDate.format(this.dateTimeFormatter));
    }
}
