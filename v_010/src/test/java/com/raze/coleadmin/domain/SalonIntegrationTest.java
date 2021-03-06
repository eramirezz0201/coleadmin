package com.raze.coleadmin.domain;
import com.raze.coleadmin.repository.SalonRepository;
import com.raze.coleadmin.service.SalonService;
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
@RooIntegrationTest(entity = Salon.class)
public class SalonIntegrationTest {

    @Test
    public void testMarkerMethod() {
    }

	@Autowired
    SalonDataOnDemand dod;

	@Autowired
    SalonService salonService;

	@Autowired
    SalonRepository salonRepository;

	@Test
    public void testCountAllSalons() {
        Assert.assertNotNull("Data on demand for 'Salon' failed to initialize correctly", dod.getRandomSalon());
        long count = salonService.countAllSalons();
        Assert.assertTrue("Counter for 'Salon' incorrectly reported there were no entries", count > 0);
    }

	@Test
    public void testFindSalon() {
        Salon obj = dod.getRandomSalon();
        Assert.assertNotNull("Data on demand for 'Salon' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Salon' failed to provide an identifier", id);
        obj = salonService.findSalon(id);
        Assert.assertNotNull("Find method for 'Salon' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Salon' returned the incorrect identifier", id, obj.getId());
    }

	@Test
    public void testFindAllSalons() {
        Assert.assertNotNull("Data on demand for 'Salon' failed to initialize correctly", dod.getRandomSalon());
        long count = salonService.countAllSalons();
        Assert.assertTrue("Too expensive to perform a find all test for 'Salon', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Salon> result = salonService.findAllSalons();
        Assert.assertNotNull("Find all method for 'Salon' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Salon' failed to return any data", result.size() > 0);
    }

	@Test
    public void testFindSalonEntries() {
        Assert.assertNotNull("Data on demand for 'Salon' failed to initialize correctly", dod.getRandomSalon());
        long count = salonService.countAllSalons();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Salon> result = salonService.findSalonEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Salon' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Salon' returned an incorrect number of entries", count, result.size());
    }

	@Test
    public void testSaveSalon() {
        Assert.assertNotNull("Data on demand for 'Salon' failed to initialize correctly", dod.getRandomSalon());
        Salon obj = dod.getNewTransientSalon(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Salon' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Salon' identifier to be null", obj.getId());
        try {
            salonService.saveSalon(obj);
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        salonRepository.flush();
        Assert.assertNotNull("Expected 'Salon' identifier to no longer be null", obj.getId());
    }

	@Test
    public void testDeleteSalon() {
        Salon obj = dod.getRandomSalon();
        Assert.assertNotNull("Data on demand for 'Salon' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Salon' failed to provide an identifier", id);
        obj = salonService.findSalon(id);
        salonService.deleteSalon(obj);
        salonRepository.flush();
        Assert.assertNull("Failed to remove 'Salon' with identifier '" + id + "'", salonService.findSalon(id));
    }
}
