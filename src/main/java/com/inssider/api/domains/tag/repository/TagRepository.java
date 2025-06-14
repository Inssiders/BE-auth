package com.inssider.api.domains.tag.repository;

import com.inssider.api.domains.tag.entity.Tag;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TagRepository extends JpaRepository<Tag, Long> {

  Optional<Tag> findByName(String tagName);
}
