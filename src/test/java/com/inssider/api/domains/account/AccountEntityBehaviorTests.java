package com.inssider.api.domains.account;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import com.inssider.api.common.Util;
import jakarta.transaction.Transactional;
import java.time.LocalDateTime;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

@SpringBootTest
@ActiveProfiles("test")
@Transactional
class AccountEntityBehaviorTests {

  @Autowired private AccountTestRepository repository;

  @Test
  void 계정을_생성할때_정상적으로_생성되고_개수가_증가해야한다() {
    // Given - 현재 계정 개수 확인
    var initialCount = repository.count();

    // When - 새로운 계정 생성
    var firstAccount = createUserAccount();
    var secondAccount = createUserAccount();

    // Then - 계정이 정상 생성되고 개수가 증가
    assertNotNull(firstAccount);
    assertNotNull(secondAccount);
    assertEquals(initialCount + 2, repository.count());
  }

  @Test
  void 계정_소프트_삭제_삭제시간이_기록되고_개수에서_제외된다() {
    // Given - 계정 생성
    var account = createUserAccount();
    var createdAt = account.getCreatedAt();
    var updatedAt = account.getUpdatedAt();

    // When - 소프트 삭제 수행
    // Note: 엔티티의 softDelete 메서드를 호출하는 것 외에도,
    //       SoftDeleteRepository 인터페이스의 softDelete 메서드를 직접 호출할 수 있습니다.
    //       repository.softDelete를 활용하는 경우,
    //       JPQL UPDATE 쿼리는 영속성 컨텍스트를 우회하여 DB를 직접 업데이트하므로,
    //       같은 영속성 컨텍스트 내에서 변경 결과를 확인하기 위해서는 영속성 컨텍스트를 초기화해야 합니다.
    //  repository.softDelete(account.getId());
    //  em.clear();
    account.softDelete();
    account = repository.save(account);

    // Then - 삭제 시간이 기록되고 카운트에서 제외
    LocalDateTime deletedAt = account.getDeletedAt();
    assertNotNull(deletedAt);
    assertEquals(createdAt, updatedAt);
    assertTrue(deletedAt.isAfter(createdAt));
    assertTrue(deletedAt.isAfter(updatedAt));
    assertEquals(0, repository.count());
  }

  private Account createUserAccount() {
    var account = Util.accountGenerator().get();
    return repository.save(account);
  }
}
