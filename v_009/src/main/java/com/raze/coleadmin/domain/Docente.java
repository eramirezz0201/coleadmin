package com.raze.coleadmin.domain;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.raze.coleadmin.catalog.Rol;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;

import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.validation.constraints.NotNull;
import javax.persistence.ManyToOne;

@Entity
public class Docente extends Usuario implements UserDetails {

/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

//    /**
//	 * 
//	 */
//	private static final long serialVersionUID = 1L;

	/**
     */
    @NotNull
    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Rol> roles = new HashSet<Rol>();

    /**
     */
    @NotNull
    @ManyToOne
    private Escuela escuela;

	public String toJson() {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(this);
    }

	public String toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(this);
    }

	public static Docente fromJsonToDocente(String json) {
        return new JSONDeserializer<Docente>()
        .use(null, Docente.class).deserialize(json);
    }

	public static String toJsonArray(Collection<Docente> collection) {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(collection);
    }

	public static String toJsonArray(Collection<Docente> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(collection);
    }

	public static Collection<Docente> fromJsonArrayToDocentes(String json) {
        return new JSONDeserializer<List<Docente>>()
        .use("values", Docente.class).deserialize(json);
    }

	public Set<Rol> getRoles() {
        return this.roles;
    }

	public void setRoles(Set<Rol> roles) {
        this.roles = roles;
    }

	public Escuela getEscuela() {
        return this.escuela;
    }

	public void setEscuela(Escuela escuela) {
        this.escuela = escuela;
    }

	public String toString() {
        return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return roles;
	}

	@Override
	public String getUsername() {
		return super.getCorreoE();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}
}
