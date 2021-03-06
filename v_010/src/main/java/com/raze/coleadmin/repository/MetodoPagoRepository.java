package com.raze.coleadmin.repository;
import com.raze.coleadmin.catalog.MetodoPago;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;
import org.springframework.stereotype.Repository;

@Repository
@RooJpaRepository(domainType = MetodoPago.class)
public interface MetodoPagoRepository extends JpaRepository<MetodoPago, Long>, JpaSpecificationExecutor<MetodoPago> {
}
