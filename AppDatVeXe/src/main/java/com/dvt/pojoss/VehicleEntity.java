package com.dvt.pojoss;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "vehicle", schema = "bookticketsdb_java", catalog = "")
public class VehicleEntity implements Serializable {
    private long id;
    private String licensePlate;
    private int seat;
    private Long vehicleTypeId;
    private int extraCharges;
    private Long driverId;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "license_plate")
    public String getLicensePlate() {
        return licensePlate;
    }

    public void setLicensePlate(String licensePlate) {
        this.licensePlate = licensePlate;
    }

    @Basic
    @Column(name = "seat")
    public int getSeat() {
        return seat;
    }

    public void setSeat(int seat) {
        this.seat = seat;
    }

    @Basic
    @Column(name = "vehicle_type_id")
    public Long getVehicleTypeId() {
        return vehicleTypeId;
    }

    public void setVehicleTypeId(Long vehicleTypeId) {
        this.vehicleTypeId = vehicleTypeId;
    }

    @Basic
    @Column(name = "extra_charges")
    public int getExtraCharges() {
        return extraCharges;
    }

    public void setExtraCharges(int extraCharges) {
        this.extraCharges = extraCharges;
    }

    @Basic
    @Column(name = "driver_id")
    public Long getDriverId() {
        return driverId;
    }

    public void setDriverId(Long driverId) {
        this.driverId = driverId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        VehicleEntity that = (VehicleEntity) o;

        if (id != that.id) return false;
        if (seat != that.seat) return false;
        if (extraCharges != that.extraCharges) return false;
        if (licensePlate != null ? !licensePlate.equals(that.licensePlate) : that.licensePlate != null) return false;
        if (vehicleTypeId != null ? !vehicleTypeId.equals(that.vehicleTypeId) : that.vehicleTypeId != null)
            return false;
        if (driverId != null ? !driverId.equals(that.driverId) : that.driverId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (licensePlate != null ? licensePlate.hashCode() : 0);
        result = 31 * result + seat;
        result = 31 * result + (vehicleTypeId != null ? vehicleTypeId.hashCode() : 0);
        result = 31 * result + extraCharges;
        result = 31 * result + (driverId != null ? driverId.hashCode() : 0);
        return result;
    }
}
