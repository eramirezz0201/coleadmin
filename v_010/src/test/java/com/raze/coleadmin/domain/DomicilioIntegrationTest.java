package com.raze.coleadmin.domain;
import com.raze.coleadmin.repository.DomicilioRepository;
import com.raze.coleadmin.service.DomicilioService;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.roo.addon.test.RooIntegrationTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml")
@Transactional
@Configurable
@RooIntegrationTest(entity = Domicilio.class)
public class DomicilioIntegrationTest {

    @Test
    public void testMarkerMethod() {
    }

	@Autowired
    DomicilioDataOnDemand dod;

	@Autowired
    DomicilioService domicilioService;

	@Autowired
    DomicilioRepository domicilioRepository;

	@Test
    public void testCountAllDomicilios() {
        Assert.assertNotNull("Data on demand for 'Domicilio' failed to initialize correctly", dod.getRandomDomicilio());
        long count = domicilioService.countAllDomicilios();
        Assert.assertTrue("Counter for 'Domicilio' incorrectly reported there were no entries", count > 0);
    }

	@Test
    public void testFindDomicilio() {
        Domicilio obj = dod.getRandomDomicilio();
        Assert.assertNotNull("Data on demand for 'Domicilio' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Domicilio' failed to provide an identifier", id);
        obj = domicilioService.findDomicilio(id);
        Assert.assertNotNull("Find method for 'Domicilio' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Domicilio' returned the incorrect identifier", id, obj.getId());
    }

	@Test
    public void testFindAllDomicilios() {
        Assert.assertNotNull("Data on demand for 'Domicilio' failed to initialize correctly", dod.getRandomDomicilio());
        long count = domicilioService.countAllDomicilios();
        Assert.assertTrue("Too expensive to perform a find all test for 'Domicilio', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Domicilio> result = domicilioService.findAllDomicilios();
        Assert.assertNotNull("Find all method for 'Domicilio' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Domicilio' failed to return any data", result.size() > 0);
    }

	@Test
    public void testFindDomicilioEntries() {
        Assert.assertNotNull("Data on demand for 'Domicilio' failed to initialize correctly", dod.getRandomDomicilio());
        long count = domicilioService.countAllDomicilios();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Domicilio> result = domicilioService.findDomicilioEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Domicilio' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Domicilio' returned an incorrect number of entries", count, result.size());
    }

	@Test
    public void testSaveDomicilio() {
        Assert.assertNotNull("Data on demand for 'Domicilio' failed to initialize correctly", dod.getRandomDomicilio());
        Domicilio obj = dod.getNewTransientDomicilio(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Domicilio' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Domicilio' identifier to be null", obj.getId());
        try {
            domicilioService.saveDomicilio(obj);
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        domicilioRepository.flush();
        Assert.assertNotNull("Expected 'Domicilio' identifier to no longer be null", obj.getId());
    }

	@Test
    public void testDeleteDomicilio() {
        Domicilio obj = dod.getRandomDomicilio();
        Assert.assertNotNull("Data on demand for 'Domicilio' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Domicilio' failed to provide an identifier", id);
        obj = domicilioService.findDomicilio(id);
        domicilioService.deleteDomicilio(obj);
        domicilioRepository.flush();
        Assert.assertNull("Failed to remove 'Domicilio' with identifier '" + id + "'", domicilioService.findDomicilio(id));
    }
}
