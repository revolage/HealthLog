package com.kachur.model;


import lombok.Data;
import org.hibernate.annotations.ColumnDefault;

import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.Date;

@Entity
@Table(name="appointment")
@Data
public class Appointment {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_doctor", nullable = false)
    private Doctor doctor;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_patient", nullable = false)
    private Patient patient;

    //@DateTimeFormat(pattern = "dd/MM/yyyy")
    @Column(name = "date")
    private Date date;

    public String getDate() {

        return new SimpleDateFormat("dd.MM.yyyy").format(date);
    }

    @Column(name = "symptoms")
    private String symptoms;

    @Column(name = "diagnosis")
    private String diagnosis;

    @Column(name = "medication")
    private String medication;

    @Column(name = "notes")
    private String notes;

    @ColumnDefault("false")
    @Column(name = "isVisited")
    private Boolean isVisited;

    @ColumnDefault("false")
    @Column(name = "isCanceled")
    private Boolean isCanceled;







}
