// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.coleadmin.service;

import com.raze.coleadmin.catalog.TipoAsistencia;
import com.raze.coleadmin.service.TipoAsistenciaService;
import java.util.List;

privileged aspect TipoAsistenciaService_Roo_Service {
    
    public abstract long TipoAsistenciaService.countAllTipoAsistencias();    
    public abstract void TipoAsistenciaService.deleteTipoAsistencia(TipoAsistencia tipoAsistencia);    
    public abstract TipoAsistencia TipoAsistenciaService.findTipoAsistencia(Long id);    
    public abstract List<TipoAsistencia> TipoAsistenciaService.findAllTipoAsistencias();    
    public abstract List<TipoAsistencia> TipoAsistenciaService.findTipoAsistenciaEntries(int firstResult, int maxResults);    
    public abstract void TipoAsistenciaService.saveTipoAsistencia(TipoAsistencia tipoAsistencia);    
    public abstract TipoAsistencia TipoAsistenciaService.updateTipoAsistencia(TipoAsistencia tipoAsistencia);    
}