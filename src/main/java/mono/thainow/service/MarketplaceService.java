package mono.thainow.service;

import mono.thainow.domain.post.marketplace.Marketplace;
import mono.thainow.rest.request.MarketplaceRequest;

public interface MarketplaceService {

	Marketplace getMarketplaceFromRequest(MarketplaceRequest request);

	Marketplace createMarketplace(MarketplaceRequest request);
	
	Marketplace saveMarketplace(Marketplace marketplace);

	Marketplace getMarketplaceFromUpdateRequest(Marketplace marketplace, MarketplaceRequest request);

	void remove(Marketplace marketplace);

	void updateMarketplace(Marketplace marketplace, MarketplaceRequest request);

	void disableMarketplace(Marketplace marketplace);

	void activateMarketplace(Marketplace marketplace);
}
