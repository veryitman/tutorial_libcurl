package com.veryitman.springboot.http;

import org.springframework.http.HttpHeaders;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class HTTPController {
    /* localhost:8080/user?id=13&name=hi */

    @RequestMapping(value = "/user")
    public String greeting(Integer id, String name) {
        return "user info: " + "id=" + id + " name=" + name + "\n";
    }

    /* localhost:8080/userInfo?uid=13 */

    @RequestMapping(value = "/userInfo")
    public Map getUserInfo(Integer uid, @RequestHeader HttpHeaders headers) {

        // 获取 User-Agent
        List<String> user_agent = headers.get("User-Agent");
        System.out.println(user_agent);

        HashMap rspDatas = new HashMap<String, Object>();

        HashMap userInfo = new HashMap<String, Object>();

        if (uid <= 0) {
            rspDatas.put("code", -1);
            rspDatas.put("msg", "uid is not exist.");
        } else {
            rspDatas.put("code", 0);
            rspDatas.put("msg", "OK.");

            HashMap user = new HashMap<String, Object>();
            user.put("uid", uid);
            user.put("userName", "veryitman");
            user.put("userAge", 29);
            user.put("userGender", 1);
            user.put("blog", "www.veryitman.com");
            user.put("email", "veryitman.126.com");

            userInfo.put("user", user);
        }

        rspDatas.put("results", userInfo);

        /**
         * Generate JSON as follow：
         *
         * {
         *     "msg": "OK.",
         *     "code": 0,
         *     "results": {
         *         "user": {
         *             "uid": 90,
         *             "userGender": 1,
         *             "userName": "veryitman",
         *             "blog": "www.veryitman.com",
         *             "userAge": 19,
         *             "email": "veryitman.126.com"
         *         }
         *     }
         * }
         *
         */

        return rspDatas;
    }
}
