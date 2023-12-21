package mono.thainow.service;


import mono.thainow.domain.post.guideBook.GuideBook;

public interface GuideBookService {

    GuideBook patchGuideBook(GuideBook currentGuideBook, GuideBook newGuideBook);

    GuideBook saveGuideBook(GuideBook guideBook);

    // Hard delete
    void deleteGuideBook(GuideBook guideBook);


    //
    ////	Deal fetchDealFromUpdateRequest(Deal deal, DealRequest request);
    //
    //	void removeDeal(Deal deal);
    //
    //	void activateDeal(Deal deal);
    //
    //	void updateDeal(Deal deal, DealRequest request);
    //
    //	void disableDeal(Deal deal);
}
