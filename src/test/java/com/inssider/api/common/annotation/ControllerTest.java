package com.inssider.api.common.annotation;

import com.inssider.api.common.TestScenarioHelper;
import com.inssider.api.common.config.TestEmailConfiguration;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Import;
import org.springframework.test.context.ActiveProfiles;

/**
 * 컨트롤러 통합 테스트를 위한 어노테이션
 *
 * <ul>
 *   <li>전체 애플리케이션 컨텍스트 로드 {@link SpringBootTest}
 *   <li>테스트 설정 사용 {@link ActiveProfiles}
 *   <li>MockMvc 자동 설정 {@link AutoConfigureMockMvc}
 *   <li>기타 테스트 관련 설정 {@link TestScenarioHelper} {@link TestEmailConfiguration}
 * </ul>
 */
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@SpringBootTest
@ActiveProfiles("test")
@AutoConfigureMockMvc
@Import({TestScenarioHelper.class, TestEmailConfiguration.class})
public @interface ControllerTest {}
