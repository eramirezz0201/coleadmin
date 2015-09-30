// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.coleadmin.service;

import com.raze.coleadmin.catalog.Rol;
import com.raze.coleadmin.service.RolService;
import java.util.List;

privileged aspect RolService_Roo_Service {
    
    public abstract long RolService.countAllRols();    
    public abstract void RolService.deleteRol(Rol rol);    
    public abstract Rol RolService.findRol(Long id);    
    public abstract List<Rol> RolService.findAllRols();    
    public abstract List<Rol> RolService.findRolEntries(int firstResult, int maxResults);    
    public abstract void RolService.saveRol(Rol rol);    
    public abstract Rol RolService.updateRol(Rol rol);    
}
