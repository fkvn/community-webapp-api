package mono.thainow.repository;

import mono.thainow.domain.post.Post;
import mono.thainow.domain.post.PostStatus;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface PostRepository extends JpaRepository<Post, Long> {

    Optional<Post> findByIdAndStatus(Long id, PostStatus status);

    Optional<Post> findByIdAndStatusNot(Long id, PostStatus status);
}
