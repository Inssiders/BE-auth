package com.inssider.api.domains.profile;

import com.inssider.api.common.exception.DomainException;
import com.inssider.api.common.exception.ExceptionReason;
import com.inssider.api.common.exception.ExceptionReason.DomainType;
import com.inssider.api.common.exception.ExceptionReason.ExceptionReasonBuilder;
import com.inssider.api.common.exception.ExceptionReason.ExceptionType;
import com.inssider.api.common.model.ServiceResult;
import com.inssider.api.common.response.StandardResponse.GetIndexResponse;
import com.inssider.api.common.response.StandardResponse.QueryResponse;
import com.inssider.api.domains.profile.UserProfileDataTypes.ProfileContext;
import com.inssider.api.domains.profile.UserProfileRequestsDto.PatchProfileMeRequest;
import com.inssider.api.domains.profile.UserProfileResponsesDto.GetProfileResponse;
import com.inssider.api.domains.profile.UserProfileResponsesDto.PatchProfileMeResponse;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Objects;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
class UserProfileServiceImpl implements UserProfileService {

  private final UserProfileRepository repository;
  private final ExceptionReasonBuilder reasonBuilder =
      ExceptionReason.builder().domainType(DomainType.PROFILE);

  @Override
  public ServiceResult<GetIndexResponse, ? extends Throwable> getAllUserProfileIds() {
    try {

      List<Long> userProfileIds =
          repository.findAll().stream().map(UserProfile::getId).filter(Objects::nonNull).toList();
      return ServiceResult.success(new GetIndexResponse(userProfileIds));

    } catch (Exception e) {
      return ServiceResult.failure(
          new DomainException(
              reasonBuilder
                  .exceptionType(ExceptionType.SERVICE_UNAVAILABLE)
                  .message("Temporarily unable to retrieve user profile indexes")
                  .build(),
              e));
    }
  }

  @Override
  public ServiceResult<GetProfileResponse, ? extends Throwable> findUserProfileById(
      Long id, ProfileContext context) {
    try {

      return ServiceResult.success(repository.findById(id).orElseThrow().convertToDto(context));

    } catch (Exception e) {
      return ServiceResult.failure(
          new DomainException(
              reasonBuilder
                  .exceptionType(ExceptionType.ENTITY_NOT_FOUND)
                  .clazz(Long.class)
                  .instance(id)
                  .message("User profile not found")
                  .build(),
              e));
    }
  }

  @Override
  public ServiceResult<PatchProfileMeResponse, ? extends Throwable> updateUserProfile(
      Long id, PatchProfileMeRequest request) {
    try {

      var entity = repository.findById(id).orElseThrow();

      request.nickname().ifPresent(entity::setNickname);
      request.profileUrl().ifPresent(entity::setProfileUrl);
      request.bio().ifPresent(entity::setBio);
      request.accountVisible().ifPresent(entity::setAccountVisible);
      request.followerVisible().ifPresent(entity::setFollowerVisible);

      entity = repository.save(entity);

      return ServiceResult.success(
          new PatchProfileMeResponse(
              entity.convertToDto(ProfileContext.SELF), entity.getUpdatedAt()));

    } catch (NoSuchElementException e) {
      return ServiceResult.failure(
          new DomainException(
              reasonBuilder
                  .clazz(Long.class)
                  .instance(id)
                  .exceptionType(ExceptionType.ENTITY_NOT_FOUND)
                  .message("User profile not found")
                  .build(),
              e));

    } catch (Exception e) {
      return ServiceResult.failure(
          new DomainException(
              reasonBuilder
                  .clazz(PatchProfileMeRequest.class)
                  .instance(request)
                  .exceptionType(ExceptionType.ENTITY_UPDATE_FAILED)
                  .message("User profile update failed")
                  .build(),
              e));
    }
  }

  @Override
  public ServiceResult<QueryResponse<GetProfileResponse>, ? extends Throwable>
      findUserProfilesByNickname(String nickname, Pageable pageable) {

    try {
      Page<UserProfile> userProfilePage;

      if (nickname != null && !nickname.trim().isEmpty()) {
        userProfilePage = repository.findByNicknameContainingIgnoreCase(nickname, pageable);
      } else {
        userProfilePage = repository.findAll(pageable);
      }

      Page<GetProfileResponse> userProfileDtoPage = userProfilePage.map(UserProfile::convertToDto);

      return ServiceResult.success(
          QueryResponse.of(
              userProfileDtoPage.getContent(), userProfileDtoPage, pageable.getPageSize()));

    } catch (Exception e) {
      return ServiceResult.failure(
          new DomainException(
              reasonBuilder
                  .exceptionType(ExceptionType.SERVICE_UNAVAILABLE)
                  .message("Temporarily unable to search user profiles")
                  .build(),
              e));
    }
  }
}
