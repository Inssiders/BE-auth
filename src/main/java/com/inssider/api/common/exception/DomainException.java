package com.inssider.api.common.exception;

public class DomainException extends Exception {

  @lombok.Getter protected final ExceptionReason reason;

  public DomainException(ExceptionReason reason) {
    super(reason.toString());
    this.reason = reason;
  }

  public DomainException(ExceptionReason reason, Exception cause) {
    super(reason.toString(), cause);
    this.reason = reason;
  }
}
