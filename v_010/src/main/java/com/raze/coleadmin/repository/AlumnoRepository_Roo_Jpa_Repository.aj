// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.coleadmin.repository;

import com.raze.coleadmin.domain.Alumno;
import com.raze.coleadmin.repository.AlumnoRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect AlumnoRepository_Roo_Jpa_Repository {
    
    declare parents: AlumnoRepository extends JpaRepository<Alumno, Long>;
    
    declare parents: AlumnoRepository extends JpaSpecificationExecutor<Alumno>;
    
    declare @type: AlumnoRepository: @Repository;
    
}