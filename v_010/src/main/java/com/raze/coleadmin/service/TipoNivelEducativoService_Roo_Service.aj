// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.coleadmin.service;

import com.raze.coleadmin.catalog.TipoNivelEducativo;
import com.raze.coleadmin.service.TipoNivelEducativoService;
import java.util.List;

privileged aspect TipoNivelEducativoService_Roo_Service {
    
    public abstract long TipoNivelEducativoService.countAllTipoNivelEducativoes();    
    public abstract void TipoNivelEducativoService.deleteTipoNivelEducativo(TipoNivelEducativo tipoNivelEducativo);    
    public abstract TipoNivelEducativo TipoNivelEducativoService.findTipoNivelEducativo(Long id);    
    public abstract List<TipoNivelEducativo> TipoNivelEducativoService.findAllTipoNivelEducativoes();    
    public abstract List<TipoNivelEducativo> TipoNivelEducativoService.findTipoNivelEducativoEntries(int firstResult, int maxResults);    
    public abstract void TipoNivelEducativoService.saveTipoNivelEducativo(TipoNivelEducativo tipoNivelEducativo);    
    public abstract TipoNivelEducativo TipoNivelEducativoService.updateTipoNivelEducativo(TipoNivelEducativo tipoNivelEducativo);    
}