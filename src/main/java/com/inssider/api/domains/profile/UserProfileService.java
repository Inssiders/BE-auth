package com.inssider.api.domains.profile;

import com.inssider.api.common.model.ServiceResult;
import com.inssider.api.common.response.StandardResponse.GetIndexResponse;
import com.inssider.api.common.response.StandardResponse.QueryResponse;
import com.inssider.api.domains.profile.UserProfileDataTypes.ProfileContext;
import com.inssider.api.domains.profile.UserProfileRequestsDto.PatchProfileMeRequest;
import com.inssider.api.domains.profile.UserProfileResponsesDto.GetProfileResponse;
import com.inssider.api.domains.profile.UserProfileResponsesDto.PatchProfileMeResponse;
import org.springframework.data.domain.Pageable;

public interface UserProfileService {

  ServiceResult<GetIndexResponse, ? extends Throwable> getAllUserProfileIds();

  ServiceResult<QueryResponse<GetProfileResponse>, ? extends Throwable> findUserProfilesByNickname(
      String nickname, Pageable pageable);

  ServiceResult<GetProfileResponse, ? extends Throwable> findUserProfileById(
      Long id, ProfileContext context);

  ServiceResult<PatchProfileMeResponse, ? extends Throwable> updateUserProfile(
      Long id, PatchProfileMeRequest request);
}
