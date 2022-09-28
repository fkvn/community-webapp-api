package mono.thainow.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import mono.thainow.dao.MarketplaceDao;
import mono.thainow.domain.post.PostStatus;
import mono.thainow.domain.post.marketplace.Marketplace;
import mono.thainow.domain.storage.Storage;
import mono.thainow.rest.request.MarketplaceRequest;
import mono.thainow.rest.request.StorageRequest;
import mono.thainow.service.MarketplaceService;
import mono.thainow.service.LocationService;
import mono.thainow.service.StorageService;

@Service
public class MartketplaceServiceImpl implements MarketplaceService {

	@Autowired
	private LocationService locationService;

	@Autowired
	private MarketplaceDao marketplaceDao;

	@Autowired
	private StorageService storageService;

	@Override
	public Marketplace fetchMarketplaceFromRequest(MarketplaceRequest request) {

		Marketplace marketplace = new Marketplace();

//		title
		String title = Optional.ofNullable(request.getTitle()).orElse("").trim();
		Assert.isTrue(!title.isEmpty(), "Marketplace title is required!");
		marketplace.setTitle(title);

//		location
		String placeid = Optional.ofNullable(request.getPlaceid()).orElse("").trim();
		String address = Optional.ofNullable(request.getAddress()).orElse("").trim();
		Assert.isTrue(!placeid.isEmpty() && !address.isEmpty(), "Marketplace location is required!");
		marketplace.setLocation(locationService.fetchLocationByPlaceidAndAddress(placeid, address));

//		cover pictures
		List<StorageRequest> pictureRequests = Optional.ofNullable(request.getPictures()).orElse(new ArrayList<>());
		Assert.isTrue(pictureRequests.size() > 0, "Marketplace picture is required!");
		List<Storage> pictures = storageService.fetchStoragesFromRequests(pictureRequests);
		Assert.isTrue(pictures.size() > 0, "Marketplace picture is required!");
		marketplace.setPictures(pictures);
		
//		contact information
		Map<String, String> contactInfo = Optional.ofNullable(request.getContactInfo()).orElse(new HashMap<>());
		Assert.isTrue(contactInfo.size() > 0, "Job contact information is required!");
		marketplace.setContactInfo(contactInfo);

//		description
		String description = Optional.ofNullable(request.getDescription()).orElse(null);
		if (description != null) {
			marketplace.setDescription(description.trim());
		}
		
//		cost
		Double cost = Optional.ofNullable(request.getCost()).orElse(null);
		if (cost != null) {
			marketplace.setCost(cost);
		}
		
//		condition
		String condition = Optional.ofNullable(request.getCondition()).orElse(null);
		if (condition != null) {
			marketplace.setCondition(condition.trim());
		}

//		category
		String category = Optional.ofNullable(request.getCategory()).orElse(null);
		if (category != null) {
			marketplace.setCategory(category.trim());
		}

//		expiration Date
		Date expiredOn = Optional.ofNullable(request.getExpiredOn()).orElse(null);
		if (expiredOn != null) {
			marketplace.setExpiredOn(expiredOn);
		}

//		marketplace status
		marketplace.setStatus(PostStatus.AVAILABLE);

		return marketplace;
	}

	@Override
	public Marketplace createMarketplace(MarketplaceRequest request) {
		return saveMarketplace(fetchMarketplaceFromRequest(request));
	}

	@Override
	public Marketplace saveMarketplace(Marketplace marketplace) {
		return marketplaceDao.saveMarketplace(marketplace);
	}

	@Override
	public Marketplace fetchMarketplaceFromUpdateRequest(Marketplace marketplace, MarketplaceRequest request) {

//		title
		String title = Optional.ofNullable(request.getTitle()).orElse(null);
		if (title != null) {
			marketplace.setTitle(title.trim());
		}
		Assert.isTrue(!marketplace.getTitle().isEmpty(), "Marketplace title is required!");

//		location
		String placeid = Optional.ofNullable(request.getPlaceid()).orElse(null);
		String address = Optional.ofNullable(request.getAddress()).orElse(null);
		Assert.isTrue(address != null ? placeid != null ? true : false : placeid == null ? true : false,
				"Invalid Location");
		if (placeid != null && address != null) {
			Assert.isTrue(!placeid.trim().isEmpty() && !address.trim().isEmpty(), "Marketplace location is required!");
			marketplace.setLocation(locationService.fetchLocationByPlaceidAndAddress(placeid.trim(), address.trim()));
		}

//		new cover pictures
		List<StorageRequest> pictureRequests = Optional.ofNullable(request.getPictures()).orElse(null);
		List<Storage> pictures = storageService.fetchStoragesFromRequests(pictureRequests);
		if (pictures != null) {
			marketplace.setPictures(pictures);
		}
		Assert.isTrue(marketplace.getPictures().size() > 0, "Marketplace picture is required!");
		
//		contact information
		Map<String, String> contactInfo = Optional.ofNullable(request.getContactInfo()).orElse(null);
		if (contactInfo != null && contactInfo.size() > 0) {
			marketplace.setContactInfo(contactInfo);
		}

//		description
		String description = Optional.ofNullable(request.getDescription()).orElse(null);
		if (description != null) {
			marketplace.setDescription(description.trim());
		}
		
//		cost
		Double cost = Optional.ofNullable(request.getCost()).orElse(null);
		if (cost != null) {
			marketplace.setCost(cost);
		}
		
//		condition
		String condition = Optional.ofNullable(request.getCondition()).orElse(null);
		if (condition != null) {
			marketplace.setCondition(condition.trim());
		}

//		category
		String category = Optional.ofNullable(request.getCategory()).orElse(null);
		if (category != null) {
			marketplace.setCategory(category.trim());
		}

//		expiration Date
		Date expiredOn = Optional.ofNullable(request.getExpiredOn()).orElse(null);
		if (expiredOn != null) {
			marketplace.setExpiredOn(expiredOn);
		}

//		marketplace status
		PostStatus status = Optional.ofNullable(request.getStatus()).orElse(null);
		if (status != null) {
			Assert.isTrue(status == PostStatus.AVAILABLE || status == PostStatus.PRIVATE, "Invalid Post Status");
			marketplace.setStatus(status);
		}

		return marketplace;
	}

	@Override
	public void removeMarketplace(Marketplace marketplace) {
		marketplace.setStatus(PostStatus.DELETED);
		saveMarketplace(marketplace);
	}

	@Override
	public void updateMarketplace(Marketplace marketplace, MarketplaceRequest request) {
		marketplace = fetchMarketplaceFromUpdateRequest(marketplace, request);
		saveMarketplace(marketplace);
	}

	@Override
	public void disableMarketplace(Marketplace marketplace) {
		marketplace.setStatus(PostStatus.DISABLED);
		saveMarketplace(marketplace);
	}

	@Override
	public void activateMarketplace(Marketplace marketplace) {
		marketplace.setStatus(PostStatus.PRIVATE);
		saveMarketplace(marketplace);
	}

}
