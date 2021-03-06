package com.raze.coleadmin.service;
import com.raze.coleadmin.catalog.Rol;

import java.util.List;

public interface RolService {

	public abstract long countAllRols();


	public abstract void deleteRol(Rol rol);


	public abstract Rol findRol(Long id);


	public abstract List<Rol> findAllRols();


	public abstract List<Rol> findRolEntries(int firstResult, int maxResults);


	public abstract void saveRol(Rol rol);


	public abstract Rol updateRol(Rol rol);
	
	public abstract Rol findeRolByNombreRol(String nombreRol);

}
