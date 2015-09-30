// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.coleadmin.service;

import com.raze.coleadmin.catalog.TipoAsistencia;
import com.raze.coleadmin.repository.TipoAsistenciaRepository;
import com.raze.coleadmin.service.TipoAsistenciaServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect TipoAsistenciaServiceImpl_Roo_Service {
    
    declare @type: TipoAsistenciaServiceImpl: @Service;
    
    declare @type: TipoAsistenciaServiceImpl: @Transactional;
    
    @Autowired
    TipoAsistenciaRepository TipoAsistenciaServiceImpl.tipoAsistenciaRepository;
    
    public long TipoAsistenciaServiceImpl.countAllTipoAsistencias() {
        return tipoAsistenciaRepository.count();
    }
    
    public void TipoAsistenciaServiceImpl.deleteTipoAsistencia(TipoAsistencia tipoAsistencia) {
        tipoAsistenciaRepository.delete(tipoAsistencia);
    }
    
    public TipoAsistencia TipoAsistenciaServiceImpl.findTipoAsistencia(Long id) {
        return tipoAsistenciaRepository.findOne(id);
    }
    
    public List<TipoAsistencia> TipoAsistenciaServiceImpl.findAllTipoAsistencias() {
        return tipoAsistenciaRepository.findAll();
    }
    
    public List<TipoAsistencia> TipoAsistenciaServiceImpl.findTipoAsistenciaEntries(int firstResult, int maxResults) {
        return tipoAsistenciaRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void TipoAsistenciaServiceImpl.saveTipoAsistencia(TipoAsistencia tipoAsistencia) {
        tipoAsistenciaRepository.save(tipoAsistencia);
    }
    
    public TipoAsistencia TipoAsistenciaServiceImpl.updateTipoAsistencia(TipoAsistencia tipoAsistencia) {
        return tipoAsistenciaRepository.save(tipoAsistencia);
    }
    
}