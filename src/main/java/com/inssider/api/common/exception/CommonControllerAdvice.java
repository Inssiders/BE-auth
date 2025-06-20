package com.inssider.api.common.exception;

import com.inssider.api.common.Util;
import com.inssider.api.common.exception.ExceptionReason.IReasonExtension;
import lombok.RequiredArgsConstructor;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.ProblemDetail;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
@Order(Ordered.LOWEST_PRECEDENCE)
@RequiredArgsConstructor
class CommonControllerAdvice {
  @ExceptionHandler({DomainException.class, CustomRuntimeException.class})
  public ProblemDetail domainExceptionHandler(IReasonExtension ex) {
    var reason = ex.getReason();
    var httpStatusCode = reason.getExceptionType().getHttpStatusCode();
    ProblemDetail problemDetail = ProblemDetail.forStatus(httpStatusCode);
    problemDetail.setType(
        Util.buildAbsoluteUri(
            "/error/" + reason.getExceptionType().name().replace("_", "-").toLowerCase()));
    problemDetail.setTitle(reason.getExceptionType().name().replace("_", " "));
    problemDetail.setDetail(reason.toString());
    return problemDetail;
  }
}
