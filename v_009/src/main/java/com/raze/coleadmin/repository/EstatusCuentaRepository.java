package com.raze.coleadmin.repository;
import com.raze.coleadmin.catalog.EstatusCuenta;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface EstatusCuentaRepository extends JpaSpecificationExecutor<EstatusCuenta>, JpaRepository<EstatusCuenta, Long> {
}
