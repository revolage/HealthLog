package net.proselyte.springsecurityapp.model;

import lombok.Data;
import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name="doctors")
@Data
public class Doctor {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "email")
    private String email;

    @Column(name = "password")
    private String password;

    @Column(name = "name")
    private String name;

    @Column(name = "surname")
    private String surname;

    @Column(name = "fathername")
    private String fathername;

    @Column(name = "gender")
    private Boolean gender;

    @Column(name = "birthday")
    private Date birthday;

    @Column(name = "phone")
    private String phone;

    @Column(name = "photo")
    private Boolean photo;

    @ManyToOne
    @JoinColumn(name = "id_department", nullable = false)
    private Department department;


}
