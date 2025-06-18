package com.inssider.api.domains.profile;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.inssider.api.common.TestScenarioHelper;
import com.inssider.api.common.Util;
import com.inssider.api.common.annotation.ControllerTest;
import com.inssider.api.domains.account.Account;
import com.inssider.api.domains.account.AccountDataTypes.RegisterType;
import com.inssider.api.domains.account.AccountService;
import com.inssider.api.domains.profile.UserProfileResponsesDto.GetProfileMeResponse;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

@ControllerTest
@Transactional
public class UserProfileControllerTests {
  @Autowired private TestScenarioHelper helper;
  @Autowired private ObjectMapper objectMapper;
  @Autowired private MockMvc mockMvc;

  @Autowired private AccountService accountService;

  @Test
  void 프로필_조회() throws Exception {
    // given
    Account account = Util.accountGenerator().get();
    String email = account.getEmail();
    String rawPassword = account.getPassword();

    account = accountService.register(RegisterType.PASSWORD, email, rawPassword);
    String accessToken = helper.postAuthTokenWithPassword(email, rawPassword).accessToken();

    // when
    GetProfileMeResponse response;
    {
      var rawResponse =
          mockMvc
              .perform(
                  get("/api/profiles/me")
                      .contentType(MediaType.APPLICATION_JSON)
                      .header("Authorization", "Bearer " + accessToken))
              .andExpect(status().is2xxSuccessful())
              .andReturn()
              .getResponse()
              .getContentAsString();
      var data = objectMapper.readTree(rawResponse).get("data");
      response = objectMapper.treeToValue(data, GetProfileMeResponse.class);
    }

    // then
    assert response != null;
  }
}
