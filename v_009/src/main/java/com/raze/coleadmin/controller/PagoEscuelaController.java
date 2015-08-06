package com.raze.coleadmin.controller;
import com.raze.coleadmin.domain.PagoEscuela;
import com.raze.coleadmin.service.EscuelaService;
import com.raze.coleadmin.service.MetodoPagoService;
import com.raze.coleadmin.service.PagoEscuelaService;
import java.io.UnsupportedEncodingException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriComponentsBuilder;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

@Controller
@RequestMapping("/pagoescuelas")
public class PagoEscuelaController {

	@Autowired
    PagoEscuelaService pagoEscuelaService;

	@Autowired
    MetodoPagoService metodoPagoService;

	@Autowired
    EscuelaService escuelaService;

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid PagoEscuela pagoEscuela, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, pagoEscuela);
            return "pagoescuelas/create";
        }
        uiModel.asMap().clear();
        pagoEscuelaService.savePagoEscuela(pagoEscuela);
        return "redirect:/pagoescuelas/" + encodeUrlPathSegment(pagoEscuela.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new PagoEscuela());
        return "pagoescuelas/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("pagoescuela", pagoEscuelaService.findPagoEscuela(id));
        uiModel.addAttribute("itemId", id);
        return "pagoescuelas/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("pagoescuelas", pagoEscuelaService.findPagoEscuelaEntries(firstResult, sizeNo));
            float nrOfPages = (float) pagoEscuelaService.countAllPagoEscuelas() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("pagoescuelas", pagoEscuelaService.findAllPagoEscuelas());
        }
        addDateTimeFormatPatterns(uiModel);
        return "pagoescuelas/list";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid PagoEscuela pagoEscuela, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, pagoEscuela);
            return "pagoescuelas/update";
        }
        uiModel.asMap().clear();
        pagoEscuelaService.updatePagoEscuela(pagoEscuela);
        return "redirect:/pagoescuelas/" + encodeUrlPathSegment(pagoEscuela.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, pagoEscuelaService.findPagoEscuela(id));
        return "pagoescuelas/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        PagoEscuela pagoEscuela = pagoEscuelaService.findPagoEscuela(id);
        pagoEscuelaService.deletePagoEscuela(pagoEscuela);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/pagoescuelas";
    }

	void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("pagoEscuela_fechapago_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("pagoEscuela_fechacreacion_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("pagoEscuela_fechamodificacion_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }

	void populateEditForm(Model uiModel, PagoEscuela pagoEscuela) {
        uiModel.addAttribute("pagoEscuela", pagoEscuela);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("metodopagoes", metodoPagoService.findAllMetodoPagoes());
        uiModel.addAttribute("escuelas", escuelaService.findAllEscuelas());
    }

	String encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> showJson(@PathVariable("id") Long id) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        try {
            PagoEscuela pagoEscuela = pagoEscuelaService.findPagoEscuela(id);
            if (pagoEscuela == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
            return new ResponseEntity<String>(pagoEscuela.toJson(), headers, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>("{\"ERROR\":"+e.getMessage()+"\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

	@RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        try {
            List<PagoEscuela> result = pagoEscuelaService.findAllPagoEscuelas();
            return new ResponseEntity<String>(PagoEscuela.toJsonArray(result), headers, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>("{\"ERROR\":"+e.getMessage()+"\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

	@RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> createFromJson(@RequestBody String json, UriComponentsBuilder uriBuilder) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        try {
            PagoEscuela pagoEscuela = PagoEscuela.fromJsonToPagoEscuela(json);
            pagoEscuelaService.savePagoEscuela(pagoEscuela);
            RequestMapping a = (RequestMapping) getClass().getAnnotation(RequestMapping.class);
            headers.add("Location",uriBuilder.path(a.value()[0]+"/"+pagoEscuela.getId().toString()).build().toUriString());
            return new ResponseEntity<String>(headers, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<String>("{\"ERROR\":"+e.getMessage()+"\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

	@RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> createFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        try {
            for (PagoEscuela pagoEscuela: PagoEscuela.fromJsonArrayToPagoEscuelas(json)) {
                pagoEscuelaService.savePagoEscuela(pagoEscuela);
            }
            return new ResponseEntity<String>(headers, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<String>("{\"ERROR\":"+e.getMessage()+"\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> updateFromJson(@RequestBody String json, @PathVariable("id") Long id) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        try {
            PagoEscuela pagoEscuela = PagoEscuela.fromJsonToPagoEscuela(json);
            pagoEscuela.setId(id);
            if (pagoEscuelaService.updatePagoEscuela(pagoEscuela) == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
            return new ResponseEntity<String>(headers, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>("{\"ERROR\":"+e.getMessage()+"\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> deleteFromJson(@PathVariable("id") Long id) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        try {
            PagoEscuela pagoEscuela = pagoEscuelaService.findPagoEscuela(id);
            if (pagoEscuela == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
            pagoEscuelaService.deletePagoEscuela(pagoEscuela);
            return new ResponseEntity<String>(headers, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>("{\"ERROR\":"+e.getMessage()+"\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
