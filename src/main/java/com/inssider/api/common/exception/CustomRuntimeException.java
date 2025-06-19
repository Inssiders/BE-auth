package com.inssider.api.common.exception;

public class CustomRuntimeException extends RuntimeException {

  @lombok.Getter private final ExceptionReason reason;

  CustomRuntimeException(DomainException domainException) {
    super(domainException.getMessage(), domainException);
    this.reason = domainException.getReason();
  }

  public static CustomRuntimeException of(ExceptionReason reason) {
    return new CustomRuntimeException(new DomainException(reason));
  }

  public static CustomRuntimeException of(ExceptionReason reason, Exception cause) {
    return new CustomRuntimeException(new DomainException(reason, cause));
  }
}
