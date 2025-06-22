package com.inssider.api.domains.post.service;

import com.inssider.api.common.exception.DomainException;
import com.inssider.api.common.exception.ExceptionReason;
import com.inssider.api.common.exception.ExceptionReason.DomainType;
import com.inssider.api.common.exception.ExceptionReason.ExceptionReasonBuilder;
import com.inssider.api.common.exception.ExceptionReason.ExceptionType;
import com.inssider.api.common.model.ServiceResult;
import com.inssider.api.domains.account.Account;
import com.inssider.api.domains.account.AccountService;
import com.inssider.api.domains.category.entity.Category;
import com.inssider.api.domains.category.service.CategoryService;
import com.inssider.api.domains.post.dto.PostCreateRequestDTO;
import com.inssider.api.domains.post.dto.PostCursorRequestDTO;
import com.inssider.api.domains.post.dto.PostCursorResponseDTO;
import com.inssider.api.domains.post.dto.PostDeleteResponseDTO;
import com.inssider.api.domains.post.dto.PostGetDetailResponseDTO;
import com.inssider.api.domains.post.dto.PostGetIdResponseDTO;
import com.inssider.api.domains.post.dto.PostResponseDTO;
import com.inssider.api.domains.post.dto.PostUpdateRequestDTO;
import com.inssider.api.domains.post.dto.PostUpdateResponseDTO;
import com.inssider.api.domains.post.entity.Post;
import com.inssider.api.domains.post.mapper.PostMapper;
import com.inssider.api.domains.post.repository.PostRepository;
import com.inssider.api.domains.tag.entity.Tag;
import com.inssider.api.domains.tag.service.TagService;
import jakarta.transaction.Transactional;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Transactional
public class PostService {

  private final PostRepository postRepository;
  private final CategoryService categoryService;
  private final TagService tagService;

  // 인증 적용 후 삭제 예정
  private final AccountService accountService;

  private final ExceptionReasonBuilder reasonBuilder =
      ExceptionReason.builder().domainType(DomainType.POST);

  public PostResponseDTO create(PostCreateRequestDTO reqBody) {
    // 인증 적용 후 삭제 예정
    Account account = accountService.findById(1L).get();
    Category category =
        categoryService
            .getCategory(reqBody.getCategoryType())
            .orElseThrow(() -> new IllegalArgumentException("카테고리 오류 발생"));

    List<Tag> tags = tagService.findOrCreateTags(reqBody.getTags());

    Post post = PostMapper.dtoToPost(account, category, reqBody);
    post.addTags(tags);

    postRepository.save(post);

    return PostMapper.postToDTO(post);
  }

  public PostUpdateResponseDTO update(Long memeId, PostUpdateRequestDTO reqBody) {
    Post currentPost =
        postRepository
            .findByIdWithTag(memeId)
            .orElseThrow(() -> new IllegalArgumentException("게시글 오류 발생"));

    if (reqBody.hasTitle()) {
      currentPost.updateTitle(reqBody.getTitle());
    }

    if (reqBody.hasContent()) {
      currentPost.updateContent(reqBody.getContent());
    }

    if (reqBody.hasMediaUrl()) {
      currentPost.updateMediaUrl(reqBody.getMediaUrl());
    }

    if (reqBody.hasMediaUploadTime()) {
      currentPost.updateMediaUploadTime(reqBody.getMediaUploadTime());
    }

    if (reqBody.hasCategoryType()) {
      Category category =
          categoryService
              .getCategory(reqBody.getCategoryType())
              .orElseThrow(() -> new IllegalArgumentException("카테고리 오류 발생"));
      currentPost.updateCategory(category);
    }

    if (reqBody.hasTags()) {
      List<Tag> tags = tagService.findOrCreateTags(reqBody.getTags());
      currentPost.getPostTags().clear();
      currentPost.addTags(tags);
    }

    Post updatedPost = postRepository.save(currentPost);
    return PostMapper.postToUpdateDTO(updatedPost);
  }

  public PostDeleteResponseDTO delete(Long memeId) {
    Post currentPost =
        postRepository
            .findByIdWithTag(memeId)
            .orElseThrow(() -> new IllegalArgumentException("게시글 오류 발생"));
    currentPost.updateIsDeleted();
    currentPost.updateDeletedAt();
    Post updatedPost = postRepository.save(currentPost);

    return PostMapper.deleteDTO(updatedPost);
  }

  public ServiceResult<PostGetDetailResponseDTO, ? extends Throwable> getDetail(Long memeId) {
    try {

      Post currentPost =
          postRepository
              .findByIdWithTag(memeId)
              .orElseThrow(() -> new IllegalArgumentException("게시글 오류 발생"));
      return ServiceResult.success(PostMapper.toGetDetailDTO(currentPost));

    } catch (Exception e) {
      return ServiceResult.failure(
          new DomainException(
              reasonBuilder
                  .exceptionType(ExceptionType.ENTITY_NOT_FOUND)
                  .clazz(Long.class)
                  .instance(memeId)
                  .message("User profile not found")
                  .build(),
              e));
    }
  }

  public List<PostGetIdResponseDTO> getIds(LocalDate localDate) {
    if (localDate == null) {
      return postRepository.findAllIds();
    }
    LocalDateTime since = localDate.atStartOfDay();
    return postRepository.findPostsByCreatedAtAfter(since);
  }

  public boolean isPost(Long postId) {
    return postRepository.existsById(postId);
  }

  public ServiceResult<Post, ? extends Throwable> get(Long postId) {
    try {

      return ServiceResult.success(postRepository.findById(postId).orElseThrow());

    } catch (Exception e) {
      return ServiceResult.failure(
          new DomainException(
              reasonBuilder
                  .exceptionType(ExceptionType.ENTITY_NOT_FOUND)
                  .clazz(Long.class)
                  .instance(postId)
                  .message("User profile not found")
                  .build(),
              e));
    }
  }

  public ServiceResult<PostCursorResponseDTO, ? extends Throwable> get(
      PostCursorRequestDTO request) {

    try {
      Account account = accountService.findById(1L).get(); // [ ] 인증 적용 후 삭제

      PostCursorResponseDTO res;

      if ("post".equals(request.getProfile_filter())) {
        res = getPostsByAccount(request, account.getId());
      } else if ("like".equals(request.getProfile_filter())) {
        res = getLikedPostsByAccount(request, account.getId());
      } else {
        res = getAllPosts(request);
      }
      return ServiceResult.success(res);

    } catch (Exception e) {
      return ServiceResult.failure(
          new DomainException(
              reasonBuilder
                  .exceptionType(ExceptionType.ENTITY_NOT_FOUND)
                  .clazz(PostCursorRequestDTO.class)
                  .instance(request)
                  .message("Posts cursor request not found")
                  .build(),
              e));
    }
  }

  public PostCursorResponseDTO getAllPosts(PostCursorRequestDTO request) {
    return postRepository.findPostsWithCursor(request, null);
  }

  public PostCursorResponseDTO getPostsByAccount(PostCursorRequestDTO request, Long accountId) {
    return postRepository.findPostsByAccount(request, accountId);
  }

  public PostCursorResponseDTO getLikedPostsByAccount(
      PostCursorRequestDTO request, Long accountId) {
    return postRepository.findLikedPostsByAccount(request, accountId);
  }
}
