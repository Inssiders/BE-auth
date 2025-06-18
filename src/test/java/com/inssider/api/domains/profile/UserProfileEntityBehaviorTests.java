package com.inssider.api.domains.profile;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import com.inssider.api.common.Util;
import com.inssider.api.domains.account.Account;
import com.inssider.api.domains.account.AccountTestRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest
@ActiveProfiles("test")
@Transactional
class UserProfileEntityBehaviorTests {

  @Autowired private AccountTestRepository accountRepository;
  @Autowired private UserProfileRepository repository;

  @Test
  void 계정을_등록할때_사용자_프로필이_자동으로_생성되어야한다() {
    // Given - 새로운 계정 생성
    Account account = Util.accountGenerator().get();

    // When - 새로운 계정 등록
    accountRepository.save(account);

    // Then - 사용자 프로필이 정확히 1개 생성되어야 함
    long profileCount = repository.count();
    assertEquals(1, profileCount);
  }

  @Test
  void 사용자_프로필_조회() {
    // Given - 새로운 계정 등록
    Account account = Util.accountGenerator().get();
    accountRepository.save(account);

    // When - 사용자 프로필 조회
    UserProfile userProfile = account.getProfile();
    String profileNickname = repository.findById(userProfile.getId()).orElseThrow().getNickname();

    // Then - 프로필이 정확히 조회되어야 함
    assertNotNull(userProfile);
    assertEquals(account, userProfile.getAccount());
    assertEquals(profileNickname, userProfile.getNickname());
  }

  @Test
  void 계정_소프트_삭제시_프로필도_소프트_삭제되어야_한다() {
    // Given - 새로운 계정 생성
    Account account = Util.accountGenerator().get();
    accountRepository.save(account);

    // When - 계정 소프트 삭제
    account.softDelete();
    accountRepository.save(account);

    assertEquals(0, accountRepository.count()); // 공식적인 삭제 확인
    assertEquals(1, repository.findAllDeleted().size()); // soft-delete 확인
  }
}
