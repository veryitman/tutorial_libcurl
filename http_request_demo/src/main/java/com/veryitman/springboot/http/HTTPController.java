package com.veryitman.springboot.http;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HTTPController {
    @RequestMapping(value = "/user")
    public String sayHello(Integer id, String name) {
        return "user info: " + "id=" + id + " name=" + name + "\n";
    }
}
