package mono.thainow.repository;

import mono.thainow.domain.post.guideBook.GuideBook;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GuideBookRepository extends JpaRepository<GuideBook, Long> {


}
