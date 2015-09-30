// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.coleadmin.catalog;

import com.raze.coleadmin.catalog.CorreoNotificacionesDataOnDemand;
import com.raze.coleadmin.catalog.CorreoNotificacionesIntegrationTest;
import com.raze.coleadmin.repository.CorreoNotificacionesRepository;
import com.raze.coleadmin.service.CorreoNotificacionesService;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CorreoNotificacionesIntegrationTest_Roo_IntegrationTest {
    
    declare @type: CorreoNotificacionesIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: CorreoNotificacionesIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: CorreoNotificacionesIntegrationTest: @Transactional;
    
    @Autowired
    CorreoNotificacionesDataOnDemand CorreoNotificacionesIntegrationTest.dod;
    
    @Autowired
    CorreoNotificacionesService CorreoNotificacionesIntegrationTest.correoNotificacionesService;
    
    @Autowired
    CorreoNotificacionesRepository CorreoNotificacionesIntegrationTest.correoNotificacionesRepository;
    
    @Test
    public void CorreoNotificacionesIntegrationTest.testCountAllCorreoNotificacioneses() {
        Assert.assertNotNull("Data on demand for 'CorreoNotificaciones' failed to initialize correctly", dod.getRandomCorreoNotificaciones());
        long count = correoNotificacionesService.countAllCorreoNotificacioneses();
        Assert.assertTrue("Counter for 'CorreoNotificaciones' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void CorreoNotificacionesIntegrationTest.testFindCorreoNotificaciones() {
        CorreoNotificaciones obj = dod.getRandomCorreoNotificaciones();
        Assert.assertNotNull("Data on demand for 'CorreoNotificaciones' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'CorreoNotificaciones' failed to provide an identifier", id);
        obj = correoNotificacionesService.findCorreoNotificaciones(id);
        Assert.assertNotNull("Find method for 'CorreoNotificaciones' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'CorreoNotificaciones' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void CorreoNotificacionesIntegrationTest.testFindAllCorreoNotificacioneses() {
        Assert.assertNotNull("Data on demand for 'CorreoNotificaciones' failed to initialize correctly", dod.getRandomCorreoNotificaciones());
        long count = correoNotificacionesService.countAllCorreoNotificacioneses();
        Assert.assertTrue("Too expensive to perform a find all test for 'CorreoNotificaciones', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<CorreoNotificaciones> result = correoNotificacionesService.findAllCorreoNotificacioneses();
        Assert.assertNotNull("Find all method for 'CorreoNotificaciones' illegally returned null", result);
        Assert.assertTrue("Find all method for 'CorreoNotificaciones' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void CorreoNotificacionesIntegrationTest.testFindCorreoNotificacionesEntries() {
        Assert.assertNotNull("Data on demand for 'CorreoNotificaciones' failed to initialize correctly", dod.getRandomCorreoNotificaciones());
        long count = correoNotificacionesService.countAllCorreoNotificacioneses();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<CorreoNotificaciones> result = correoNotificacionesService.findCorreoNotificacionesEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'CorreoNotificaciones' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'CorreoNotificaciones' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void CorreoNotificacionesIntegrationTest.testSaveCorreoNotificaciones() {
        Assert.assertNotNull("Data on demand for 'CorreoNotificaciones' failed to initialize correctly", dod.getRandomCorreoNotificaciones());
        CorreoNotificaciones obj = dod.getNewTransientCorreoNotificaciones(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'CorreoNotificaciones' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'CorreoNotificaciones' identifier to be null", obj.getId());
        try {
            correoNotificacionesService.saveCorreoNotificaciones(obj);
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        correoNotificacionesRepository.flush();
        Assert.assertNotNull("Expected 'CorreoNotificaciones' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void CorreoNotificacionesIntegrationTest.testDeleteCorreoNotificaciones() {
        CorreoNotificaciones obj = dod.getRandomCorreoNotificaciones();
        Assert.assertNotNull("Data on demand for 'CorreoNotificaciones' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'CorreoNotificaciones' failed to provide an identifier", id);
        obj = correoNotificacionesService.findCorreoNotificaciones(id);
        correoNotificacionesService.deleteCorreoNotificaciones(obj);
        correoNotificacionesRepository.flush();
        Assert.assertNull("Failed to remove 'CorreoNotificaciones' with identifier '" + id + "'", correoNotificacionesService.findCorreoNotificaciones(id));
    }
    
}
