package com.raze.coleadmin.controller;
import com.raze.coleadmin.domain.CicloEscolar;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;

@RooWebJson(jsonObject = CicloEscolar.class)
@Controller
@RequestMapping("/cicloescolars")
@RooWebScaffold(path = "cicloescolars", formBackingObject = CicloEscolar.class)
public class CicloEscolarController {
}