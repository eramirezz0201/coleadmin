// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.coleadmin.catalog;

import com.raze.coleadmin.catalog.EstatusCargo;
import com.raze.coleadmin.domain.Usuario;
import java.util.Date;

privileged aspect EstatusCargo_Roo_JavaBean {
    
    public String EstatusCargo.getNombreEstatusCargo() {
        return this.nombreEstatusCargo;
    }
    
    public void EstatusCargo.setNombreEstatusCargo(String nombreEstatusCargo) {
        this.nombreEstatusCargo = nombreEstatusCargo;
    }
    
    public String EstatusCargo.getDescripcion() {
        return this.descripcion;
    }
    
    public void EstatusCargo.setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    public Usuario EstatusCargo.getUsuarioCrea() {
        return this.usuarioCrea;
    }
    
    public void EstatusCargo.setUsuarioCrea(Usuario usuarioCrea) {
        this.usuarioCrea = usuarioCrea;
    }
    
    public Usuario EstatusCargo.getUsuarioModifica() {
        return this.usuarioModifica;
    }
    
    public void EstatusCargo.setUsuarioModifica(Usuario usuarioModifica) {
        this.usuarioModifica = usuarioModifica;
    }
    
    public Date EstatusCargo.getFechaCreacion() {
        return this.fechaCreacion;
    }
    
    public void EstatusCargo.setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }
    
    public Date EstatusCargo.getFechaModificacion() {
        return this.fechaModificacion;
    }
    
    public void EstatusCargo.setFechaModificacion(Date fechaModificacion) {
        this.fechaModificacion = fechaModificacion;
    }
    
    public Boolean EstatusCargo.getActivo() {
        return this.activo;
    }
    
    public void EstatusCargo.setActivo(Boolean activo) {
        this.activo = activo;
    }
    
}