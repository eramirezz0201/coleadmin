// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.coleadmin.domain;

import com.raze.coleadmin.catalog.EstatusInscripcionDataOnDemand;
import com.raze.coleadmin.domain.AlumnoDataOnDemand;
import com.raze.coleadmin.domain.CicloEscolarDataOnDemand;
import com.raze.coleadmin.domain.CursoDataOnDemand;
import com.raze.coleadmin.domain.Escuela;
import com.raze.coleadmin.domain.EscuelaDataOnDemand;
import com.raze.coleadmin.domain.GrupoDataOnDemand;
import com.raze.coleadmin.domain.Inscrpcion;
import com.raze.coleadmin.domain.InscrpcionDataOnDemand;
import com.raze.coleadmin.domain.PadreDataOnDemand;
import com.raze.coleadmin.domain.Usuario;
import com.raze.coleadmin.repository.InscrpcionRepository;
import com.raze.coleadmin.service.InscrpcionService;
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
import org.springframework.stereotype.Component;

privileged aspect InscrpcionDataOnDemand_Roo_DataOnDemand {
    
    declare @type: InscrpcionDataOnDemand: @Component;
    
    private Random InscrpcionDataOnDemand.rnd = new SecureRandom();
    
    private List<Inscrpcion> InscrpcionDataOnDemand.data;
    
    @Autowired
    AlumnoDataOnDemand InscrpcionDataOnDemand.alumnoDataOnDemand;
    
    @Autowired
    CicloEscolarDataOnDemand InscrpcionDataOnDemand.cicloEscolarDataOnDemand;
    
    @Autowired
    CursoDataOnDemand InscrpcionDataOnDemand.cursoDataOnDemand;
    
    @Autowired
    EscuelaDataOnDemand InscrpcionDataOnDemand.escuelaDataOnDemand;
    
    @Autowired
    EstatusInscripcionDataOnDemand InscrpcionDataOnDemand.estatusInscripcionDataOnDemand;
    
    @Autowired
    GrupoDataOnDemand InscrpcionDataOnDemand.grupoDataOnDemand;
    
    @Autowired
    PadreDataOnDemand InscrpcionDataOnDemand.padreDataOnDemand;
    
    @Autowired
    InscrpcionService InscrpcionDataOnDemand.inscrpcionService;
    
    @Autowired
    InscrpcionRepository InscrpcionDataOnDemand.inscrpcionRepository;
    
    public Inscrpcion InscrpcionDataOnDemand.getNewTransientInscrpcion(int index) {
        Inscrpcion obj = new Inscrpcion();
        setActivo(obj, index);
        setDescuentoColegiatura(obj, index);
        setDescuentoInscripcion(obj, index);
        setEnviarRecordatorios(obj, index);
        setEscuela(obj, index);
        setFechaCreacion(obj, index);
        setFechaModificacion(obj, index);
        setSaldoActual(obj, index);
        setUsuarioCrea(obj, index);
        setUsuarioModifica(obj, index);
        return obj;
    }
    
    public void InscrpcionDataOnDemand.setActivo(Inscrpcion obj, int index) {
        Boolean activo = Boolean.TRUE;
        obj.setActivo(activo);
    }
    
    public void InscrpcionDataOnDemand.setDescuentoColegiatura(Inscrpcion obj, int index) {
        Double descuentoColegiatura = new Integer(index).doubleValue();
        obj.setDescuentoColegiatura(descuentoColegiatura);
    }
    
    public void InscrpcionDataOnDemand.setDescuentoInscripcion(Inscrpcion obj, int index) {
        Double descuentoInscripcion = new Integer(index).doubleValue();
        obj.setDescuentoInscripcion(descuentoInscripcion);
    }
    
    public void InscrpcionDataOnDemand.setEnviarRecordatorios(Inscrpcion obj, int index) {
        Boolean enviarRecordatorios = Boolean.TRUE;
        obj.setEnviarRecordatorios(enviarRecordatorios);
    }
    
    public void InscrpcionDataOnDemand.setEscuela(Inscrpcion obj, int index) {
        Escuela escuela = escuelaDataOnDemand.getRandomEscuela();
        obj.setEscuela(escuela);
    }
    
    public void InscrpcionDataOnDemand.setFechaCreacion(Inscrpcion obj, int index) {
        Date fechaCreacion = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setFechaCreacion(fechaCreacion);
    }
    
    public void InscrpcionDataOnDemand.setFechaModificacion(Inscrpcion obj, int index) {
        Date fechaModificacion = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setFechaModificacion(fechaModificacion);
    }
    
    public void InscrpcionDataOnDemand.setSaldoActual(Inscrpcion obj, int index) {
        Double saldoActual = new Integer(index).doubleValue();
        obj.setSaldoActual(saldoActual);
    }
    
    public void InscrpcionDataOnDemand.setUsuarioCrea(Inscrpcion obj, int index) {
        Usuario usuarioCrea = null;
        obj.setUsuarioCrea(usuarioCrea);
    }
    
    public void InscrpcionDataOnDemand.setUsuarioModifica(Inscrpcion obj, int index) {
        Usuario usuarioModifica = null;
        obj.setUsuarioModifica(usuarioModifica);
    }
    
    public Inscrpcion InscrpcionDataOnDemand.getSpecificInscrpcion(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Inscrpcion obj = data.get(index);
        Long id = obj.getId();
        return inscrpcionService.findInscrpcion(id);
    }
    
    public Inscrpcion InscrpcionDataOnDemand.getRandomInscrpcion() {
        init();
        Inscrpcion obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return inscrpcionService.findInscrpcion(id);
    }
    
    public boolean InscrpcionDataOnDemand.modifyInscrpcion(Inscrpcion obj) {
        return false;
    }
    
    public void InscrpcionDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = inscrpcionService.findInscrpcionEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Inscrpcion' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Inscrpcion>();
        for (int i = 0; i < 10; i++) {
            Inscrpcion obj = getNewTransientInscrpcion(i);
            try {
                inscrpcionService.saveInscrpcion(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            inscrpcionRepository.flush();
            data.add(obj);
        }
    }
    
}