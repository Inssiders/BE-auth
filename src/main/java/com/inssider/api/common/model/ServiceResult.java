package com.inssider.api.common.model;

import com.inssider.api.common.exception.CustomRuntimeException;
import com.inssider.api.common.exception.DomainException;
import com.inssider.api.common.exception.ExceptionReason;
import com.inssider.api.common.exception.ExceptionReason.DomainType;

/**
 * 서비스 실행 결과를 나타내는 타입
 *
 * @param <T> 성공 시 값의 타입
 * @param <E> 실패 시 에러의 타입 (Throwable일 필요 없음)
 */
public sealed interface ServiceResult<T, E> permits ServiceResult.Success, ServiceResult.Failure {

  record Success<T, E>(T value) implements ServiceResult<T, E> {}

  record Failure<T, E>(E exception) implements ServiceResult<T, E> {}

  static <T, E> ServiceResult<T, E> success(T value) {
    return new Success<>(value);
  }

  static <T, E> ServiceResult<T, E> failure(E exception) {
    return new Failure<>(exception);
  }

  default boolean isSuccess() {
    return this instanceof Success<T, E>;
  }

  default boolean isFailure() {
    return this instanceof Failure<T, E>;
  }

  default T orElse(T defaultValue) {
    return switch (this) {
      case Success<T, E> success -> success.value();
      case Failure<T, E> failure -> defaultValue;
    };
  }

  /**
   * 성공 시 값을 반환하고, 실패 시 예외를 던집니다. DomainException으로 발생한 예외는 ExceptionReason 원본을 포함하여
   * CustomRuntimeException으로 래핑됩니다. 그 외에는 임시로 정의된 ExceptionReason을 사용하여 CustomRuntimeException으로
   * 래핑됩니다.
   *
   * @return 성공 시 값, 실패 시 예외를 던집니다.
   * @throws CustomRuntimeException 실패 시 발생하는 예외
   * @see CustomRuntimeException
   * @see DomainException
   * @see ExceptionReason
   */
  default T orElseThrow() {
    return switch (this) {
      case Success<T, E> success -> success.value();
      case Failure<T, E> failure -> {
        if (failure.exception() instanceof DomainException ex) {
          throw CustomRuntimeException.of(ex.getReason(), ex);
        } else {
          throw CustomRuntimeException.of(
              ExceptionReason.builder()
                  .domainType(DomainType.COMMON)
                  .exceptionType(ExceptionReason.ExceptionType.UNDEFINED)
                  .clazz(ServiceResult.class)
                  .instance(this)
                  .message("ServiceResult failure: " + failure.exception())
                  .build());
        }
      }
    };
  }
}
