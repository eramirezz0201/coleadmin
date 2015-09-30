// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.coleadmin.controller;

import com.raze.coleadmin.catalog.MetodoPago;
import com.raze.coleadmin.controller.MetodoPagoController;
import com.raze.coleadmin.service.MetodoPagoService;
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

privileged aspect MetodoPagoController_Roo_Controller {
    
    @Autowired
    MetodoPagoService MetodoPagoController.metodoPagoService;
    
    @Autowired
    UsuarioService MetodoPagoController.usuarioService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String MetodoPagoController.create(@Valid MetodoPago metodoPago, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, metodoPago);
            return "metodopagoes/create";
        }
        uiModel.asMap().clear();
        metodoPagoService.saveMetodoPago(metodoPago);
        return "redirect:/metodopagoes/" + encodeUrlPathSegment(metodoPago.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String MetodoPagoController.createForm(Model uiModel) {
        populateEditForm(uiModel, new MetodoPago());
        return "metodopagoes/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String MetodoPagoController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("metodopago", metodoPagoService.findMetodoPago(id));
        uiModel.addAttribute("itemId", id);
        return "metodopagoes/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String MetodoPagoController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("metodopagoes", metodoPagoService.findMetodoPagoEntries(firstResult, sizeNo));
            float nrOfPages = (float) metodoPagoService.countAllMetodoPagoes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("metodopagoes", metodoPagoService.findAllMetodoPagoes());
        }
        addDateTimeFormatPatterns(uiModel);
        return "metodopagoes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String MetodoPagoController.update(@Valid MetodoPago metodoPago, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, metodoPago);
            return "metodopagoes/update";
        }
        uiModel.asMap().clear();
        metodoPagoService.updateMetodoPago(metodoPago);
        return "redirect:/metodopagoes/" + encodeUrlPathSegment(metodoPago.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String MetodoPagoController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, metodoPagoService.findMetodoPago(id));
        return "metodopagoes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String MetodoPagoController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        MetodoPago metodoPago = metodoPagoService.findMetodoPago(id);
        metodoPagoService.deleteMetodoPago(metodoPago);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/metodopagoes";
    }
    
    void MetodoPagoController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("metodoPago_fechacreacion_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("metodoPago_fechamodificacion_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void MetodoPagoController.populateEditForm(Model uiModel, MetodoPago metodoPago) {
        uiModel.addAttribute("metodoPago", metodoPago);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("usuarios", usuarioService.findAllUsuarios());
    }
    
    String MetodoPagoController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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