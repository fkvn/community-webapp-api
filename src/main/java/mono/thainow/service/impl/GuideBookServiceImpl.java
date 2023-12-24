package mono.thainow.service.impl;//package mono.thainow.service.impl;

import mono.thainow.domain.post.guideBook.GuideBook;
import mono.thainow.exception.BadRequest;
import mono.thainow.repository.GuideBookRepository;
import mono.thainow.service.GuideBookService;
import mono.thainow.service.StorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

import static org.apache.commons.lang3.StringUtils.isBlank;

@Service
public class GuideBookServiceImpl implements GuideBookService {

    @Autowired
    GuideBookRepository guideBookRepository;

    @Autowired
    StorageService storageService;

    @Override
    public GuideBook patchGuideBook(GuideBook currentGuideBook, GuideBook newGuideBook) {

        Optional.ofNullable(newGuideBook.getTitle()).ifPresent(currentGuideBook::setTitle);
        if (isBlank(currentGuideBook.getTitle())) throw new BadRequest("Title is required!");

        Optional.ofNullable(newGuideBook.getCategory()).ifPresent(currentGuideBook::setCategory);
        if (currentGuideBook.getCategory() == null) throw new BadRequest("Category is required!");

        Optional.ofNullable(newGuideBook.getDescription())
                .ifPresent(currentGuideBook::setDescription);

        Optional.ofNullable(newGuideBook.getContent()).ifPresent(currentGuideBook::setContent);

        Optional.ofNullable(newGuideBook.getBannerUrl()).ifPresent(currentGuideBook::setBannerUrl);

        // merge
        currentGuideBook = saveGuideBook(currentGuideBook);

        return currentGuideBook;
    }

    @Override
    public GuideBook saveGuideBook(GuideBook guideBook) {
        return guideBookRepository.save(guideBook);
    }

    @Override
    public void deleteGuideBook(GuideBook guideBook) {
        guideBookRepository.delete(guideBook);
    }
}
