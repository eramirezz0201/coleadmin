// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.coleadmin.service;

import com.raze.coleadmin.domain.Curso;
import com.raze.coleadmin.service.CursoService;
import java.util.List;

privileged aspect CursoService_Roo_Service {
    
    public abstract long CursoService.countAllCursoes();    
    public abstract void CursoService.deleteCurso(Curso curso);    
    public abstract Curso CursoService.findCurso(Long id);    
    public abstract List<Curso> CursoService.findAllCursoes();    
    public abstract List<Curso> CursoService.findCursoEntries(int firstResult, int maxResults);    
    public abstract void CursoService.saveCurso(Curso curso);    
    public abstract Curso CursoService.updateCurso(Curso curso);    
}