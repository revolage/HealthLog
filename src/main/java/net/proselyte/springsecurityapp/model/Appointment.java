package net.proselyte.springsecurityapp.model;

import lombok.Data;
import javax.persistence.*;
import java.text.SimpleDateFormat;
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

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_patient", nullable = false)
    private Patient patient;

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

    @Column(name = "isVisited")
    private Boolean isVisited;

    @Column(name = "isCanceled")
    private Boolean isCanceled;







}
