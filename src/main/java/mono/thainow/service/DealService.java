package mono.thainow.service;

import mono.thainow.domain.post.deal.Deal;
import mono.thainow.rest.request.DealRequest;

public interface DealService {

	Deal getDealFromRequest(DealRequest request);

	Deal createDeal(DealRequest request);
	
	Deal saveDeal(Deal deal);

	Deal getDealFromUpdateRequest(Deal deal, DealRequest request);

	void remove(Deal deal);

	void activateDeal(Deal deal);

	void updateDeal(Deal deal, DealRequest request);

	void disableDeal(Deal deal);
}
