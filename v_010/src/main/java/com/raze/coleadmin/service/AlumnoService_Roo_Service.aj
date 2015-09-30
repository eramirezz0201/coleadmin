// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.coleadmin.service;

import com.raze.coleadmin.domain.Alumno;
import com.raze.coleadmin.service.AlumnoService;
import java.util.List;

privileged aspect AlumnoService_Roo_Service {
    
    public abstract long AlumnoService.countAllAlumnoes();    
    public abstract void AlumnoService.deleteAlumno(Alumno alumno);    
    public abstract Alumno AlumnoService.findAlumno(Long id);    
    public abstract List<Alumno> AlumnoService.findAllAlumnoes();    
    public abstract List<Alumno> AlumnoService.findAlumnoEntries(int firstResult, int maxResults);    
    public abstract void AlumnoService.saveAlumno(Alumno alumno);    
    public abstract Alumno AlumnoService.updateAlumno(Alumno alumno);    
}