package com.inssider.api.common.exception;

import com.inssider.api.common.exception.ExceptionReason.IReasonExtension;

public class CustomRuntimeException extends RuntimeException implements IReasonExtension {

  @lombok.Getter protected final ExceptionReason reason;

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
