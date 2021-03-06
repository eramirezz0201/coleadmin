package com.raze.coleadmin.catalog;
import com.raze.coleadmin.domain.Escuela;
import com.raze.coleadmin.domain.EscuelaDataOnDemand;
import com.raze.coleadmin.domain.Usuario;
import com.raze.coleadmin.repository.NivelEducativoRepository;
import com.raze.coleadmin.service.NivelEducativoService;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.roo.addon.dod.RooDataOnDemand;
import org.springframework.stereotype.Component;

@Component
@Configurable
@RooDataOnDemand(entity = NivelEducativo.class)
public class NivelEducativoDataOnDemand {

	private Random rnd = new SecureRandom();

	private List<NivelEducativo> data;

	@Autowired
    EscuelaDataOnDemand escuelaDataOnDemand;

	@Autowired
    TipoNivelEducativoDataOnDemand tipoNivelEducativoDataOnDemand;

	@Autowired
    NivelEducativoService nivelEducativoService;

	@Autowired
    NivelEducativoRepository nivelEducativoRepository;

	public NivelEducativo getNewTransientNivelEducativo(int index) {
        NivelEducativo obj = new NivelEducativo();
        setActivo(obj, index);
        setClave(obj, index);
        setDescripcion(obj, index);
        setEscuela(obj, index);
        setFechaCreacion(obj, index);
        setFechaModificacion(obj, index);
        setNombreNivelEducativo(obj, index);
        setUsuarioCrea(obj, index);
        setUsuarioModifica(obj, index);
        return obj;
    }

	public void setActivo(NivelEducativo obj, int index) {
        Boolean activo = Boolean.TRUE;
        obj.setActivo(activo);
    }

	public void setClave(NivelEducativo obj, int index) {
        String clave = "clave_" + index;
        obj.setClave(clave);
    }

	public void setDescripcion(NivelEducativo obj, int index) {
        String descripcion = "descripcion_" + index;
        obj.setDescripcion(descripcion);
    }

	public void setEscuela(NivelEducativo obj, int index) {
        Escuela escuela = escuelaDataOnDemand.getRandomEscuela();
        obj.setEscuela(escuela);
    }

	public void setFechaCreacion(NivelEducativo obj, int index) {
        Date fechaCreacion = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setFechaCreacion(fechaCreacion);
    }

	public void setFechaModificacion(NivelEducativo obj, int index) {
        Date fechaModificacion = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setFechaModificacion(fechaModificacion);
    }

	public void setNombreNivelEducativo(NivelEducativo obj, int index) {
        String nombreNivelEducativo = "nombreNivelEducativo_" + index;
        obj.setNombreNivelEducativo(nombreNivelEducativo);
    }

	public void setUsuarioCrea(NivelEducativo obj, int index) {
        Usuario usuarioCrea = null;
        obj.setUsuarioCrea(usuarioCrea);
    }

	public void setUsuarioModifica(NivelEducativo obj, int index) {
        Usuario usuarioModifica = null;
        obj.setUsuarioModifica(usuarioModifica);
    }

	public NivelEducativo getSpecificNivelEducativo(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        NivelEducativo obj = data.get(index);
        Long id = obj.getId();
        return nivelEducativoService.findNivelEducativo(id);
    }

	public NivelEducativo getRandomNivelEducativo() {
        init();
        NivelEducativo obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return nivelEducativoService.findNivelEducativo(id);
    }

	public boolean modifyNivelEducativo(NivelEducativo obj) {
        return false;
    }

	public void init() {
        int from = 0;
        int to = 10;
        data = nivelEducativoService.findNivelEducativoEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'NivelEducativo' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<NivelEducativo>();
        for (int i = 0; i < 10; i++) {
            NivelEducativo obj = getNewTransientNivelEducativo(i);
            try {
                nivelEducativoService.saveNivelEducativo(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            nivelEducativoRepository.flush();
            data.add(obj);
        }
    }
}
