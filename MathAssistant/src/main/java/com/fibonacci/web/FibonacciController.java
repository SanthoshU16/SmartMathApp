package com.fibonacci.web;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Base64;

@Controller
public class FibonacciController {

    @GetMapping("/")
    public String index() {
        return "home";
    }

    @GetMapping("/fibonacci")
    public String fibonacci() {
       
        return "index";
    }

    @GetMapping("/calculator")
    public String calculator() {
        return "index";
    }

    
    @GetMapping(value = "/fibonacci-image", produces = MediaType.IMAGE_PNG_VALUE)
    @ResponseBody
    public org.springframework.http.ResponseEntity<byte[]> fibonacciImage(@RequestParam(name = "terms", defaultValue = "8") int terms) throws Exception {
        FibonacciCurve fc = new FibonacciCurve();
        String base64 = fc.generateCurve(terms);
        byte[] img = Base64.getDecoder().decode(base64);

        org.springframework.http.HttpHeaders headers = new org.springframework.http.HttpHeaders();
        headers.setCacheControl("no-cache, no-store, must-revalidate");
        headers.add("Pragma", "no-cache");
        headers.add("Expires", "0");
        headers.setContentType(org.springframework.http.MediaType.IMAGE_PNG);

        return new org.springframework.http.ResponseEntity<>(img, headers, org.springframework.http.HttpStatus.OK);
    }
}
