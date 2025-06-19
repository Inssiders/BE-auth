package com.inssider.api.domains;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDate;
import java.time.ZoneOffset;
import java.util.regex.Pattern;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.info.BuildProperties;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

/**
 * 애플리케이션 컨텍스트 로딩과 빌드 정보의 유효성을 검증하는 테스트입니다.
 *
 * <p>CI/CD 파이프라인의 스테이지 검증 단계 또는 배포 직전에 수동으로 실행하는 것을 권장합니다.
 *
 * <p><b>실행 명령어:</b>
 *
 * <pre>
 * ./gradlew test --tests MainWebApplicationTests
 * </pre>
 */
@SpringBootTest
@ActiveProfiles("test")
@Disabled("MANUAL RUN ONLY")
class MainWebApplicationTests {

  @Autowired(required = false)
  private BuildProperties buildProperties;

  @Test
  void contextLoads() {
    // build/resources/main/META-INF/build-info.properties
    if (buildProperties == null) {
      return; // buildProperties only created after build, not test
    }

    LocalDate buildDate = buildProperties.getTime().atZone(ZoneOffset.UTC).toLocalDate();
    LocalDate today = LocalDate.now(ZoneOffset.UTC);

    String version = buildProperties.getVersion();
    Pattern versionPattern = Pattern.compile("^v\\d+\\.\\d+\\.\\d+(?:-\\d+-[a-f0-9]+)?$");
    assertTrue(versionPattern.matcher(version).matches());

    assertEquals(today, buildDate);
    assertEquals("api", buildProperties.getArtifact());
    assertEquals("api", buildProperties.getName());
    assertEquals("com.inssider", buildProperties.getGroup());
  }
}
