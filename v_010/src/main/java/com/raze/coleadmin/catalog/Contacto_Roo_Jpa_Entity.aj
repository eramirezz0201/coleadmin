// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.coleadmin.catalog;

import com.raze.coleadmin.catalog.Contacto;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

privileged aspect Contacto_Roo_Jpa_Entity {
    
    declare @type: Contacto: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Contacto.id;
    
    public Long Contacto.getId() {
        return this.id;
    }
    
    public void Contacto.setId(Long id) {
        this.id = id;
    }
    
}