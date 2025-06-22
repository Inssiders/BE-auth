package com.inssider.api.domains;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.inssider.api.common.annotation.ControllerTest;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ProblemDetail;
import org.springframework.test.web.servlet.MockMvc;

@ControllerTest
class ControllerExceptionTests {

  @Autowired private MockMvc mockMvc;
  @Autowired private ObjectMapper objectMapper;

  /**
   * 보안 필터 예외 처리 테스트
   *
   * <ul>
   *   <li>{@link com.inssider.api.domains.profile.UserProfileController}
   *   <li>{@link com.inssider.api.common.exception.CommonControllerAdvice}
   * </ul>
   */
  @Test
  void getProfileMe_withoutAuthentication_shouldReturn401_withNoContent() throws Exception {
    // 다음 순서에 따라 인증되지 않은 요청에 대해 예외가 반환됩니다
    // JwtConverterConfig > OAuth2ResourceServerSecurityConfig
    var response =
        mockMvc
            .perform(get("/api/profiles/me"))
            .andExpect(status().isUnauthorized())
            .andReturn()
            .getResponse()
            .getContentAsString();
    assertEquals("", response);
  }

  /**
   * UserProfileController에서 존재하지 않는 엔티티를 조회할 때
   *
   * <ul>
   *   <li>{@link com.inssider.api.domains.profile.UserProfileController#getProfile(Long)}
   *   <li>{@link com.inssider.api.common.exception.CommonControllerAdvice}
   * </ul>
   */
  @Test
  void getNonExistentEntity_shouldReturn4xx() throws Exception {
    var rawResponse =
        mockMvc
            .perform(get("/api/profiles/0").accept(MediaType.APPLICATION_JSON))
            .andExpect(status().is4xxClientError())
            .andExpect(content().contentType(MediaType.APPLICATION_PROBLEM_JSON))
            .andReturn()
            .getResponse()
            .getContentAsString();
    ProblemDetail response = objectMapper.readValue(rawResponse, ProblemDetail.class);

    assertEquals(
        "https://inssider.oomia.click/error/entity-not-found", response.getType().toString());
    assertEquals("ENTITY NOT FOUND", response.getTitle());
    assertEquals(404, response.getStatus());
    assertEquals("/api/profiles/0", response.getInstance().toString());
  }
}
