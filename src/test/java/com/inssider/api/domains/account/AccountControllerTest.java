package com.inssider.api.domains.account;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.patch;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.inssider.api.common.TestScenarioHelper;
import com.inssider.api.common.Util;
import com.inssider.api.common.annotation.ControllerTest;
import com.inssider.api.domains.account.AccountDataTypes.RegisterType;
import com.inssider.api.domains.auth.AuthDataTypes.GrantType;
import com.inssider.api.domains.auth.AuthRequestsDto.AuthTokenWithPasswordRequest;
import com.inssider.api.domains.auth.AuthService;
import com.inssider.api.domains.profile.UserProfileTestRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

@ControllerTest
@Transactional
class AccountControllerTest {
  @Autowired private TestScenarioHelper helper;
  @Autowired private AccountService accountService;
  @Autowired private AccountRepository accountRepository;

  @Autowired private UserProfileTestRepository userProfileRepository;
  @Autowired private AuthService authService;

  @Autowired private MockMvc mockMvc;
  @Autowired private ObjectMapper objectMapper;

  private String email;
  private String plainPassword;

  @BeforeEach
  void setUp() {
    Account account = Util.accountGenerator().get();
    email = account.getEmail();
    plainPassword = account.getPassword();
    accountService.register(RegisterType.PASSWORD, email, plainPassword);
  }

  @Test
  void 회원탈퇴_후_재가입() throws Exception {
    // given
    String accessToken = helper.postAuthTokenWithPassword(email, plainPassword).accessToken();

    // when
    {
      mockMvc
          .perform(delete("/api/accounts/me").header("Authorization", "Bearer " + accessToken))
          .andExpect(status().isOk());
    }

    // then - 1. 회원 탈퇴 후, 계정 정보가 soft delete 상태로 변경됨
    assertEquals(1, accountRepository.findAllDeleted().size());
    assertEquals(0, accountRepository.count());
    assertEquals(0, userProfileRepository.count());

    // then - 2. 회원 탈퇴 후, 로그인 시도 시 실패
    {
      var request = new AuthTokenWithPasswordRequest(GrantType.PASSWORD, email, plainPassword);
      mockMvc
          .perform(
              post("/api/auth/token")
                  .contentType("application/json")
                  .content(objectMapper.writeValueAsString(request)))
          .andExpect(status().is4xxClientError());
    }

    // then - 3. 재가입 시, 기존 계정 hard delete 후 계정 생성 확인
    accountService.register(RegisterType.PASSWORD, email, plainPassword);
    assertEquals(1, accountRepository.count());
    assertEquals(0, accountRepository.findAllDeleted().size());
  }

  @Test
  void 비밀번호_변경() throws Exception {
    // 2. 비밀번호 변경 요청 when
    String newPassword = Util.passwordGenerator().get();
    {
      String accessToken = helper.getSingleAccessToken(email);
      var request = new AccountRequestsDto.PatchAccountPasswordRequest(newPassword);
      mockMvc
          .perform(
              patch("/api/accounts/me/password")
                  .header("Authorization", "Bearer " + accessToken)
                  .contentType("application/json")
                  .content(objectMapper.writeValueAsString(request)))
          .andExpect(status().isOk());
    }

    // 3. 변경된 비밀번호로 로그인 시도 then
    {
      var request = new AuthTokenWithPasswordRequest(GrantType.PASSWORD, email, newPassword);
      var response = authService.createTokens(request);
      assertNotNull(response.accessToken());
      assertNotNull(response.refreshToken());
    }
  }
}
