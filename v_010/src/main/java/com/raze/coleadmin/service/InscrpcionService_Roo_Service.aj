// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.coleadmin.service;

import com.raze.coleadmin.domain.Inscrpcion;
import com.raze.coleadmin.service.InscrpcionService;
import java.util.List;

privileged aspect InscrpcionService_Roo_Service {
    
    public abstract long InscrpcionService.countAllInscrpcions();    
    public abstract void InscrpcionService.deleteInscrpcion(Inscrpcion inscrpcion);    
    public abstract Inscrpcion InscrpcionService.findInscrpcion(Long id);    
    public abstract List<Inscrpcion> InscrpcionService.findAllInscrpcions();    
    public abstract List<Inscrpcion> InscrpcionService.findInscrpcionEntries(int firstResult, int maxResults);    
    public abstract void InscrpcionService.saveInscrpcion(Inscrpcion inscrpcion);    
    public abstract Inscrpcion InscrpcionService.updateInscrpcion(Inscrpcion inscrpcion);    
}
