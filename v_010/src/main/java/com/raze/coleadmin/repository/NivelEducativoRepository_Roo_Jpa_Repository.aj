// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.coleadmin.repository;

import com.raze.coleadmin.catalog.NivelEducativo;
import com.raze.coleadmin.repository.NivelEducativoRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect NivelEducativoRepository_Roo_Jpa_Repository {
    
    declare parents: NivelEducativoRepository extends JpaRepository<NivelEducativo, Long>;
    
    declare parents: NivelEducativoRepository extends JpaSpecificationExecutor<NivelEducativo>;
    
    declare @type: NivelEducativoRepository: @Repository;
    
}
