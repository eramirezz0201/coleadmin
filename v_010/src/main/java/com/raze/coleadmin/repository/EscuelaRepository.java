package com.raze.coleadmin.repository;
import com.raze.coleadmin.domain.Escuela;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;
import org.springframework.stereotype.Repository;

@Repository
@RooJpaRepository(domainType = Escuela.class)
public interface EscuelaRepository extends JpaSpecificationExecutor<Escuela>, JpaRepository<Escuela, Long> {
}
