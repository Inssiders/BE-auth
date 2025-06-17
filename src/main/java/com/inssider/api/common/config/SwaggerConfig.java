package com.inssider.api.common.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import io.swagger.v3.core.jackson.ModelResolver;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import io.swagger.v3.oas.annotations.security.SecurityRequirements;
import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.Operation;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.security.SecurityScheme;
import io.swagger.v3.oas.models.servers.Server;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Stream;
import org.springdoc.core.customizers.OperationCustomizer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.info.BuildProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.env.Environment;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.method.HandlerMethod;

@Configuration
class SwaggerConfig {

  @Autowired(required = false)
  private BuildProperties buildProperties;

  @Autowired private Environment environment;

  @Bean
  @Primary
  public ModelResolver modelResolver() {
    ObjectMapper openApiMapper = new ObjectMapper();
    openApiMapper.setPropertyNamingStrategy(PropertyNamingStrategies.SNAKE_CASE);
    return new ModelResolver(openApiMapper);
  }

  @Bean
  public OpenAPI customOpenAPI() {
    String version =
        Optional.ofNullable(buildProperties).map(BuildProperties::getVersion).orElse("DEVELOPMENT");

    var config =
        new OpenAPI()
            .info(
                new Info()
                    .title("Inssider Auth API")
                    .version(version)
                    .description("Inssider Auth API Documentation"))
            .components(components());

    if (Arrays.asList(environment.getActiveProfiles()).contains("prod")) {
      config.addServersItem(
          new Server().url("https://inssider.oomia.click").description("Production"));
    }

    return config;
  }

  private Components components() {
    var components = new Components();
    components.addSecuritySchemes(
        "AccessToken",
        new SecurityScheme()
            .type(SecurityScheme.Type.HTTP)
            .scheme("bearer")
            .bearerFormat("JWT")
            .in(SecurityScheme.In.HEADER)
            .name("Authorization"));
    return components;
  }

  @Bean
  public OperationCustomizer operationCustomizer() {
    return (Operation operation, HandlerMethod handlerMethod) -> {
      Set<String> securityRequirements = new HashSet<>();

      // @AuthenticationPrincipal이 있으면 기본 AccessToken 추가
      if (hasAuthenticationPrincipal(handlerMethod)) {
        securityRequirements.add("AccessToken");
      }

      // 명시적인 SecurityRequirement(s) 추가
      collectSecurityRequirements(handlerMethod)
          .forEach(req -> securityRequirements.add(req.name()));

      securityRequirements.forEach(
          name ->
              operation.addSecurityItem(
                  new io.swagger.v3.oas.models.security.SecurityRequirement().addList(name)));

      return operation;
    };
  }

  private boolean hasAuthenticationPrincipal(HandlerMethod handlerMethod) {
    return Arrays.stream(handlerMethod.getMethodParameters())
        .anyMatch(param -> param.hasParameterAnnotation(AuthenticationPrincipal.class));
  }

  private Stream<SecurityRequirement> collectSecurityRequirements(HandlerMethod handlerMethod) {
    return Stream.of(handlerMethod.getMethod(), handlerMethod.getBeanType())
        .flatMap(this::extractSecurityRequirements);
  }

  private Stream<SecurityRequirement> extractSecurityRequirements(
      java.lang.reflect.AnnotatedElement element) {
    Stream<SecurityRequirement> singleReq =
        Optional.ofNullable(element.getAnnotation(SecurityRequirement.class)).stream();

    Stream<SecurityRequirement> multipleReqs =
        Optional.ofNullable(element.getAnnotation(SecurityRequirements.class))
            .map(SecurityRequirements::value)
            .map(Arrays::stream)
            .orElse(Stream.empty());

    return Stream.concat(singleReq, multipleReqs);
  }
}
