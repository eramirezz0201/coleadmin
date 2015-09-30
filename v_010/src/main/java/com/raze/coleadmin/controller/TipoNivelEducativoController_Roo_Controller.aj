// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.coleadmin.controller;

import com.raze.coleadmin.catalog.TipoNivelEducativo;
import com.raze.coleadmin.controller.TipoNivelEducativoController;
import com.raze.coleadmin.service.TipoNivelEducativoService;
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

privileged aspect TipoNivelEducativoController_Roo_Controller {
    
    @Autowired
    TipoNivelEducativoService TipoNivelEducativoController.tipoNivelEducativoService;
    
    @Autowired
    UsuarioService TipoNivelEducativoController.usuarioService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String TipoNivelEducativoController.create(@Valid TipoNivelEducativo tipoNivelEducativo, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, tipoNivelEducativo);
            return "tiponiveleducativoes/create";
        }
        uiModel.asMap().clear();
        tipoNivelEducativoService.saveTipoNivelEducativo(tipoNivelEducativo);
        return "redirect:/tiponiveleducativoes/" + encodeUrlPathSegment(tipoNivelEducativo.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String TipoNivelEducativoController.createForm(Model uiModel) {
        populateEditForm(uiModel, new TipoNivelEducativo());
        return "tiponiveleducativoes/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String TipoNivelEducativoController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("tiponiveleducativo", tipoNivelEducativoService.findTipoNivelEducativo(id));
        uiModel.addAttribute("itemId", id);
        return "tiponiveleducativoes/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String TipoNivelEducativoController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("tiponiveleducativoes", tipoNivelEducativoService.findTipoNivelEducativoEntries(firstResult, sizeNo));
            float nrOfPages = (float) tipoNivelEducativoService.countAllTipoNivelEducativoes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("tiponiveleducativoes", tipoNivelEducativoService.findAllTipoNivelEducativoes());
        }
        addDateTimeFormatPatterns(uiModel);
        return "tiponiveleducativoes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String TipoNivelEducativoController.update(@Valid TipoNivelEducativo tipoNivelEducativo, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, tipoNivelEducativo);
            return "tiponiveleducativoes/update";
        }
        uiModel.asMap().clear();
        tipoNivelEducativoService.updateTipoNivelEducativo(tipoNivelEducativo);
        return "redirect:/tiponiveleducativoes/" + encodeUrlPathSegment(tipoNivelEducativo.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String TipoNivelEducativoController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, tipoNivelEducativoService.findTipoNivelEducativo(id));
        return "tiponiveleducativoes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String TipoNivelEducativoController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        TipoNivelEducativo tipoNivelEducativo = tipoNivelEducativoService.findTipoNivelEducativo(id);
        tipoNivelEducativoService.deleteTipoNivelEducativo(tipoNivelEducativo);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/tiponiveleducativoes";
    }
    
    void TipoNivelEducativoController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("tipoNivelEducativo_fechacreacion_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("tipoNivelEducativo_fechamodificacion_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void TipoNivelEducativoController.populateEditForm(Model uiModel, TipoNivelEducativo tipoNivelEducativo) {
        uiModel.addAttribute("tipoNivelEducativo", tipoNivelEducativo);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("usuarios", usuarioService.findAllUsuarios());
    }
    
    String TipoNivelEducativoController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
