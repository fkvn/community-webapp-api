package mono.thainow.service;

import mono.thainow.domain.post.deal.Deal;
import mono.thainow.rest.request.DealRequest;

public interface DealService {

	Deal fetchDealFromRequest(Deal deal, DealRequest request);

	Deal createDeal(DealRequest request);
	
	Deal saveDeal(Deal deal);

//	Deal fetchDealFromUpdateRequest(Deal deal, DealRequest request);

	void removeDeal(Deal deal);

	void activateDeal(Deal deal);

	void updateDeal(Deal deal, DealRequest request);

	void disableDeal(Deal deal);
}
