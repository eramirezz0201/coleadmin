// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.coleadmin.domain;

import com.raze.coleadmin.catalog.Concepto;
import com.raze.coleadmin.catalog.EstatusCargo;
import com.raze.coleadmin.domain.Alumno;
import com.raze.coleadmin.domain.Cargo;
import com.raze.coleadmin.domain.Usuario;
import java.util.Date;

privileged aspect Cargo_Roo_JavaBean {
    
    public Alumno Cargo.getAlumno() {
        return this.alumno;
    }
    
    public void Cargo.setAlumno(Alumno alumno) {
        this.alumno = alumno;
    }
    
    public Concepto Cargo.getConcepto() {
        return this.concepto;
    }
    
    public void Cargo.setConcepto(Concepto concepto) {
        this.concepto = concepto;
    }
    
    public Double Cargo.getCantidad() {
        return this.cantidad;
    }
    
    public void Cargo.setCantidad(Double cantidad) {
        this.cantidad = cantidad;
    }
    
    public Double Cargo.getSubtotal() {
        return this.subtotal;
    }
    
    public void Cargo.setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }
    
    public Double Cargo.getDescuentoPorcentaje() {
        return this.descuentoPorcentaje;
    }
    
    public void Cargo.setDescuentoPorcentaje(Double descuentoPorcentaje) {
        this.descuentoPorcentaje = descuentoPorcentaje;
    }
    
    public Double Cargo.getDescuentoPesos() {
        return this.descuentoPesos;
    }
    
    public void Cargo.setDescuentoPesos(Double descuentoPesos) {
        this.descuentoPesos = descuentoPesos;
    }
    
    public Double Cargo.getTotal() {
        return this.total;
    }
    
    public void Cargo.setTotal(Double total) {
        this.total = total;
    }
    
    public EstatusCargo Cargo.getEstatusCargo() {
        return this.estatusCargo;
    }
    
    public void Cargo.setEstatusCargo(EstatusCargo estatusCargo) {
        this.estatusCargo = estatusCargo;
    }
    
    public Usuario Cargo.getUsuarioCrea() {
        return this.usuarioCrea;
    }
    
    public void Cargo.setUsuarioCrea(Usuario usuarioCrea) {
        this.usuarioCrea = usuarioCrea;
    }
    
    public Usuario Cargo.getUsuarioModifica() {
        return this.usuarioModifica;
    }
    
    public void Cargo.setUsuarioModifica(Usuario usuarioModifica) {
        this.usuarioModifica = usuarioModifica;
    }
    
    public Date Cargo.getFechaCreacion() {
        return this.fechaCreacion;
    }
    
    public void Cargo.setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }
    
    public Date Cargo.getFechaModificacion() {
        return this.fechaModificacion;
    }
    
    public void Cargo.setFechaModificacion(Date fechaModificacion) {
        this.fechaModificacion = fechaModificacion;
    }
    
    public Boolean Cargo.getActivo() {
        return this.activo;
    }
    
    public void Cargo.setActivo(Boolean activo) {
        this.activo = activo;
    }
    
}