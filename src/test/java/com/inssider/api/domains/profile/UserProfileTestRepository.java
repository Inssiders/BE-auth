package com.inssider.api.domains.profile;

import org.springframework.boot.test.context.TestComponent;
import org.springframework.context.annotation.Primary;

@TestComponent
@Primary
public interface UserProfileTestRepository extends UserProfileRepository {}
