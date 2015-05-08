package com.raze.coleadmin.repository.domain;
import com.raze.coleadmin.domain.Escuela;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface EscuelaRepository extends JpaSpecificationExecutor<Escuela>, JpaRepository<Escuela, Long> {
}