// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.coleadmin.service;

import com.raze.coleadmin.catalog.Permiso;
import com.raze.coleadmin.service.PermisoService;
import java.util.List;

privileged aspect PermisoService_Roo_Service {
    
    public abstract long PermisoService.countAllPermisoes();    
    public abstract void PermisoService.deletePermiso(Permiso permiso);    
    public abstract Permiso PermisoService.findPermiso(Long id);    
    public abstract List<Permiso> PermisoService.findAllPermisoes();    
    public abstract List<Permiso> PermisoService.findPermisoEntries(int firstResult, int maxResults);    
    public abstract void PermisoService.savePermiso(Permiso permiso);    
    public abstract Permiso PermisoService.updatePermiso(Permiso permiso);    
}