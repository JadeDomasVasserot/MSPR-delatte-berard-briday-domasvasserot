package com.mspr.arosaje.config.swagger;

import org.springdoc.core.models.GroupedOpenApi;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SwaggerConfig {

    @Bean
    public GroupedOpenApi arosajeApi() {
        return GroupedOpenApi.builder()
                .group("Arosaje API")
                .pathsToMatch("/**")
                .displayName("Arosaje API")
                .build();
    }
}