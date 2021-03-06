package com.raze.coleadmin.domain;
import com.raze.coleadmin.repository.CursoRepository;
import com.raze.coleadmin.service.CursoService;
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
@RooIntegrationTest(entity = Curso.class)
public class CursoIntegrationTest {

    @Test
    public void testMarkerMethod() {
    }

	@Autowired
    CursoDataOnDemand dod;

	@Autowired
    CursoService cursoService;

	@Autowired
    CursoRepository cursoRepository;

	@Test
    public void testCountAllCursoes() {
        Assert.assertNotNull("Data on demand for 'Curso' failed to initialize correctly", dod.getRandomCurso());
        long count = cursoService.countAllCursoes();
        Assert.assertTrue("Counter for 'Curso' incorrectly reported there were no entries", count > 0);
    }

	@Test
    public void testFindCurso() {
        Curso obj = dod.getRandomCurso();
        Assert.assertNotNull("Data on demand for 'Curso' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Curso' failed to provide an identifier", id);
        obj = cursoService.findCurso(id);
        Assert.assertNotNull("Find method for 'Curso' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Curso' returned the incorrect identifier", id, obj.getId());
    }

	@Test
    public void testFindAllCursoes() {
        Assert.assertNotNull("Data on demand for 'Curso' failed to initialize correctly", dod.getRandomCurso());
        long count = cursoService.countAllCursoes();
        Assert.assertTrue("Too expensive to perform a find all test for 'Curso', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Curso> result = cursoService.findAllCursoes();
        Assert.assertNotNull("Find all method for 'Curso' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Curso' failed to return any data", result.size() > 0);
    }

	@Test
    public void testFindCursoEntries() {
        Assert.assertNotNull("Data on demand for 'Curso' failed to initialize correctly", dod.getRandomCurso());
        long count = cursoService.countAllCursoes();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Curso> result = cursoService.findCursoEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Curso' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Curso' returned an incorrect number of entries", count, result.size());
    }

	@Test
    public void testSaveCurso() {
        Assert.assertNotNull("Data on demand for 'Curso' failed to initialize correctly", dod.getRandomCurso());
        Curso obj = dod.getNewTransientCurso(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Curso' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Curso' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'Curso' identifier to no longer be null", obj.getId());
    }

	@Test
    public void testDeleteCurso() {
        Curso obj = dod.getRandomCurso();
        Assert.assertNotNull("Data on demand for 'Curso' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Curso' failed to provide an identifier", id);
        obj = cursoService.findCurso(id);
        cursoService.deleteCurso(obj);
        cursoRepository.flush();
        Assert.assertNull("Failed to remove 'Curso' with identifier '" + id + "'", cursoService.findCurso(id));
    }
}
