package com.raze.coleadmin.domain;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import javax.persistence.ManyToOne;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Version;
import org.springframework.format.annotation.DateTimeFormat;
import com.raze.coleadmin.catalog.MetodoPago;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import javax.persistence.Enumerated;
import javax.persistence.Lob;

@Entity
public class PagoEscuela {

    /**
     */
    @ManyToOne
    private Escuela escuela;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date fechaPago;

    /**
     */
    @Enumerated
    private MetodoPago metodoPago;

    /**
     */
    @Lob
    private byte[] comprobantePago;

    /**
     */
    private String contentType;

	public String toString() {
        return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

	@Version
    @Column(name = "version")
    private Integer version;

	public Long getId() {
        return this.id;
    }

	public void setId(Long id) {
        this.id = id;
    }

	public Integer getVersion() {
        return this.version;
    }

	public void setVersion(Integer version) {
        this.version = version;
    }

	public Escuela getEscuela() {
        return this.escuela;
    }

	public void setEscuela(Escuela escuela) {
        this.escuela = escuela;
    }

	public Date getFechaPago() {
        return this.fechaPago;
    }

	public void setFechaPago(Date fechaPago) {
        this.fechaPago = fechaPago;
    }

	public MetodoPago getMetodoPago() {
        return this.metodoPago;
    }

	public void setMetodoPago(MetodoPago metodoPago) {
        this.metodoPago = metodoPago;
    }

	public byte[] getComprobantePago() {
        return this.comprobantePago;
    }

	public void setComprobantePago(byte[] comprobantePago) {
        this.comprobantePago = comprobantePago;
    }

	public String getContentType() {
        return this.contentType;
    }

	public void setContentType(String contentType) {
        this.contentType = contentType;
    }

	public String toJson() {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(this);
    }

	public String toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(this);
    }

	public static PagoEscuela fromJsonToPagoEscuela(String json) {
        return new JSONDeserializer<PagoEscuela>()
        .use(null, PagoEscuela.class).deserialize(json);
    }

	public static String toJsonArray(Collection<PagoEscuela> collection) {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(collection);
    }

	public static String toJsonArray(Collection<PagoEscuela> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(collection);
    }

	public static Collection<PagoEscuela> fromJsonArrayToPagoEscuelas(String json) {
        return new JSONDeserializer<List<PagoEscuela>>()
        .use("values", PagoEscuela.class).deserialize(json);
    }
}
