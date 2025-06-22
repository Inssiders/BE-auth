package com.inssider.api.domains.comment.service;

import com.inssider.api.common.exception.DomainException;
import com.inssider.api.common.exception.ExceptionReason;
import com.inssider.api.common.exception.ExceptionReason.DomainType;
import com.inssider.api.common.exception.ExceptionReason.ExceptionReasonBuilder;
import com.inssider.api.common.model.ServiceResult;
import com.inssider.api.domains.account.Account;
import com.inssider.api.domains.account.AccountService;
import com.inssider.api.domains.comment.dto.CommentCreateRequestDTO;
import com.inssider.api.domains.comment.dto.CommentCreateResponseDTO;
import com.inssider.api.domains.comment.dto.CommentDeleteResponseDTO;
import com.inssider.api.domains.comment.dto.CommentGetResponseDTO;
import com.inssider.api.domains.comment.dto.CommentUpdateRequestDTO;
import com.inssider.api.domains.comment.dto.CommentUpdateResponseDTO;
import com.inssider.api.domains.comment.entity.Comment;
import com.inssider.api.domains.comment.mapper.CommentMapper;
import com.inssider.api.domains.comment.repository.CommentRepository;
import com.inssider.api.domains.post.entity.Post;
import com.inssider.api.domains.post.service.PostService;
import jakarta.transaction.Transactional;
import java.util.List;
import java.util.NoSuchElementException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Transactional
public class CommentService {

  private final CommentRepository commentRepository;
  private final PostService postService;
  // 인증 적용 후 삭제 예정
  private final AccountService accountService;

  private final ExceptionReasonBuilder builder =
      ExceptionReason.builder().domainType(DomainType.COMMENT);

  public CommentCreateResponseDTO create(Long memeId, CommentCreateRequestDTO requestDTO) {
    // 인증 적용 후 삭제 예정
    Account account = accountService.findById(2L).get();
    Post post = postService.get(memeId).orElseThrow();

    Comment parentComment = null;
    if (requestDTO.getParentCommentId() != null) {
      parentComment = findById(requestDTO.getParentCommentId());
    }

    Comment comment =
        Comment.builder()
            .content(requestDTO.getContent())
            .post(post)
            .account(account)
            .parentComment(parentComment)
            .build();

    if (parentComment != null) {
      parentComment.addChild(comment);
    }

    Comment createdComment = commentRepository.save(comment);
    return CommentMapper.toDTO(createdComment);
  }

  public CommentDeleteResponseDTO delete(Long commentId) {
    Comment currentComment = findById(commentId);

    if (!currentComment.getChildComments().isEmpty())
      throw new IllegalStateException("하위 댓글이 존재하여 삭제가 불가능합니다.");

    currentComment.updateIsDeleted();
    currentComment.updateDeletedAt();
    Comment updatedComment = commentRepository.save(currentComment);

    return CommentMapper.deleteDTO(updatedComment);
  }

  public ServiceResult<List<CommentGetResponseDTO>, ? extends Throwable> get(Long memeId) {
    try {

      List<Comment> comments = commentRepository.findAllByPostIdWithAccount(memeId);
      return ServiceResult.success(CommentMapper.toGetResponseDTO(comments));

    } catch (Exception e) {
      return ServiceResult.failure(
          new DomainException(
              builder
                  .exceptionType(ExceptionReason.ExceptionType.ENTITY_NOT_FOUND)
                  .clazz(Long.class)
                  .instance(memeId)
                  .message("존재하지 않는 콘텐츠입니다.")
                  .build(),
              e));
    }
  }

  public CommentUpdateResponseDTO update(Long commentId, CommentUpdateRequestDTO reqBody) {
    Comment comment = findById(commentId);
    comment.updateContent(reqBody.getContent());
    commentRepository.flush();
    return CommentMapper.toUpdateDTO(comment);
  }

  public Comment findById(Long commentId) {
    return commentRepository
        .findById(commentId)
        .orElseThrow(() -> new NoSuchElementException("존재하지 않는 댓글입니다."));
  }
}
