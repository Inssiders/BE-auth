package com.inssider.api.common;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import com.inssider.api.common.annotation.ControllerTest;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;

@ControllerTest
class ControllerExceptionTests {

  @Autowired private MockMvc mockMvc;

  @Test
  void getNonExistentEntity_shouldReturn404() throws Exception {
    mockMvc
        .perform(get("/api/profiles/0").accept(MediaType.APPLICATION_JSON))
        .andExpect(status().is4xxClientError());
  }
}
