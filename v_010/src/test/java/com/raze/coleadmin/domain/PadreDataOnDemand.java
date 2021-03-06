package com.raze.coleadmin.domain;
import com.raze.coleadmin.repository.PadreRepository;
import com.raze.coleadmin.service.PadreService;
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

@Configurable
@Component
@RooDataOnDemand(entity = Padre.class)
public class PadreDataOnDemand {

	private Random rnd = new SecureRandom();

	private List<Padre> data;

	@Autowired
    DomicilioDataOnDemand domicilioDataOnDemand;

	@Autowired
    EscuelaDataOnDemand escuelaDataOnDemand;

	@Autowired
    PadreService padreService;

	@Autowired
    PadreRepository padreRepository;

	public Padre getNewTransientPadre(int index) {
        Padre obj = new Padre();
        setActivo(obj, index);
        setCorreoE(obj, index);
        setEscuela(obj, index);
        setFechaCreacion(obj, index);
        setFechaModificacion(obj, index);
        setFechaNacimiento(obj, index);
        setFoto(obj, index);
        setNombre(obj, index);
        setObservaciones(obj, index);
        setPassword(obj, index);
        setPrimerApellido(obj, index);
        setSegundoApellido(obj, index);
        setUsuarioCrea(obj, index);
        setUsuarioModifica(obj, index);
        return obj;
    }

	public void setActivo(Padre obj, int index) {
        Boolean activo = Boolean.TRUE;
        obj.setActivo(activo);
    }

	public void setCorreoE(Padre obj, int index) {
        String correoE = "correoE_" + index;
        obj.setCorreoE(correoE);
    }

	public void setEscuela(Padre obj, int index) {
        Escuela escuela = escuelaDataOnDemand.getRandomEscuela();
        obj.setEscuela(escuela);
    }

	public void setFechaCreacion(Padre obj, int index) {
        Date fechaCreacion = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setFechaCreacion(fechaCreacion);
    }

	public void setFechaModificacion(Padre obj, int index) {
        Date fechaModificacion = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setFechaModificacion(fechaModificacion);
    }

	public void setFechaNacimiento(Padre obj, int index) {
        Date fechaNacimiento = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setFechaNacimiento(fechaNacimiento);
    }

	public void setFoto(Padre obj, int index) {
        byte[] foto = String.valueOf(index).getBytes();
        obj.setFoto(foto);
    }

	public void setNombre(Padre obj, int index) {
        String nombre = "nombre_" + index;
        if (nombre.length() > 30) {
            nombre = nombre.substring(0, 30);
        }
        obj.setNombre(nombre);
    }

	public void setObservaciones(Padre obj, int index) {
        String observaciones = "observaciones_" + index;
        if (observaciones.length() > 250) {
            observaciones = observaciones.substring(0, 250);
        }
        obj.setObservaciones(observaciones);
    }

	public void setPassword(Padre obj, int index) {
        String password = "password_" + index;
        obj.setPassword(password);
    }

	public void setPrimerApellido(Padre obj, int index) {
        String primerApellido = "primerApellido_" + index;
        if (primerApellido.length() > 30) {
            primerApellido = primerApellido.substring(0, 30);
        }
        obj.setPrimerApellido(primerApellido);
    }

	public void setSegundoApellido(Padre obj, int index) {
        String segundoApellido = "segundoApellido_" + index;
        if (segundoApellido.length() > 30) {
            segundoApellido = segundoApellido.substring(0, 30);
        }
        obj.setSegundoApellido(segundoApellido);
    }

	public void setUsuarioCrea(Padre obj, int index) {
        Long usuarioCrea = new Integer(index).longValue();
        obj.setUsuarioCrea(usuarioCrea);
    }

	public void setUsuarioModifica(Padre obj, int index) {
        Long usuarioModifica = new Integer(index).longValue();
        obj.setUsuarioModifica(usuarioModifica);
    }

	public Padre getSpecificPadre(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Padre obj = data.get(index);
        Long id = obj.getId();
        return padreService.findPadre(id);
    }

	public Padre getRandomPadre() {
        init();
        Padre obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return padreService.findPadre(id);
    }

	public boolean modifyPadre(Padre obj) {
        return false;
    }

	public void init() {
        int from = 0;
        int to = 10;
        data = padreService.findPadreEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Padre' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Padre>();
        for (int i = 0; i < 10; i++) {
            Padre obj = getNewTransientPadre(i);
            try {
                padreService.savePadre(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            padreRepository.flush();
            data.add(obj);
        }
    }
}
