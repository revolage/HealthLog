package net.proselyte.springsecurityapp.model;

import lombok.Data;
import javax.persistence.*;
import java.util.Date;
import java.util.Set;

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

    @Column(name = "id_patient")
    private Long patientId;

    @Column(name = "date")
    private Date date;

    @Column(name = "symptoms")
    private String symptoms;

    @Column(name = "diagnosis")
    private String diagnosis;

    @Column(name = "medication")
    private String medication;

    @Column(name = "notes")
    private String notes;

    @Column(name = "isVisited")
    private Boolean isVisited;

    @Column(name = "isCanceled")
    private Boolean isCanceled;





}
