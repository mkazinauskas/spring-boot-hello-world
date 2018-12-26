package com.modzo.helloworld;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.util.StringUtils;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.springframework.boot.test.context.SpringBootTest.WebEnvironment.RANDOM_PORT;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = RANDOM_PORT)
public class HelloWorldApplicationTests {

    @Autowired
    private TestRestTemplate template;

    @Test
    public void helloEndpointReturnsText() {
        ResponseEntity<String> result = template.getForEntity("/", String.class);
        assertEquals(HttpStatus.OK, result.getStatusCode());
        assertTrue(StringUtils.startsWithIgnoreCase(result.getBody(), "Hey there!"));
    }
}

