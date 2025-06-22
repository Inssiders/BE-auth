package com.inssider.api.domains.account;

import com.inssider.api.common.response.BaseResponse;
import com.inssider.api.common.response.BaseResponse.ResponseWrapper;
import com.inssider.api.domains.account.AccountRequestsDto.PatchAccountPasswordRequest;
import com.inssider.api.domains.account.AccountRequestsDto.PostAccountRequest;
import com.inssider.api.domains.account.AccountResponsesDto.PatchAccountMePasswordResponse;
import com.inssider.api.domains.account.AccountResponsesDto.PostAccountResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/accounts")
class AccountController {

  private final AccountService service;

  @GetMapping("/check")
  ResponseEntity<ResponseWrapper<Void>> checkEmailAvailability(
      @RequestParam(defaultValue = "") String email) {
    boolean isAvailable = !email.isBlank() && service.existsByEmail(email);
    return isAvailable ? BaseResponse.of(200, null) : BaseResponse.of(404, null);
  }

  @PostMapping
  ResponseEntity<ResponseWrapper<PostAccountResponse>> register(
      @AuthenticationPrincipal Jwt jwt, @RequestBody PostAccountRequest reqBody) {
    String email = jwt.getClaim("email");
    if (!email.equals(reqBody.email())) {
      throw new IllegalArgumentException("Email in request body must match authenticated email");
    }
    var data = service.register(reqBody.registerType(), reqBody.email(), reqBody.password());
    return BaseResponse.of(201, new PostAccountResponse(data.getEmail(), data.getCreatedAt()));
  }

  // 회원 탈퇴
  @DeleteMapping("/me")
  ResponseEntity<ResponseWrapper<Void>> deleteAccount(@AuthenticationPrincipal Account account) {
    service.softDelete(account.getId());
    return BaseResponse.of(200, null);
  }

  @PatchMapping("/me/password")
  ResponseEntity<ResponseWrapper<PatchAccountMePasswordResponse>> changePassword(
      @AuthenticationPrincipal Account account, @RequestBody PatchAccountPasswordRequest reqBody) {
    Assert.notNull(account, "Account must not be null");
    var response = service.patchAccountPassword(account.getId(), reqBody.password());
    return BaseResponse.of(200, new PatchAccountMePasswordResponse(response.getUpdatedAt()));
  }
}
