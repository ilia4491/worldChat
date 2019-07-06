package com.epam.worldchat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/")
public class MainPageController {
	
	@GetMapping("/hello")
	 public String hello(Model model) {
		 model.addAttribute("name", "Ilya");
		 return "hello";
	 }
	
	@GetMapping({"/", "/hi"})
    public String hi(Model model, @RequestParam(value="name", required=false, defaultValue="World") String name) {
        model.addAttribute("name", name);
        return "hello";
    }
	
	@GetMapping("/index")
    public String index(Model model) {
        model.addAttribute("name", "Ilya");
        return "index";
    }

    @GetMapping("/home")
    public String indexYan(Model model) {
        model.addAttribute("name", "Ilya");
        return "home";
    }
}
