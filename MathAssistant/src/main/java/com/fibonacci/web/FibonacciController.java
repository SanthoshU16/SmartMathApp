package com.fibonacci.web;

import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.Base64;


@Controller
public class FibonacciController {

    private final FibonacciCurve generator = new FibonacciCurve();

   
    @GetMapping("/calculator")
    public String calculator(Model model) {
        model.addAttribute("svg", "");
        model.addAttribute("svgData", "");
        model.addAttribute("n", "8");
        model.addAttribute("selectedOption", "calc");
        return "index";
    }

    
    @GetMapping("/fibonacci")
    public String fibonacci(Model model) {
        model.addAttribute("svg", "");
        model.addAttribute("svgData", "");
        model.addAttribute("n", "8");
        model.addAttribute("selectedOption", "fib");
        return "index";
    }

    
    @GetMapping("/")
    public String home() {
        return "home";
    }

   
    @GetMapping({"/tools", "/index"})
    public String index(Model model) {
      
        model.addAttribute("svg", "");
        model.addAttribute("svgData", "");
        model.addAttribute("n", "8");
        model.addAttribute("selectedOption", "fib");
        return "index";
    }

    
    @GetMapping(value = "/api/fibonacci", produces = "image/svg+xml")
    @ResponseBody
    public ResponseEntity<String> getFibonacci(
            @RequestParam(value = "n", defaultValue = "6") int n
    ) {
        try {
            String svg = generator.generateSvg(n);

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.valueOf("image/svg+xml"));
            headers.setCacheControl("no-cache, no-store, must-revalidate");

            return new ResponseEntity<>(svg, headers, HttpStatus.OK);

        } catch (Exception ex) {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.TEXT_PLAIN);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .headers(headers)
                    .body("Error generating SVG: " + ex.getMessage());
        }
    }

    
    @GetMapping(value = "/fibonacci", produces = "image/svg+xml")
    @ResponseBody
    public ResponseEntity<byte[]> getFibonacciImage(
            @RequestParam(value = "n", required = false, defaultValue = "6") int n,
            @RequestParam(value = "size", required = false, defaultValue = "800") int size
    ) {
        try {
           
            byte[] svgBytes = generator.generateCurve(n, size);

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.valueOf("image/svg+xml"));
            headers.setCacheControl("no-cache, no-store, must-revalidate");

            return new ResponseEntity<>(svgBytes, headers, HttpStatus.OK);
        } catch (Exception ex) {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.TEXT_PLAIN);
            String msg = "Error generating curve: " + ex.getMessage();
            return new ResponseEntity<>(msg.getBytes(java.nio.charset.StandardCharsets.UTF_8), headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

   
    @GetMapping(value = "/fibonacci-image", produces = "image/svg+xml")
    @ResponseBody
    public ResponseEntity<byte[]> getFibonacciImageAlias(
            @RequestParam(value = "terms", required = false, defaultValue = "6") int terms,
            @RequestParam(value = "size", required = false, defaultValue = "800") int size
    ) {
        return getFibonacciImage(terms, size);
    }


    @PostMapping("/fibonacci-curve")
    public String drawFibCurve(@RequestParam(value = "n", required = false) String nStr,
                               @RequestParam(value = "option", required = false, defaultValue = "fib") String option,
                               Model model) {
        String svg = "";
        String svgData = "";
        String error = "";
        int n = 0;

        try {
            if (nStr == null || nStr.trim().isEmpty()) {
                error = "Please enter n.";
            } else {
                try {
                    n = Integer.parseInt(nStr.trim());
                } catch (NumberFormatException ex) {
                    throw new NumberFormatException("Invalid n format (use numbers only).");
                }

                if (n < 1) {
                    error = "n must be at least 1.";
                } else if (n > 45) {
                    error = "n too large (max 45).";
                } else {
                   
                    svg = generator.generateSvg(n);

                    
                    if (svg != null && !svg.isEmpty()) {
                        try {
                            svg = svg.replaceFirst("^\\s*<\\?xml[^>]*\\?>\\s*", "");
                            svg = svg.replaceFirst("^\\s*<!DOCTYPE[^>]*>\\s*", "");
                            svg = svg.trim();

                            int start = svg.indexOf("<svg");
                            int end = svg.lastIndexOf("</svg>");
                            if (start >= 0 && end >= 0 && end > start) {
                                svg = svg.substring(start, end + "</svg>".length()).trim();
                            } else if (start >= 0) {
                                svg = svg.substring(start).trim();
                            }

                        } catch (Exception ex) {
                            System.err.println("[FibonacciController] SVG sanitization failed: " + ex.getMessage());
                            ex.printStackTrace();
                        }

                        
                        try {
                            byte[] bytes = svg.getBytes(java.nio.charset.StandardCharsets.UTF_8);
                            String b64 = Base64.getEncoder().encodeToString(bytes);
                            svgData = "data:image/svg+xml;base64," + b64;
                        } catch (Exception ex) {
                            System.err.println("[FibonacciController] SVG data URI creation failed: " + ex.getMessage());
                        }

                        
                        try {
                           
                            String urlEncoded = java.net.URLEncoder.encode(svg, "UTF-8")
                                                           .replaceAll("\\+", "%20"); 
                            String dataUri = "data:image/svg+xml;utf8," + urlEncoded;
                           
                            String objectEmbed = "<object type='image/svg+xml' data='" + dataUri +
                                                 "' style='width:100%;height:100%;display:block;border:0'></object>";
                            svg = objectEmbed;
                            System.out.println("[FibonacciController] Embedded SVG via <object> dataURI created. length=" + dataUri.length());
                        } catch (Exception ex) {
                            System.err.println("[FibonacciController] SVG object-embed creation failed: " + ex.getMessage());
                            
                        }
                    } else {
                        System.out.println("[FibonacciController] generator returned empty SVG for n=" + n);
                    }
                }
            }
        } catch (NumberFormatException e) {
            error = "Invalid n format (use numbers only).";
        } catch (Exception e) {
            error = "Unexpected error: " + e.getMessage();
            System.err.println("Fibonacci error: " + e.getMessage());
            e.printStackTrace();
        }

        model.addAttribute("error", error);
        model.addAttribute("svg", svg);    
        model.addAttribute("svgData", svgData); 
        model.addAttribute("n", nStr != null ? nStr.trim() : "");
        model.addAttribute("selectedOption", option);
        return "index";
    }

   
    @GetMapping("/error")
    public String handleError(Model model) {
        model.addAttribute("error", "An unexpected error occurred. Please try again.");
        model.addAttribute("svg", "");
        model.addAttribute("svgData", "");
        model.addAttribute("n", "8");
        model.addAttribute("selectedOption", "fib");
        return "index";
    }
}