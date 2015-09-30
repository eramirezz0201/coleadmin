// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.raze.coleadmin.controller;

import com.raze.coleadmin.controller.GrupoController;
import com.raze.coleadmin.domain.Curso;
import com.raze.coleadmin.domain.Grupo;
import com.raze.coleadmin.service.CursoService;
import com.raze.coleadmin.service.GrupoService;
import com.raze.coleadmin.service.SalonService;
import com.raze.coleadmin.service.UsuarioService;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
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

privileged aspect GrupoController_Roo_Controller {
    
    @Autowired
    CursoService GrupoController.cursoService;
    
    @Autowired
    GrupoService GrupoController.grupoService;
    
    @Autowired
    SalonService GrupoController.salonService;
    
    @Autowired
    UsuarioService GrupoController.usuarioService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String GrupoController.create(@Valid Grupo grupo, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, grupo);
            return "grupoes/create";
        }
        uiModel.asMap().clear();
        grupoService.saveGrupo(grupo);
        return "redirect:/grupoes/" + encodeUrlPathSegment(grupo.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String GrupoController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Grupo());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (cursoService.countAllCursoes() == 0) {
            dependencies.add(new String[] { "curso", "cursoes" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "grupoes/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String GrupoController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("grupo", grupoService.findGrupo(id));
        uiModel.addAttribute("itemId", id);
        return "grupoes/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String GrupoController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("grupoes", grupoService.findGrupoEntries(firstResult, sizeNo));
            float nrOfPages = (float) grupoService.countAllGrupoes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("grupoes", grupoService.findAllGrupoes());
        }
        addDateTimeFormatPatterns(uiModel);
        return "grupoes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String GrupoController.update(@Valid Grupo grupo, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, grupo);
            return "grupoes/update";
        }
        uiModel.asMap().clear();
        grupoService.updateGrupo(grupo);
        return "redirect:/grupoes/" + encodeUrlPathSegment(grupo.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String GrupoController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, grupoService.findGrupo(id));
        return "grupoes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String GrupoController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Grupo grupo = grupoService.findGrupo(id);
        grupoService.deleteGrupo(grupo);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/grupoes";
    }
    
    void GrupoController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("grupo_fechacreacion_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("grupo_fechamodificacion_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void GrupoController.populateEditForm(Model uiModel, Grupo grupo) {
        uiModel.addAttribute("grupo", grupo);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("cursoes", cursoService.findAllCursoes());
        uiModel.addAttribute("salons", salonService.findAllSalons());
        uiModel.addAttribute("usuarios", usuarioService.findAllUsuarios());
    }
    
    String GrupoController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
