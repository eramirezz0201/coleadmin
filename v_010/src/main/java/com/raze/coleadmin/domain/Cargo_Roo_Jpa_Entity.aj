// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.coleadmin.domain;

import com.raze.coleadmin.domain.Cargo;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

privileged aspect Cargo_Roo_Jpa_Entity {
    
    declare @type: Cargo: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Cargo.id;
    
    public Long Cargo.getId() {
        return this.id;
    }
    
    public void Cargo.setId(Long id) {
        this.id = id;
    }
    
}
