package com.modzo.hello;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
class Index {

    @GetMapping("/")
    public String index(){
        return "Hey there!";
    }

}
