package com.raze.coleadmin.repository;
import com.raze.coleadmin.catalog.Concepto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface ConceptoRepository extends JpaRepository<Concepto, Long>, JpaSpecificationExecutor<Concepto> {
}
