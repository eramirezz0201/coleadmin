package com.raze.coleadmin.service;
import com.raze.coleadmin.domain.Asistencia;
import java.util.List;
import org.springframework.roo.addon.layers.service.RooService;

@RooService(domainTypes = { com.raze.coleadmin.domain.Asistencia.class })
public interface AsistenciaService {

	public abstract long countAllAsistencias();


	public abstract void deleteAsistencia(Asistencia asistencia);


	public abstract Asistencia findAsistencia(Long id);


	public abstract List<Asistencia> findAllAsistencias();


	public abstract List<Asistencia> findAsistenciaEntries(int firstResult, int maxResults);


	public abstract void saveAsistencia(Asistencia asistencia);


	public abstract Asistencia updateAsistencia(Asistencia asistencia);

}
