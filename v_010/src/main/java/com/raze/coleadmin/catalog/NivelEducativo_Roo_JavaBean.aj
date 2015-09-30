// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.coleadmin.catalog;

import com.raze.coleadmin.catalog.NivelEducativo;
import com.raze.coleadmin.catalog.TipoNivelEducativo;
import com.raze.coleadmin.domain.Escuela;
import com.raze.coleadmin.domain.Usuario;
import java.util.Date;

privileged aspect NivelEducativo_Roo_JavaBean {
    
    public TipoNivelEducativo NivelEducativo.getTipoNivelEducativo() {
        return this.tipoNivelEducativo;
    }
    
    public void NivelEducativo.setTipoNivelEducativo(TipoNivelEducativo tipoNivelEducativo) {
        this.tipoNivelEducativo = tipoNivelEducativo;
    }
    
    public Escuela NivelEducativo.getEscuela() {
        return this.escuela;
    }
    
    public void NivelEducativo.setEscuela(Escuela escuela) {
        this.escuela = escuela;
    }
    
    public String NivelEducativo.getNombreNivelEducativo() {
        return this.nombreNivelEducativo;
    }
    
    public void NivelEducativo.setNombreNivelEducativo(String nombreNivelEducativo) {
        this.nombreNivelEducativo = nombreNivelEducativo;
    }
    
    public String NivelEducativo.getClave() {
        return this.clave;
    }
    
    public void NivelEducativo.setClave(String clave) {
        this.clave = clave;
    }
    
    public String NivelEducativo.getDescripcion() {
        return this.descripcion;
    }
    
    public void NivelEducativo.setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    public Usuario NivelEducativo.getUsuarioCrea() {
        return this.usuarioCrea;
    }
    
    public void NivelEducativo.setUsuarioCrea(Usuario usuarioCrea) {
        this.usuarioCrea = usuarioCrea;
    }
    
    public Usuario NivelEducativo.getUsuarioModifica() {
        return this.usuarioModifica;
    }
    
    public void NivelEducativo.setUsuarioModifica(Usuario usuarioModifica) {
        this.usuarioModifica = usuarioModifica;
    }
    
    public Date NivelEducativo.getFechaCreacion() {
        return this.fechaCreacion;
    }
    
    public void NivelEducativo.setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }
    
    public Date NivelEducativo.getFechaModificacion() {
        return this.fechaModificacion;
    }
    
    public void NivelEducativo.setFechaModificacion(Date fechaModificacion) {
        this.fechaModificacion = fechaModificacion;
    }
    
    public Boolean NivelEducativo.getActivo() {
        return this.activo;
    }
    
    public void NivelEducativo.setActivo(Boolean activo) {
        this.activo = activo;
    }
    
}
