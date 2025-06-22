package com.inssider.api.domains;

import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import com.inssider.api.common.annotation.ControllerTest;
import com.inssider.api.common.config.security.TestOAuth2ResourceServerSecurityConfig;
import java.util.List;
import java.util.stream.Stream;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.parallel.Execution;
import org.junit.jupiter.api.parallel.ExecutionMode;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Import;
import org.springframework.test.web.servlet.MockMvc;

@ControllerTest
@Import(TestOAuth2ResourceServerSecurityConfig.class)
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
public class PublicEndpointTests {

  @Autowired private TestOAuth2ResourceServerSecurityConfig config;
  @Autowired private MockMvc mockMvc;

  @ParameterizedTest
  @MethodSource("providePublicPaths")
  @Execution(ExecutionMode.CONCURRENT)
  void testPublicPath(String path) throws Exception {
    mockMvc
        .perform(get(path))
        .andDo(print())
        .andExpect(
            result -> {
              int status = result.getResponse().getStatus();
              assertTrue(
                  status != 401 && status != 403,
                  "Path " + path + " should be publicly accessible but returned: " + status);
              assertTrue((status / 100) != 5, "Path " + path + " returned server error: " + status);
            });
  }

  private Stream<String> providePublicPaths() {
    List<String> publicPaths = config.buildTestablePublicGetPaths();
    return publicPaths.stream();
  }
}
