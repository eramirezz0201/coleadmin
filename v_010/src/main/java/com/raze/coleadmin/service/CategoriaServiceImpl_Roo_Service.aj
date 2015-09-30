// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.coleadmin.service;

import com.raze.coleadmin.catalog.Categoria;
import com.raze.coleadmin.repository.CategoriaRepository;
import com.raze.coleadmin.service.CategoriaServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CategoriaServiceImpl_Roo_Service {
    
    declare @type: CategoriaServiceImpl: @Service;
    
    declare @type: CategoriaServiceImpl: @Transactional;
    
    @Autowired
    CategoriaRepository CategoriaServiceImpl.categoriaRepository;
    
    public long CategoriaServiceImpl.countAllCategorias() {
        return categoriaRepository.count();
    }
    
    public void CategoriaServiceImpl.deleteCategoria(Categoria categoria) {
        categoriaRepository.delete(categoria);
    }
    
    public Categoria CategoriaServiceImpl.findCategoria(Long id) {
        return categoriaRepository.findOne(id);
    }
    
    public List<Categoria> CategoriaServiceImpl.findAllCategorias() {
        return categoriaRepository.findAll();
    }
    
    public List<Categoria> CategoriaServiceImpl.findCategoriaEntries(int firstResult, int maxResults) {
        return categoriaRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void CategoriaServiceImpl.saveCategoria(Categoria categoria) {
        categoriaRepository.save(categoria);
    }
    
    public Categoria CategoriaServiceImpl.updateCategoria(Categoria categoria) {
        return categoriaRepository.save(categoria);
    }
    
}
