package com.raze.coleadmin.domain;
import com.raze.coleadmin.repository.EscuelaRepository;
import com.raze.coleadmin.service.EscuelaService;
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

@Configurable
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml")
@Transactional
@RooIntegrationTest(entity = Escuela.class)
public class EscuelaIntegrationTest {

    @Test
    public void testMarkerMethod() {
    }

	@Autowired
    EscuelaDataOnDemand dod;

	@Autowired
    EscuelaService escuelaService;

	@Autowired
    EscuelaRepository escuelaRepository;

	@Test
    public void testCountAllEscuelas() {
        Assert.assertNotNull("Data on demand for 'Escuela' failed to initialize correctly", dod.getRandomEscuela());
        long count = escuelaService.countAllEscuelas();
        Assert.assertTrue("Counter for 'Escuela' incorrectly reported there were no entries", count > 0);
    }

	@Test
    public void testFindEscuela() {
        Escuela obj = dod.getRandomEscuela();
        Assert.assertNotNull("Data on demand for 'Escuela' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Escuela' failed to provide an identifier", id);
        obj = escuelaService.findEscuela(id);
        Assert.assertNotNull("Find method for 'Escuela' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Escuela' returned the incorrect identifier", id, obj.getId());
    }

	@Test
    public void testFindAllEscuelas() {
        Assert.assertNotNull("Data on demand for 'Escuela' failed to initialize correctly", dod.getRandomEscuela());
        long count = escuelaService.countAllEscuelas();
        Assert.assertTrue("Too expensive to perform a find all test for 'Escuela', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Escuela> result = escuelaService.findAllEscuelas();
        Assert.assertNotNull("Find all method for 'Escuela' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Escuela' failed to return any data", result.size() > 0);
    }

	@Test
    public void testFindEscuelaEntries() {
        Assert.assertNotNull("Data on demand for 'Escuela' failed to initialize correctly", dod.getRandomEscuela());
        long count = escuelaService.countAllEscuelas();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Escuela> result = escuelaService.findEscuelaEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Escuela' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Escuela' returned an incorrect number of entries", count, result.size());
    }

	@Test
    public void testSaveEscuela() {
        Assert.assertNotNull("Data on demand for 'Escuela' failed to initialize correctly", dod.getRandomEscuela());
        Escuela obj = dod.getNewTransientEscuela(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Escuela' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Escuela' identifier to be null", obj.getId());
        try {
            escuelaService.saveEscuela(obj);
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        escuelaRepository.flush();
        Assert.assertNotNull("Expected 'Escuela' identifier to no longer be null", obj.getId());
    }

	@Test
    public void testDeleteEscuela() {
        Escuela obj = dod.getRandomEscuela();
        Assert.assertNotNull("Data on demand for 'Escuela' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Escuela' failed to provide an identifier", id);
        obj = escuelaService.findEscuela(id);
        escuelaService.deleteEscuela(obj);
        escuelaRepository.flush();
        Assert.assertNull("Failed to remove 'Escuela' with identifier '" + id + "'", escuelaService.findEscuela(id));
    }
}
