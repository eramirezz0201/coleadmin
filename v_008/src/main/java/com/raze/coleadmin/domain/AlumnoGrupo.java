package com.raze.coleadmin.domain;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import javax.persistence.ManyToOne;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Version;
import com.raze.coleadmin.catalog.TipoEscuela;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import javax.persistence.Enumerated;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class AlumnoGrupo {

    /**
     */
    @ManyToOne
    private Alumno alumno;

    /**
     */
    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Grupo> grupo = new HashSet<Grupo>();

    /**
     */
    @Enumerated
    private TipoEscuela tipoEscuela;

    /**
     */
    private String observaciones;

    /**
     */
    private Long idUsuario;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date fechaCreacion;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date fechaModificacion;

    /**
     */
    private Boolean activo;

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

	public Alumno getAlumno() {
        return this.alumno;
    }

	public void setAlumno(Alumno alumno) {
        this.alumno = alumno;
    }

	public Set<Grupo> getGrupo() {
        return this.grupo;
    }

	public void setGrupo(Set<Grupo> grupo) {
        this.grupo = grupo;
    }

	public TipoEscuela getTipoEscuela() {
        return this.tipoEscuela;
    }

	public void setTipoEscuela(TipoEscuela tipoEscuela) {
        this.tipoEscuela = tipoEscuela;
    }

	public String getObservaciones() {
        return this.observaciones;
    }

	public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

	public Long getIdUsuario() {
        return this.idUsuario;
    }

	public void setIdUsuario(Long idUsuario) {
        this.idUsuario = idUsuario;
    }

	public Date getFechaCreacion() {
        return this.fechaCreacion;
    }

	public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

	public Date getFechaModificacion() {
        return this.fechaModificacion;
    }

	public void setFechaModificacion(Date fechaModificacion) {
        this.fechaModificacion = fechaModificacion;
    }

	public Boolean getActivo() {
        return this.activo;
    }

	public void setActivo(Boolean activo) {
        this.activo = activo;
    }

	public String toString() {
        return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }

	public String toJson() {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(this);
    }

	public String toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(this);
    }

	public static AlumnoGrupo fromJsonToAlumnoGrupo(String json) {
        return new JSONDeserializer<AlumnoGrupo>()
        .use(null, AlumnoGrupo.class).deserialize(json);
    }

	public static String toJsonArray(Collection<AlumnoGrupo> collection) {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(collection);
    }

	public static String toJsonArray(Collection<AlumnoGrupo> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(collection);
    }

	public static Collection<AlumnoGrupo> fromJsonArrayToAlumnoGrupoes(String json) {
        return new JSONDeserializer<List<AlumnoGrupo>>()
        .use("values", AlumnoGrupo.class).deserialize(json);
    }
}
