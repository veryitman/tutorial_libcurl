package com.veryitman.springboot.http;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

import com.veryitman.springboot.model.UserModel;

@RestController
public class HTTPController {
    @RequestMapping(value = "/user")
    public String sayHello(Integer id, String name) {
        return "user info: " + "id=" + id + " name=" + name + "\n";
    }

    @RequestMapping(value = "/userInfo")
    public Map getUserInfi(Integer uid) {
        HashMap userInfo = new HashMap<String, Object>();
        if (0 >= uid) {
            return userInfo;
        }

        userInfo.put("uid", 121);
        userInfo.put("userName", "veryitman");
        userInfo.put("userAge", 19);
        userInfo.put("userGender", 1);

        UserModel userModel;

        return userInfo;
    }
}
