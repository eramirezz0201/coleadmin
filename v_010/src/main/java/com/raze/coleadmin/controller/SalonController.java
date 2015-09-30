package com.raze.coleadmin.controller;
import com.raze.coleadmin.domain.Salon;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;

@RooWebJson(jsonObject = Salon.class)
@Controller
@RequestMapping("/salons")
@RooWebScaffold(path = "salons", formBackingObject = Salon.class)
public class SalonController {
}