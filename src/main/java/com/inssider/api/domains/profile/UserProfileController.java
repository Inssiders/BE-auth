package com.inssider.api.domains.profile;

import com.inssider.api.common.exception.CustomRuntimeException;
import com.inssider.api.common.exception.DomainException;
import com.inssider.api.common.exception.ExceptionReason;
import com.inssider.api.common.exception.ExceptionReason.DomainType;
import com.inssider.api.common.exception.ExceptionReason.ExceptionType;
import com.inssider.api.common.response.BaseResponse;
import com.inssider.api.common.response.BaseResponse.ResponseWrapper;
import com.inssider.api.common.response.StandardResponse.GetIndexResponse;
import com.inssider.api.common.response.StandardResponse.QueryResponse;
import com.inssider.api.domains.account.Account;
import com.inssider.api.domains.profile.UserProfileDataTypes.ProfileContext;
import com.inssider.api.domains.profile.UserProfileRequestsDto.PatchProfileMeRequest;
import com.inssider.api.domains.profile.UserProfileResponsesDto.GetPrivateProfileResponse;
import com.inssider.api.domains.profile.UserProfileResponsesDto.GetProfileMeResponse;
import com.inssider.api.domains.profile.UserProfileResponsesDto.GetProfileResponse;
import com.inssider.api.domains.profile.UserProfileResponsesDto.GetPublicProfileResponse;
import com.inssider.api.domains.profile.UserProfileResponsesDto.PatchProfileMeResponse;
import lombok.RequiredArgsConstructor;
import org.springdoc.core.annotations.ParameterObject;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/profiles")
class UserProfileController {

  private final UserProfileService service;

  // === Public API ===

  @GetMapping("/index")
  ResponseEntity<ResponseWrapper<GetIndexResponse>> accountIndexes() {
    try {
      var accountIds = service.getAllUserProfileIds();
      var data = new GetIndexResponse(accountIds);
      return BaseResponse.of(200, data);
    } catch (Exception e) {
      //
      throw CustomRuntimeException.of(
          ExceptionReason.builder()
              .domainType(DomainType.PROFILE)
              .exceptionType(ExceptionType.SERVICE_UNAVAILABLE)
              .message("Temporarily unable to retrieve user profile indexes")
              .build(),
          e);
    }
  }

  @GetMapping
  public QueryResponse<GetProfileResponse> query(
      @ParameterObject
          @PageableDefault(
              size = 10,
              page = 0,
              sort = {"nickname", "createdAt"},
              direction = Sort.Direction.ASC)
          Pageable pageable,
      @RequestParam(required = false) String nickname) {
    return service.findUserProfilesByNickname(nickname, pageable);
  }

  @GetMapping("/{id:\\d+}")
  ResponseEntity<ResponseWrapper<GetProfileResponse>> getProfile(@PathVariable("id") Long id)
      throws DomainException {
    GetProfileResponse profileData;

    try {
      profileData = service.findUserProfileById(id, ProfileContext.PUBLIC);
    } catch (Exception e) {
      throw new DomainException(
          ExceptionReason.builder()
              .domainType(DomainType.PROFILE)
              .exceptionType(ExceptionType.RETRIEVE_FAILED)
              .clazz(GetProfileResponse.class)
              .message("Failed to retrieve user profile by ID: " + id)
              .build(),
          e);
    }

    return switch (profileData) {
      case GetPublicProfileResponse pub -> BaseResponse.of(200, pub);
      case GetPrivateProfileResponse priv -> BaseResponse.of(200, priv);
      default -> BaseResponse.of(404, null);
    };
  }

  // === Protected API ===

  @GetMapping("/me")
  ResponseEntity<ResponseWrapper<GetProfileMeResponse>> getProfile(
      @AuthenticationPrincipal Account account) throws DomainException {

    long accountId;
    try {
      accountId = account.getId();
    } catch (Exception e) {
      throw new DomainException(
          ExceptionReason.builder()
              .domainType(DomainType.PROFILE)
              .exceptionType(ExceptionType.CREDENTIAL_NOT_FOUND)
              .clazz(Account.class)
              .instance(account)
              .message("Failed to retrieve account ID from authentication principal")
              .build(),
          e);
    }

    GetProfileResponse data;
    try {
      data = service.findUserProfileById(accountId, ProfileContext.SELF);
    } catch (Exception e) {
      throw new DomainException(
          ExceptionReason.builder()
              .domainType(DomainType.PROFILE)
              .exceptionType(ExceptionType.RETRIEVE_FAILED)
              .clazz(GetProfileResponse.class)
              .message("Failed to retrieve user profile")
              .build(),
          e);
    }

    return switch (data) {
      case GetProfileMeResponse owner -> BaseResponse.of(200, owner);
      default ->
          throw new DomainException(
              ExceptionReason.builder()
                  .domainType(DomainType.PROFILE)
                  .exceptionType(ExceptionType.UNAUTHORIZED)
                  .clazz(GetProfileResponse.class)
                  .instance(data)
                  .message("Unauthorized access to owned-profile data")
                  .build());
    };
  }

  @PatchMapping("/me")
  ResponseEntity<ResponseWrapper<PatchProfileMeResponse>> updateProfile(
      @AuthenticationPrincipal Account account, @RequestBody PatchProfileMeRequest profile) {

    PatchProfileMeResponse data;
    try {
      data =
          service.updateUserProfile(
              account.getId(),
              profile.nickname(),
              profile.profileUrl(),
              profile.bio(),
              profile.accountVisible(),
              profile.followerVisible());

    } catch (Exception e) {
      throw CustomRuntimeException.of(
          ExceptionReason.builder()
              .domainType(ExceptionReason.DomainType.PROFILE)
              .exceptionType(ExceptionReason.ExceptionType.ENTITY_UPDATE_FAILED)
              .clazz(PatchProfileMeRequest.class)
              .instance(profile)
              .message("Failed to update user profile")
              .build(),
          e);
    }
    return BaseResponse.of(200, data);
  }
}
