// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.coleadmin.catalog;

import com.raze.coleadmin.catalog.Categoria;
import com.raze.coleadmin.domain.Usuario;
import java.util.Date;

privileged aspect Categoria_Roo_JavaBean {
    
    public String Categoria.getNombreCategoria() {
        return this.nombreCategoria;
    }
    
    public void Categoria.setNombreCategoria(String nombreCategoria) {
        this.nombreCategoria = nombreCategoria;
    }
    
    public String Categoria.getDescripcion() {
        return this.descripcion;
    }
    
    public void Categoria.setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    public Usuario Categoria.getUsuarioCrea() {
        return this.usuarioCrea;
    }
    
    public void Categoria.setUsuarioCrea(Usuario usuarioCrea) {
        this.usuarioCrea = usuarioCrea;
    }
    
    public Usuario Categoria.getUsuarioModifica() {
        return this.usuarioModifica;
    }
    
    public void Categoria.setUsuarioModifica(Usuario usuarioModifica) {
        this.usuarioModifica = usuarioModifica;
    }
    
    public Date Categoria.getFechaCreacion() {
        return this.fechaCreacion;
    }
    
    public void Categoria.setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }
    
    public Date Categoria.getFechaModificacion() {
        return this.fechaModificacion;
    }
    
    public void Categoria.setFechaModificacion(Date fechaModificacion) {
        this.fechaModificacion = fechaModificacion;
    }
    
    public Boolean Categoria.getActivo() {
        return this.activo;
    }
    
    public void Categoria.setActivo(Boolean activo) {
        this.activo = activo;
    }
    
}