package com.manese.facebookapi;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/api/**")
                .allowedOrigins("https://facebookapi-frontend.onrender.com", "http://localhost:5173")
                .allowedMethods("*") // allow ALL HTTP methods
                .allowedHeaders("*") // allow all headers
                .allowCredentials(true);
    }
}

