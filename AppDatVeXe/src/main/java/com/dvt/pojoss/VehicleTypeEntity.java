package com.dvt.pojoss;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "vehicle_type", schema = "bookticketsdb_java", catalog = "")
public class VehicleTypeEntity implements Serializable {
    private long id;
    private String nameType;

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name_type")
    public String getNameType() {
        return nameType;
    }

    public void setNameType(String nameType) {
        this.nameType = nameType;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        VehicleTypeEntity that = (VehicleTypeEntity) o;

        if (id != that.id) return false;
        if (nameType != null ? !nameType.equals(that.nameType) : that.nameType != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (nameType != null ? nameType.hashCode() : 0);
        return result;
    }
}
