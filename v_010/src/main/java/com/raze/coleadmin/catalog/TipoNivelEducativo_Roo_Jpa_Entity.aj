// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.coleadmin.catalog;

import com.raze.coleadmin.catalog.TipoNivelEducativo;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

privileged aspect TipoNivelEducativo_Roo_Jpa_Entity {
    
    declare @type: TipoNivelEducativo: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long TipoNivelEducativo.id;
    
    public Long TipoNivelEducativo.getId() {
        return this.id;
    }
    
    public void TipoNivelEducativo.setId(Long id) {
        this.id = id;
    }
    
}