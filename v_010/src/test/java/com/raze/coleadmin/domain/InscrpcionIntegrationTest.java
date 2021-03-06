package com.raze.coleadmin.domain;
import com.raze.coleadmin.repository.InscrpcionRepository;
import com.raze.coleadmin.service.InscrpcionService;
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
@RooIntegrationTest(entity = Inscrpcion.class)
public class InscrpcionIntegrationTest {

    @Test
    public void testMarkerMethod() {
    }

	@Autowired
    InscrpcionDataOnDemand dod;

	@Autowired
    InscrpcionService inscrpcionService;

	@Autowired
    InscrpcionRepository inscrpcionRepository;

	@Test
    public void testCountAllInscrpcions() {
        Assert.assertNotNull("Data on demand for 'Inscrpcion' failed to initialize correctly", dod.getRandomInscrpcion());
        long count = inscrpcionService.countAllInscrpcions();
        Assert.assertTrue("Counter for 'Inscrpcion' incorrectly reported there were no entries", count > 0);
    }

	@Test
    public void testFindInscrpcion() {
        Inscrpcion obj = dod.getRandomInscrpcion();
        Assert.assertNotNull("Data on demand for 'Inscrpcion' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Inscrpcion' failed to provide an identifier", id);
        obj = inscrpcionService.findInscrpcion(id);
        Assert.assertNotNull("Find method for 'Inscrpcion' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Inscrpcion' returned the incorrect identifier", id, obj.getId());
    }

	@Test
    public void testFindAllInscrpcions() {
        Assert.assertNotNull("Data on demand for 'Inscrpcion' failed to initialize correctly", dod.getRandomInscrpcion());
        long count = inscrpcionService.countAllInscrpcions();
        Assert.assertTrue("Too expensive to perform a find all test for 'Inscrpcion', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Inscrpcion> result = inscrpcionService.findAllInscrpcions();
        Assert.assertNotNull("Find all method for 'Inscrpcion' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Inscrpcion' failed to return any data", result.size() > 0);
    }

	@Test
    public void testFindInscrpcionEntries() {
        Assert.assertNotNull("Data on demand for 'Inscrpcion' failed to initialize correctly", dod.getRandomInscrpcion());
        long count = inscrpcionService.countAllInscrpcions();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Inscrpcion> result = inscrpcionService.findInscrpcionEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Inscrpcion' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Inscrpcion' returned an incorrect number of entries", count, result.size());
    }

	@Test
    public void testSaveInscrpcion() {
        Assert.assertNotNull("Data on demand for 'Inscrpcion' failed to initialize correctly", dod.getRandomInscrpcion());
        Inscrpcion obj = dod.getNewTransientInscrpcion(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Inscrpcion' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Inscrpcion' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'Inscrpcion' identifier to no longer be null", obj.getId());
    }

	@Test
    public void testDeleteInscrpcion() {
        Inscrpcion obj = dod.getRandomInscrpcion();
        Assert.assertNotNull("Data on demand for 'Inscrpcion' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Inscrpcion' failed to provide an identifier", id);
        obj = inscrpcionService.findInscrpcion(id);
        inscrpcionService.deleteInscrpcion(obj);
        inscrpcionRepository.flush();
        Assert.assertNull("Failed to remove 'Inscrpcion' with identifier '" + id + "'", inscrpcionService.findInscrpcion(id));
    }
}
