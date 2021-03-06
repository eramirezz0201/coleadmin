package com.raze.coleadmin.service;
import com.raze.coleadmin.domain.Cuenta;
import java.util.List;

public interface CuentaService {

	public abstract long countAllCuentas();


	public abstract void deleteCuenta(Cuenta cuenta);


	public abstract Cuenta findCuenta(Long id);


	public abstract List<Cuenta> findAllCuentas();


	public abstract List<Cuenta> findCuentaEntries(int firstResult, int maxResults);


	public abstract void saveCuenta(Cuenta cuenta);


	public abstract Cuenta updateCuenta(Cuenta cuenta);

}
