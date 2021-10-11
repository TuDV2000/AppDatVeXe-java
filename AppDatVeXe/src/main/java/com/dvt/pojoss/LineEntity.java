package com.dvt.pojoss;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "line", schema = "bookticketsdb_java", catalog = "")
public class LineEntity implements Serializable {
    private long id;
    private String name;
    private Long endPointId;
    private Long startPointId;
    private int extraCharges;

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
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "end_point_id")
    public Long getEndPointId() {
        return endPointId;
    }

    public void setEndPointId(Long endPointId) {
        this.endPointId = endPointId;
    }

    @Basic
    @Column(name = "start_point_id")
    public Long getStartPointId() {
        return startPointId;
    }

    public void setStartPointId(Long startPointId) {
        this.startPointId = startPointId;
    }

    @Basic
    @Column(name = "extra_charges")
    public int getExtraCharges() {
        return extraCharges;
    }

    public void setExtraCharges(int extraCharges) {
        this.extraCharges = extraCharges;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        LineEntity that = (LineEntity) o;

        if (id != that.id) return false;
        if (extraCharges != that.extraCharges) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (endPointId != null ? !endPointId.equals(that.endPointId) : that.endPointId != null) return false;
        if (startPointId != null ? !startPointId.equals(that.startPointId) : that.startPointId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (endPointId != null ? endPointId.hashCode() : 0);
        result = 31 * result + (startPointId != null ? startPointId.hashCode() : 0);
        result = 31 * result + extraCharges;
        return result;
    }
}
