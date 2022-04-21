package mono.thainow.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import mono.thainow.domain.post.Post;

public interface PostRepository extends JpaRepository<Post, Long> {
	
}
