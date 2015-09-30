// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.coleadmin.controller;

import com.raze.coleadmin.controller.EscuelaController;
import com.raze.coleadmin.domain.Escuela;
import com.raze.coleadmin.service.ContactoService;
import com.raze.coleadmin.service.CorreoNotificacionesService;
import com.raze.coleadmin.service.DomicilioService;
import com.raze.coleadmin.service.EscuelaService;
import com.raze.coleadmin.service.UsuarioService;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect EscuelaController_Roo_Controller {
    
    @Autowired
    EscuelaService EscuelaController.escuelaService;
    
    @Autowired
    ContactoService EscuelaController.contactoService;
    
    @Autowired
    CorreoNotificacionesService EscuelaController.correoNotificacionesService;
    
    @Autowired
    DomicilioService EscuelaController.domicilioService;
    
    @Autowired
    UsuarioService EscuelaController.usuarioService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String EscuelaController.create(@Valid Escuela escuela, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, escuela);
            return "escuelas/create";
        }
        uiModel.asMap().clear();
        escuelaService.saveEscuela(escuela);
        return "redirect:/escuelas/" + encodeUrlPathSegment(escuela.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String EscuelaController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Escuela());
        return "escuelas/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String EscuelaController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("escuela", escuelaService.findEscuela(id));
        uiModel.addAttribute("itemId", id);
        return "escuelas/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String EscuelaController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("escuelas", escuelaService.findEscuelaEntries(firstResult, sizeNo));
            float nrOfPages = (float) escuelaService.countAllEscuelas() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("escuelas", escuelaService.findAllEscuelas());
        }
        addDateTimeFormatPatterns(uiModel);
        return "escuelas/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String EscuelaController.update(@Valid Escuela escuela, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, escuela);
            return "escuelas/update";
        }
        uiModel.asMap().clear();
        escuelaService.updateEscuela(escuela);
        return "redirect:/escuelas/" + encodeUrlPathSegment(escuela.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String EscuelaController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, escuelaService.findEscuela(id));
        return "escuelas/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String EscuelaController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Escuela escuela = escuelaService.findEscuela(id);
        escuelaService.deleteEscuela(escuela);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/escuelas";
    }
    
    void EscuelaController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("escuela_fechacreacion_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("escuela_fechamodificacion_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void EscuelaController.populateEditForm(Model uiModel, Escuela escuela) {
        uiModel.addAttribute("escuela", escuela);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("contactoes", contactoService.findAllContactoes());
        uiModel.addAttribute("correonotificacioneses", correoNotificacionesService.findAllCorreoNotificacioneses());
        uiModel.addAttribute("domicilios", domicilioService.findAllDomicilios());
        uiModel.addAttribute("usuarios", usuarioService.findAllUsuarios());
    }
    
    String EscuelaController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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