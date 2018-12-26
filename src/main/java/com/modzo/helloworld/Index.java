package com.modzo.helloworld;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;

@RestController
class Index {

    @GetMapping("/")
    public String index() {
        String version = UUID.randomUUID().toString();
        return String.format("Hey there! %s", version);
    }

}
