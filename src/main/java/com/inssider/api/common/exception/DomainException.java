package com.inssider.api.common.exception;

import com.inssider.api.common.exception.ExceptionReason.IReasonExtension;

public class DomainException extends Exception implements IReasonExtension {

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
