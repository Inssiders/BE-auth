package com.inssider.api.common.exception;

import java.util.Optional;

@lombok.Builder
public class ExceptionReason {

  private final DomainType domainType;

  @lombok.Getter private final ExceptionType exceptionType;
  private final Class<? extends Object> clazz;
  private final Object instance;
  private final String message;

  @Override
  public String toString() {
    var exceptionTypeString =
        Optional.ofNullable(this.exceptionType).map(Enum::name).orElse("UNDEFINED");
    var clazzString = Optional.ofNullable(this.clazz).map(Class::getSimpleName).orElse("");
    var instanceString = getInstanceString();
    var messageString = Optional.ofNullable(this.message).orElse("No message provided");

    return new StringBuilder()
        .append("[ExceptionReason] ")
        .append("DomainType: ")
        .append(domainType)
        .append(", ")
        .append("ExceptionType: ")
        .append(exceptionTypeString)
        .append(", ")
        .append("Class: ")
        .append(clazzString)
        .append(", ")
        .append("Instance: ")
        .append(instanceString)
        .append(", ")
        .append("Message: ")
        .append(messageString)
        .toString();
  }

  private String getInstanceString() {
    if (instance == null || clazz == null) {
      return "";
    }

    try {
      // clazz 타입으로 다운캐스팅 시도
      if (clazz.isInstance(instance)) {
        Object castedInstance = clazz.cast(instance);
        return castedInstance.toString();
      } else {
        return instance.toString();
      }
    } catch (ClassCastException e) {
      return instance.toString() + " (cast failed)";
    }
  }

  public enum DomainType {
    ACCOUNT,
    AUTH,
    CATEGORY,
    COMMENT,
    LIKE,
    POST,
    PROFILE,
    TAG,
    SECURITY
  }

  public enum ExceptionType {
    RETRIEVE_FAILED(400),
    CREDENTIAL_NOT_FOUND(401),
    UNAUTHORIZED(401),
    ENTITY_NOT_FOUND(404),
    FORBIDDEN(403),
    BAD_CREDENTIALS(400),
    ENTITY_UPDATE_FAILED(500),
    SERVICE_UNAVAILABLE(503),
    UNDEFINED(500);

    private final int httpStatusCode;

    ExceptionType(int httpStatusCode) {
      this.httpStatusCode = httpStatusCode;
    }

    public int getHttpStatusCode() {
      return httpStatusCode;
    }
  }
}
