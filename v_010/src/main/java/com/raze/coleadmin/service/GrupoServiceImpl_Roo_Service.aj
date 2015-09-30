// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.coleadmin.service;

import com.raze.coleadmin.domain.Grupo;
import com.raze.coleadmin.repository.GrupoRepository;
import com.raze.coleadmin.service.GrupoServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect GrupoServiceImpl_Roo_Service {
    
    declare @type: GrupoServiceImpl: @Service;
    
    declare @type: GrupoServiceImpl: @Transactional;
    
    @Autowired
    GrupoRepository GrupoServiceImpl.grupoRepository;
    
    public long GrupoServiceImpl.countAllGrupoes() {
        return grupoRepository.count();
    }
    
    public void GrupoServiceImpl.deleteGrupo(Grupo grupo) {
        grupoRepository.delete(grupo);
    }
    
    public Grupo GrupoServiceImpl.findGrupo(Long id) {
        return grupoRepository.findOne(id);
    }
    
    public List<Grupo> GrupoServiceImpl.findAllGrupoes() {
        return grupoRepository.findAll();
    }
    
    public List<Grupo> GrupoServiceImpl.findGrupoEntries(int firstResult, int maxResults) {
        return grupoRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void GrupoServiceImpl.saveGrupo(Grupo grupo) {
        grupoRepository.save(grupo);
    }
    
    public Grupo GrupoServiceImpl.updateGrupo(Grupo grupo) {
        return grupoRepository.save(grupo);
    }
    
}
