package ru.ancndz;

import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import ru.ancndz.model.Sale;
import ru.ancndz.model.Supply;
import ru.ancndz.repos.SalesRepository;
import ru.ancndz.repos.SupplyRepository;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@SpringBootApplication
public class Run implements ApplicationRunner {

    private final SalesRepository salesRepository;
    private final SupplyRepository supplyRepository;

    public Run(SalesRepository salesRepository, SupplyRepository supplyRepository) {
        this.salesRepository = salesRepository;
        this.supplyRepository = supplyRepository;
    }

    @Override
    public void run(ApplicationArguments args) {
        String datePattern = "dd.MM.yyyy";
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern(datePattern);

        //addInitDataSales(dateTimeFormatter);
        //addInitDataSupplies(dateTimeFormatter);
    }

    private void addInitDataSupplies(DateTimeFormatter dateTimeFormatter) {

        try (BufferedReader br = new BufferedReader(
                new InputStreamReader(
                        new FileInputStream(
                                new File("supplies.txt")
                        )
                )
        )) {
            String line;
            while ((line = br.readLine()) != null) {
                supplyRepository.save(parseSupplyLine(line.split("\t"), dateTimeFormatter));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private Supply parseSupplyLine(String[] line, DateTimeFormatter dateTimeFormatter) {
        return new Supply(LocalDate.from(dateTimeFormatter.parse(line[0])), LocalDate.from(dateTimeFormatter.parse(line[1])));
    }

    private void addInitDataSales(DateTimeFormatter dateTimeFormatter) {
        try (BufferedReader br = new BufferedReader(
                new InputStreamReader(
                        new FileInputStream(
                                new File("sales.txt")
                        )
                )
        )) {
            String line;
            while ((line = br.readLine()) != null) {
                salesRepository.save(parseSaleLine(line.split("\t"), dateTimeFormatter));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private Sale parseSaleLine(String[] split, DateTimeFormatter dateTimeFormatter) {
        return new Sale(LocalDate.from(dateTimeFormatter.parse(split[0])), Double.valueOf(split[1]));
    }

}
