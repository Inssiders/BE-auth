package com.inssider.api.domains.account;

import com.inssider.api.common.exception.CustomRuntimeException;
import com.inssider.api.common.exception.ExceptionReason;
import com.inssider.api.common.exception.ExceptionReason.DomainType;
import com.inssider.api.common.exception.ExceptionReason.ExceptionType;
import com.inssider.api.domains.auth.code.AuthCodeService;
import java.util.NoSuchElementException;
import java.util.UUID;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.jwt.JwtDecoder;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class AccountAuthenticator {

  private final AccountRepository repository;

  // common
  private final PasswordEncoder passwordEncoder;
  private final JwtDecoder jwtDecoder;

  // auth-code-related
  private final AuthCodeService authCodeService;

  public Account authenticate(String email, String password) {
    Account account = repository.findByEmail(email).orElseThrow();
    if (account.isDeleted()) {
      throw CustomRuntimeException.of(
          ExceptionReason.builder()
              .domainType(DomainType.ACCOUNT)
              .exceptionType(ExceptionType.CREDENTIAL_NOT_FOUND)
              .clazz(String.class)
              .instance(email)
              .message("Account has been deleted")
              .build());
    }
    if (!passwordEncoder.matches(password, account.getPassword())) {
      throw CustomRuntimeException.of(
          ExceptionReason.builder()
              .domainType(DomainType.ACCOUNT)
              .exceptionType(ExceptionType.FORBIDDEN)
              .clazz(String.class)
              .instance(email)
              .message("Invalid email or password")
              .build());
    }
    return account;
  }

  public Account redeemAuthorizationCode(UUID authCodeId) {
    String email = authCodeService.redeem(authCodeId).getEmail();
    return repository.findByEmail(email).orElse(Account.builder().email(email).build());
  }

  public Account getAccountFromToken(String token) throws NoSuchElementException {
    Long id = Long.valueOf(jwtDecoder.decode(token).getSubject());
    return repository.findById(id).orElseThrow();
  }
}
