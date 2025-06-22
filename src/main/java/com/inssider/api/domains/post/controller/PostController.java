package com.inssider.api.domains.post.controller;

import com.inssider.api.common.response.BaseResponse;
import com.inssider.api.domains.post.dto.PostCreateRequestDTO;
import com.inssider.api.domains.post.dto.PostCursorRequestDTO;
import com.inssider.api.domains.post.dto.PostCursorResponseDTO;
import com.inssider.api.domains.post.dto.PostDeleteResponseDTO;
import com.inssider.api.domains.post.dto.PostGetDetailResponseDTO;
import com.inssider.api.domains.post.dto.PostGetIdResponseDTO;
import com.inssider.api.domains.post.dto.PostResponseDTO;
import com.inssider.api.domains.post.dto.PostUpdateRequestDTO;
import com.inssider.api.domains.post.dto.PostUpdateResponseDTO;
import com.inssider.api.domains.post.service.PostService;
import jakarta.validation.Valid;
import java.time.LocalDate;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springdoc.core.annotations.ParameterObject;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@Log4j2
@RestController
@RequiredArgsConstructor
@RequestMapping("/posts")
public class PostController {

  private final PostService postService;

  @PostMapping
  ResponseEntity<BaseResponse.ResponseWrapper<PostResponseDTO>> register(
      @Valid @RequestBody PostCreateRequestDTO reqBody) {
    PostResponseDTO data = postService.create(reqBody);
    return BaseResponse.of(201, data);
  }

  @PatchMapping("/{memeId}")
  ResponseEntity<BaseResponse.ResponseWrapper<PostUpdateResponseDTO>> update(
      @PathVariable Long memeId, @RequestBody PostUpdateRequestDTO reqBody) {
    PostUpdateResponseDTO data = postService.update(memeId, reqBody);
    return BaseResponse.of(200, data);
  }

  @PatchMapping("/delete/{memeId}")
  ResponseEntity<BaseResponse.ResponseWrapper<PostDeleteResponseDTO>> delete(
      @PathVariable Long memeId) {
    PostDeleteResponseDTO data = postService.delete(memeId);
    return BaseResponse.of(200, data);
  }

  @GetMapping("/{memeId}")
  ResponseEntity<BaseResponse.ResponseWrapper<PostGetDetailResponseDTO>> getDetail(
      @PathVariable Long memeId) {
    PostGetDetailResponseDTO data = postService.getDetail(memeId).orElseThrow();
    return BaseResponse.of(200, data);
  }

  @GetMapping("/sitemap")
  ResponseEntity<BaseResponse.ResponseWrapper<List<PostGetIdResponseDTO>>> getIds(
      @RequestParam(value = "since", required = false) LocalDate since) {
    List<PostGetIdResponseDTO> data = postService.getIds(since);
    return BaseResponse.of(200, data);
  }

  @GetMapping
  public ResponseEntity<BaseResponse.ResponseWrapper<PostCursorResponseDTO>> get(
      @ParameterObject PostCursorRequestDTO request) {
    PostCursorResponseDTO data = postService.get(request).orElseThrow();
    return BaseResponse.of(200, data);
  }
}
