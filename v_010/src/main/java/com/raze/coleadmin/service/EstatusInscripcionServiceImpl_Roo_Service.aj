// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.coleadmin.service;

import com.raze.coleadmin.catalog.EstatusInscripcion;
import com.raze.coleadmin.repository.EstatusInscripcionRepository;
import com.raze.coleadmin.service.EstatusInscripcionServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect EstatusInscripcionServiceImpl_Roo_Service {
    
    declare @type: EstatusInscripcionServiceImpl: @Service;
    
    declare @type: EstatusInscripcionServiceImpl: @Transactional;
    
    @Autowired
    EstatusInscripcionRepository EstatusInscripcionServiceImpl.estatusInscripcionRepository;
    
    public long EstatusInscripcionServiceImpl.countAllEstatusInscripcions() {
        return estatusInscripcionRepository.count();
    }
    
    public void EstatusInscripcionServiceImpl.deleteEstatusInscripcion(EstatusInscripcion estatusInscripcion) {
        estatusInscripcionRepository.delete(estatusInscripcion);
    }
    
    public EstatusInscripcion EstatusInscripcionServiceImpl.findEstatusInscripcion(Long id) {
        return estatusInscripcionRepository.findOne(id);
    }
    
    public List<EstatusInscripcion> EstatusInscripcionServiceImpl.findAllEstatusInscripcions() {
        return estatusInscripcionRepository.findAll();
    }
    
    public List<EstatusInscripcion> EstatusInscripcionServiceImpl.findEstatusInscripcionEntries(int firstResult, int maxResults) {
        return estatusInscripcionRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void EstatusInscripcionServiceImpl.saveEstatusInscripcion(EstatusInscripcion estatusInscripcion) {
        estatusInscripcionRepository.save(estatusInscripcion);
    }
    
    public EstatusInscripcion EstatusInscripcionServiceImpl.updateEstatusInscripcion(EstatusInscripcion estatusInscripcion) {
        return estatusInscripcionRepository.save(estatusInscripcion);
    }
    
}