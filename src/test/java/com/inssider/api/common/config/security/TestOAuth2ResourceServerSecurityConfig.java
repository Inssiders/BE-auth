package com.inssider.api.common.config.security;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Stream;

import org.springframework.boot.test.context.TestComponent;
import org.springframework.context.annotation.Primary;
import org.springframework.core.convert.converter.Converter;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;

@TestComponent
@Primary
public class TestOAuth2ResourceServerSecurityConfig extends OAuth2ResourceServerSecurityConfig {
    public TestOAuth2ResourceServerSecurityConfig(Converter<Jwt, JwtAuthenticationToken> customConverter) {
        super(customConverter);
    }

    public List<String> getSystemPublicPathsForTest() {
        return Arrays.asList(super.getSystemPublicPaths());
    }

    public List<String> getPublicPostPathsForTest() {
        return Arrays.asList(super.publicPostPaths());
    }

    public List<String> getPublicGetPathsForTest() {
        return Arrays.asList(super.publicGetPaths());
    }

    public List<String> getAllPublicPathsForTest() {
        return Stream.of(
                getSystemPublicPathsForTest(),
                getPublicPostPathsForTest(),
                getPublicGetPathsForTest())
                .flatMap(List::stream)
                .toList();
    }
}