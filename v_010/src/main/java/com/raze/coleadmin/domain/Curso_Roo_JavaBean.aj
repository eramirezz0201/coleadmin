// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.coleadmin.domain;

import com.raze.coleadmin.domain.CicloEscolar;
import com.raze.coleadmin.domain.Curso;
import com.raze.coleadmin.domain.Usuario;
import java.util.Date;

privileged aspect Curso_Roo_JavaBean {
    
    public String Curso.getNombreCurso() {
        return this.nombreCurso;
    }
    
    public void Curso.setNombreCurso(String nombreCurso) {
        this.nombreCurso = nombreCurso;
    }
    
    public CicloEscolar Curso.getCicloEscolar() {
        return this.cicloEscolar;
    }
    
    public void Curso.setCicloEscolar(CicloEscolar cicloEscolar) {
        this.cicloEscolar = cicloEscolar;
    }
    
    public Double Curso.getColegiatura() {
        return this.colegiatura;
    }
    
    public void Curso.setColegiatura(Double colegiatura) {
        this.colegiatura = colegiatura;
    }
    
    public Usuario Curso.getUsuarioCrea() {
        return this.usuarioCrea;
    }
    
    public void Curso.setUsuarioCrea(Usuario usuarioCrea) {
        this.usuarioCrea = usuarioCrea;
    }
    
    public Usuario Curso.getUsuarioModifica() {
        return this.usuarioModifica;
    }
    
    public void Curso.setUsuarioModifica(Usuario usuarioModifica) {
        this.usuarioModifica = usuarioModifica;
    }
    
    public Date Curso.getFechaCreacion() {
        return this.fechaCreacion;
    }
    
    public void Curso.setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }
    
    public Date Curso.getFechaModificacion() {
        return this.fechaModificacion;
    }
    
    public void Curso.setFechaModificacion(Date fechaModificacion) {
        this.fechaModificacion = fechaModificacion;
    }
    
    public Boolean Curso.getActivo() {
        return this.activo;
    }
    
    public void Curso.setActivo(Boolean activo) {
        this.activo = activo;
    }
    
}