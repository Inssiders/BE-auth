package com.inssider.api.common.config.security;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Stream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.TestComponent;
import org.springframework.context.annotation.Primary;

@TestComponent
@Primary
public class TestOAuth2ResourceServerSecurityConfig {
  @Autowired private OAuth2ResourceServerSecurityConfig config;

  public List<String> collectPublicPostPaths() {
    return Arrays.asList(config.publicPostPaths());
  }

  public List<String> collectSystemPublicGetPaths() {
    return Arrays.asList(config.getSystemPublicPaths());
  }

  public List<String> collectPublicGetPaths() {
    return Arrays.asList(config.publicGetPaths());
  }

  public List<String> buildTestablePublicGetPaths() {
    return Stream.of(collectSystemPublicGetPaths(), collectPublicGetPaths())
        .flatMap(List::stream)
        .filter(path -> !path.contains("**"))
        .map(this::replacePathVariables)
        .toList();
  }

  private String replacePathVariables(String path) {
    // 모든 중괄호 {} 패턴을 임시로 1로 대체
    return path.replaceAll("\\{[^}]*\\}", "1");
  }
}
