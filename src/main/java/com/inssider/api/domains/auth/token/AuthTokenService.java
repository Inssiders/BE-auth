package com.inssider.api.domains.auth.token;

import com.inssider.api.domains.account.Account;
import com.inssider.api.domains.auth.AuthResponsesDto.AuthTokenResponse;
import java.util.UUID;

public interface AuthTokenService {
  AuthTokenResponse permitTokensByPassword(String email, String rawPassword);

  AuthTokenResponse permitTokensByRefreshToken(String refreshToken);

  AuthTokenResponse permitTokensByAuthorizationCode(UUID uuid);

  /**
   * 계정의 Refresh Token을 무효화합니다.
   *
   * @param account 토큰을 무효화할 계정
   */
  void revokeRefreshToken(Account account);

  /**
   * 토큰 문자열을 사용하여 해당 Refresh Token을 무효화합니다.
   *
   * @param token 무효화할 Refresh Token 문자열
   */
  void revokeRefreshToken(String token);
}
