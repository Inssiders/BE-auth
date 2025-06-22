package com.inssider.api.common;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.BDDMockito.given;

import com.inssider.api.domains.account.Account;
import com.inssider.api.domains.account.AccountAuthenticator;
import com.inssider.api.domains.account.AccountTestRepository;
import java.util.Optional;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest
@ActiveProfiles("test")
class UtilTests {
  private static final String ENCODED_PASSWORD_PATTERN = "^\\{[a-zA-Z0-9@_]+}\\$.*";

  @Autowired private PasswordEncoder passwordEncoder;
  @Autowired private AccountAuthenticator authenticator;

  @MockitoBean private AccountTestRepository accountRepository;

  private static Account account;

  @BeforeAll
  static void setUp() {
    account = Util.accountGenerator().get();
  }

  @Test
  void password_matches() {
    String plainPassword = account.getPassword();
    String hashedPassword = passwordEncoder.encode(plainPassword);
    assertTrue(hashedPassword.matches(ENCODED_PASSWORD_PATTERN));
  }

  @Test
  @Transactional
  void verify_password() {
    String plainPassword = account.getPassword();
    Account registeredAccount =
        Account.builder()
            .email(account.getEmail())
            .password(passwordEncoder.encode(plainPassword))
            .build();

    given(accountRepository.findByEmail(any(String.class)))
        .willReturn(Optional.of(registeredAccount));

    assertNotNull(authenticator.authenticate(account.getEmail(), account.getPassword()));
  }
}
