package com.inssider.api.common.exception;

import com.inssider.api.common.Util;
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

  // @ExceptionHandler({BadCredentialsException.class})
  // @ResponseStatus(HttpStatus.UNAUTHORIZED)
  // public ProblemDetail badCredentialHandler(BadCredentialsException ex, WebRequest request) {
  //   ProblemDetail problemDetail = ProblemDetail.forStatus(HttpStatus.UNAUTHORIZED);
  //   problemDetail.setType(Util.buildAbsoluteUri("/error/unauthorized"));
  //   problemDetail.setTitle("Unauthorized");
  //   problemDetail.setDetail("[SECURITY FILTER] " + detailBuilder(ex, request));
  //   return problemDetail;
  // }

  // @ExceptionHandler({CredentialNotFoundException.class})
  // @ResponseStatus(HttpStatus.UNAUTHORIZED)
  // public ProblemDetail credentialNotFoundHandler(CredentialNotFoundException ex, WebRequest
  // request) {
  //   ProblemDetail problemDetail = ProblemDetail.forStatus(HttpStatus.UNAUTHORIZED);
  //   problemDetail.setType(Util.buildAbsoluteUri("/error/unauthorized"));
  //   problemDetail.setTitle("Unauthorized");
  //   problemDetail.setDetail(detailBuilder(ex, request));
  //   return problemDetail;
  // }

  @ExceptionHandler({DomainException.class})
  public ProblemDetail domainExceptionHandler(DomainException ex) {
    return fromExceptionReason(ex.getReason());
  }

  @ExceptionHandler({CustomRuntimeException.class})
  public ProblemDetail customRuntimeExceptionHandler(CustomRuntimeException ex) {
    return fromExceptionReason(ex.getReason());
  }

  private ProblemDetail fromExceptionReason(ExceptionReason reason) {
    var httpStatusCode = reason.getExceptionType().getHttpStatusCode();
    ProblemDetail problemDetail = ProblemDetail.forStatus(httpStatusCode);
    problemDetail.setType(
        Util.buildAbsoluteUri(
            "/error/" + reason.getExceptionType().name().replace("_", "-").toLowerCase()));
    problemDetail.setTitle(reason.getExceptionType().name().replace("_", " "));
    problemDetail.setDetail(reason.toString());
    return problemDetail;
  }

  // @ExceptionHandler(Exception.class)
  // @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
  // public ProblemDetail generalExceptionHandler(Exception ex) {
  //   ProblemDetail problemDetail = ProblemDetail.forStatus(HttpStatus.INTERNAL_SERVER_ERROR);
  //   problemDetail.setType(Util.buildAbsoluteUri("/error/internal-server-error"));
  //   problemDetail.setTitle(ex.getClass().getSimpleName());
  //   problemDetail.setDetail(detailBuilder(ex));
  //   return problemDetail;
  // }

  // public static String detailBuilder(Exception ex, WebRequest request) {
  //   StringBuilder builder = new StringBuilder();
  //   builder.append(ex.toString());
  //   builder.append("\nUser Principal: ").append(request.getUserPrincipal());
  //   return builder.toString();
  // }
}
