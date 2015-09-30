// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.coleadmin.controller;

import com.raze.coleadmin.controller.DomicilioController;
import com.raze.coleadmin.domain.Domicilio;
import com.raze.coleadmin.service.DomicilioService;
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

privileged aspect DomicilioController_Roo_Controller {
    
    @Autowired
    DomicilioService DomicilioController.domicilioService;
    
    @Autowired
    UsuarioService DomicilioController.usuarioService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String DomicilioController.create(@Valid Domicilio domicilio, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, domicilio);
            return "domicilios/create";
        }
        uiModel.asMap().clear();
        domicilioService.saveDomicilio(domicilio);
        return "redirect:/domicilios/" + encodeUrlPathSegment(domicilio.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String DomicilioController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Domicilio());
        return "domicilios/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String DomicilioController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("domicilio", domicilioService.findDomicilio(id));
        uiModel.addAttribute("itemId", id);
        return "domicilios/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String DomicilioController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("domicilios", domicilioService.findDomicilioEntries(firstResult, sizeNo));
            float nrOfPages = (float) domicilioService.countAllDomicilios() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("domicilios", domicilioService.findAllDomicilios());
        }
        addDateTimeFormatPatterns(uiModel);
        return "domicilios/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String DomicilioController.update(@Valid Domicilio domicilio, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, domicilio);
            return "domicilios/update";
        }
        uiModel.asMap().clear();
        domicilioService.updateDomicilio(domicilio);
        return "redirect:/domicilios/" + encodeUrlPathSegment(domicilio.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String DomicilioController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, domicilioService.findDomicilio(id));
        return "domicilios/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String DomicilioController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Domicilio domicilio = domicilioService.findDomicilio(id);
        domicilioService.deleteDomicilio(domicilio);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/domicilios";
    }
    
    void DomicilioController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("domicilio_fechacreacion_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("domicilio_fechamodificacion_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void DomicilioController.populateEditForm(Model uiModel, Domicilio domicilio) {
        uiModel.addAttribute("domicilio", domicilio);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("usuarios", usuarioService.findAllUsuarios());
    }
    
    String DomicilioController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
