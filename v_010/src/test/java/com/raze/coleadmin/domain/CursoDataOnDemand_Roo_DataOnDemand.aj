// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.coleadmin.domain;

import com.raze.coleadmin.domain.CicloEscolar;
import com.raze.coleadmin.domain.CicloEscolarDataOnDemand;
import com.raze.coleadmin.domain.Curso;
import com.raze.coleadmin.domain.CursoDataOnDemand;
import com.raze.coleadmin.domain.Usuario;
import com.raze.coleadmin.repository.CursoRepository;
import com.raze.coleadmin.service.CursoService;
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

privileged aspect CursoDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CursoDataOnDemand: @Component;
    
    private Random CursoDataOnDemand.rnd = new SecureRandom();
    
    private List<Curso> CursoDataOnDemand.data;
    
    @Autowired
    CicloEscolarDataOnDemand CursoDataOnDemand.cicloEscolarDataOnDemand;
    
    @Autowired
    CursoService CursoDataOnDemand.cursoService;
    
    @Autowired
    CursoRepository CursoDataOnDemand.cursoRepository;
    
    public Curso CursoDataOnDemand.getNewTransientCurso(int index) {
        Curso obj = new Curso();
        setActivo(obj, index);
        setCicloEscolar(obj, index);
        setColegiatura(obj, index);
        setFechaCreacion(obj, index);
        setFechaModificacion(obj, index);
        setInscripcion(obj, index);
        setNombreCurso(obj, index);
        setUsuarioCrea(obj, index);
        setUsuarioModifica(obj, index);
        return obj;
    }
    
    public void CursoDataOnDemand.setActivo(Curso obj, int index) {
        Boolean activo = Boolean.TRUE;
        obj.setActivo(activo);
    }
    
    public void CursoDataOnDemand.setCicloEscolar(Curso obj, int index) {
        CicloEscolar cicloEscolar = cicloEscolarDataOnDemand.getRandomCicloEscolar();
        obj.setCicloEscolar(cicloEscolar);
    }
    
    public void CursoDataOnDemand.setColegiatura(Curso obj, int index) {
        Double colegiatura = new Integer(index).doubleValue();
        obj.setColegiatura(colegiatura);
    }
    
    public void CursoDataOnDemand.setFechaCreacion(Curso obj, int index) {
        Date fechaCreacion = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setFechaCreacion(fechaCreacion);
    }
    
    public void CursoDataOnDemand.setFechaModificacion(Curso obj, int index) {
        Date fechaModificacion = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setFechaModificacion(fechaModificacion);
    }
    
    public void CursoDataOnDemand.setInscripcion(Curso obj, int index) {
        Double inscripcion = new Integer(index).doubleValue();
        obj.setInscripcion(inscripcion);
    }
    
    public void CursoDataOnDemand.setNombreCurso(Curso obj, int index) {
        String nombreCurso = "nombreCurso_" + index;
        obj.setNombreCurso(nombreCurso);
    }
    
    public void CursoDataOnDemand.setUsuarioCrea(Curso obj, int index) {
        Usuario usuarioCrea = null;
        obj.setUsuarioCrea(usuarioCrea);
    }
    
    public void CursoDataOnDemand.setUsuarioModifica(Curso obj, int index) {
        Usuario usuarioModifica = null;
        obj.setUsuarioModifica(usuarioModifica);
    }
    
    public Curso CursoDataOnDemand.getSpecificCurso(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Curso obj = data.get(index);
        Long id = obj.getId();
        return cursoService.findCurso(id);
    }
    
    public Curso CursoDataOnDemand.getRandomCurso() {
        init();
        Curso obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return cursoService.findCurso(id);
    }
    
    public boolean CursoDataOnDemand.modifyCurso(Curso obj) {
        return false;
    }
    
    public void CursoDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = cursoService.findCursoEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Curso' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Curso>();
        for (int i = 0; i < 10; i++) {
            Curso obj = getNewTransientCurso(i);
            try {
                cursoService.saveCurso(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            cursoRepository.flush();
            data.add(obj);
        }
    }
    
}
