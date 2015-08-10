package com.raze.coleadmin.service;
import com.raze.coleadmin.catalog.NivelEducativo;
import java.util.List;

public interface NivelEducativoService {

	public abstract long countAllNivelEducativoes();


	public abstract void deleteNivelEducativo(NivelEducativo nivelEducativo);


	public abstract NivelEducativo findNivelEducativo(Long id);


	public abstract List<NivelEducativo> findAllNivelEducativoes();


	public abstract List<NivelEducativo> findNivelEducativoEntries(int firstResult, int maxResults);


	public abstract void saveNivelEducativo(NivelEducativo nivelEducativo);


	public abstract NivelEducativo updateNivelEducativo(NivelEducativo nivelEducativo);

}
