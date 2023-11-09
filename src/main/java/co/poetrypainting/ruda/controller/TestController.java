package co.poetrypainting.ruda.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
  @GetMapping("/")
  public String hello() {
    return "index";
  }
  @GetMapping("/123")
  public String hello2() {
    return "login";
  }
}
