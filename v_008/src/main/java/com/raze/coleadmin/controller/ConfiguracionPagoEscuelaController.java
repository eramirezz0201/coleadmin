package com.raze.coleadmin.controller;
import com.raze.coleadmin.domain.ConfiguracionPagoEscuela;
import com.raze.coleadmin.service.ConfiguracionPagoEscuelaService;
import com.raze.coleadmin.service.EscuelaService;
import com.raze.coleadmin.service.ModuloService;
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
@RequestMapping("/configuracionpagoescuelas")
public class ConfiguracionPagoEscuelaController {

	@RequestMapping(value = "/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> showJson(@PathVariable("id") Long id) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        try {
            ConfiguracionPagoEscuela configuracionPagoEscuela = configuracionPagoEscuelaService.findConfiguracionPagoEscuela(id);
            if (configuracionPagoEscuela == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
            return new ResponseEntity<String>(configuracionPagoEscuela.toJson(), headers, HttpStatus.OK);
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
            List<ConfiguracionPagoEscuela> result = configuracionPagoEscuelaService.findAllConfiguracionPagoEscuelas();
            return new ResponseEntity<String>(ConfiguracionPagoEscuela.toJsonArray(result), headers, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>("{\"ERROR\":"+e.getMessage()+"\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

	@RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> createFromJson(@RequestBody String json, UriComponentsBuilder uriBuilder) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        try {
            ConfiguracionPagoEscuela configuracionPagoEscuela = ConfiguracionPagoEscuela.fromJsonToConfiguracionPagoEscuela(json);
            configuracionPagoEscuelaService.saveConfiguracionPagoEscuela(configuracionPagoEscuela);
            RequestMapping a = (RequestMapping) getClass().getAnnotation(RequestMapping.class);
            headers.add("Location",uriBuilder.path(a.value()[0]+"/"+configuracionPagoEscuela.getId().toString()).build().toUriString());
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
            for (ConfiguracionPagoEscuela configuracionPagoEscuela: ConfiguracionPagoEscuela.fromJsonArrayToConfiguracionPagoEscuelas(json)) {
                configuracionPagoEscuelaService.saveConfiguracionPagoEscuela(configuracionPagoEscuela);
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
            ConfiguracionPagoEscuela configuracionPagoEscuela = ConfiguracionPagoEscuela.fromJsonToConfiguracionPagoEscuela(json);
            configuracionPagoEscuela.setId(id);
            if (configuracionPagoEscuelaService.updateConfiguracionPagoEscuela(configuracionPagoEscuela) == null) {
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
            ConfiguracionPagoEscuela configuracionPagoEscuela = configuracionPagoEscuelaService.findConfiguracionPagoEscuela(id);
            if (configuracionPagoEscuela == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
            configuracionPagoEscuelaService.deleteConfiguracionPagoEscuela(configuracionPagoEscuela);
            return new ResponseEntity<String>(headers, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>("{\"ERROR\":"+e.getMessage()+"\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

	@Autowired
    ConfiguracionPagoEscuelaService configuracionPagoEscuelaService;

	@Autowired
    EscuelaService escuelaService;

	@Autowired
    ModuloService moduloService;

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid ConfiguracionPagoEscuela configuracionPagoEscuela, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, configuracionPagoEscuela);
            return "configuracionpagoescuelas/create";
        }
        uiModel.asMap().clear();
        configuracionPagoEscuelaService.saveConfiguracionPagoEscuela(configuracionPagoEscuela);
        return "redirect:/configuracionpagoescuelas/" + encodeUrlPathSegment(configuracionPagoEscuela.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new ConfiguracionPagoEscuela());
        return "configuracionpagoescuelas/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("configuracionpagoescuela", configuracionPagoEscuelaService.findConfiguracionPagoEscuela(id));
        uiModel.addAttribute("itemId", id);
        return "configuracionpagoescuelas/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("configuracionpagoescuelas", configuracionPagoEscuelaService.findConfiguracionPagoEscuelaEntries(firstResult, sizeNo));
            float nrOfPages = (float) configuracionPagoEscuelaService.countAllConfiguracionPagoEscuelas() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("configuracionpagoescuelas", configuracionPagoEscuelaService.findAllConfiguracionPagoEscuelas());
        }
        addDateTimeFormatPatterns(uiModel);
        return "configuracionpagoescuelas/list";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid ConfiguracionPagoEscuela configuracionPagoEscuela, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, configuracionPagoEscuela);
            return "configuracionpagoescuelas/update";
        }
        uiModel.asMap().clear();
        configuracionPagoEscuelaService.updateConfiguracionPagoEscuela(configuracionPagoEscuela);
        return "redirect:/configuracionpagoescuelas/" + encodeUrlPathSegment(configuracionPagoEscuela.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, configuracionPagoEscuelaService.findConfiguracionPagoEscuela(id));
        return "configuracionpagoescuelas/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ConfiguracionPagoEscuela configuracionPagoEscuela = configuracionPagoEscuelaService.findConfiguracionPagoEscuela(id);
        configuracionPagoEscuelaService.deleteConfiguracionPagoEscuela(configuracionPagoEscuela);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/configuracionpagoescuelas";
    }

	void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("configuracionPagoEscuela_fechacreacion_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("configuracionPagoEscuela_fechamodificacion_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }

	void populateEditForm(Model uiModel, ConfiguracionPagoEscuela configuracionPagoEscuela) {
        uiModel.addAttribute("configuracionPagoEscuela", configuracionPagoEscuela);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("escuelas", escuelaService.findAllEscuelas());
        uiModel.addAttribute("moduloes", moduloService.findAllModuloes());
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
}
