package mono.thainow.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import mono.thainow.dao.DealDao;
import mono.thainow.domain.post.PostStatus;
import mono.thainow.domain.post.deal.Deal;
import mono.thainow.domain.storage.Storage;
import mono.thainow.rest.request.DealRequest;
import mono.thainow.rest.request.StorageRequest;
import mono.thainow.service.DealService;
import mono.thainow.service.LocationService;
import mono.thainow.service.StorageService;

@Service
public class DealServiceImpl implements DealService {

	@Autowired
	private LocationService locationService;

	@Autowired
	private DealDao dealDao;

	@Autowired
	private StorageService storageService;

	@Override
	public Deal getDealFromRequest(DealRequest request) {

		Deal deal = new Deal();

//		title
		String title = Optional.ofNullable(request.getTitle()).orElse("");
		Assert.isTrue(!title.isEmpty(), "Deal title is required!");
		deal.setTitle(title);

//		location
		String placeid = Optional.ofNullable(request.getPlaceid()).orElse("");
		String address = Optional.ofNullable(request.getAddress()).orElse("");
		Assert.isTrue(!placeid.isEmpty() && !address.isEmpty(), "Deal location is required!");
		deal.setLocation(locationService.getLocationFromPlaceidAndAddress(placeid, address));

//		cover pictures
		List<StorageRequest> pictureRequests = Optional.ofNullable(request.getPictures()).orElse(new ArrayList<>());
		Assert.isTrue(pictureRequests.size() > 0, "Deal picture is required!");
		List<Storage> pictures = storageService.getStoragesFromStorageRequests(pictureRequests);
		Assert.isTrue(pictures.size() > 0, "Deal picture is required!");
		deal.setPictures(pictures);

//		contact information
		Map<String, String> contactInfo = Optional.ofNullable(request.getContactInfo())
				.orElse(new TreeMap<>(String.CASE_INSENSITIVE_ORDER));
		Assert.isTrue(contactInfo.size() > 0, "Deal contact information is required!");
		deal.setContactInfo(contactInfo);

//		description
		String description = Optional.ofNullable(request.getDescription()).orElse(null);
		if (description != null) {
			deal.setDescription(description);
		}

//		category
		String category = Optional.ofNullable(request.getCategory()).orElse(null);
		if (category != null) {
			deal.setCategory(category);
		}

//		expiration Date
		Date expiredOn = Optional.ofNullable(request.getExpiredOn()).orElse(null);
		if (expiredOn != null) {
			deal.setExpiredOn(expiredOn);
		}

//		deal status
		deal.setStatus(PostStatus.AVAILABLE);

		return deal;
	}

	@Override
	public Deal createDeal(DealRequest request) {
		return saveDeal(getDealFromRequest(request));
	}

	@Override
	public Deal saveDeal(Deal deal) {
		return dealDao.saveDeal(deal);
	}

	@Override
	public Deal getDealFromUpdateRequest(Deal deal, DealRequest request) {

//		title
		String title = Optional.ofNullable(request.getTitle()).orElse(null);
		if (title != null) {
			deal.setTitle(title);
		}
		Assert.isTrue(!deal.getTitle().isEmpty(), "Deal title is required!");

//		location
		String placeid = Optional.ofNullable(request.getPlaceid()).orElse(null);
		String address = Optional.ofNullable(request.getAddress()).orElse(null);
		Assert.isTrue(address != null ? placeid != null ? true : false : placeid == null ? true : false,
				"Invalid Location");
		if (placeid != null && address != null) {
			Assert.isTrue(!placeid.isEmpty() && !address.isEmpty(), "Deal location is required!");
			deal.setLocation(locationService.getLocationFromPlaceidAndAddress(placeid, address));
		}

//		new cover pictures
		List<StorageRequest> pictureRequests = Optional.ofNullable(request.getPictures()).orElse(null);
		List<Storage> pictures = storageService.getStoragesFromStorageRequests(pictureRequests);
		if (pictures != null) {
			deal.setPictures(pictures);
		}
		Assert.isTrue(deal.getPictures().size() > 0, "Deal picture is required!");

//		contact information
		Map<String, String> contactInfo = Optional.ofNullable(request.getContactInfo()).orElse(null);
		if (contactInfo != null && contactInfo.size() > 0) {
			deal.setContactInfo(contactInfo);
		}

//		description
		String description = Optional.ofNullable(request.getDescription()).orElse(null);
		if (description != null) {
			deal.setDescription(description);
		}

//		category
		String category = Optional.ofNullable(request.getCategory()).orElse(null);
		if (category != null) {
			deal.setCategory(category);
		}

//		expiration Date
		Date expiredOn = Optional.ofNullable(request.getExpiredOn()).orElse(null);
		if (expiredOn != null) {
			deal.setExpiredOn(expiredOn);
		}

//		deal status
		PostStatus status = Optional.ofNullable(request.getStatus()).orElse(null);
		if (status != null) {
			Assert.isTrue(status == PostStatus.AVAILABLE || status == PostStatus.PRIVATE, "Invalid Post Status");
			deal.setStatus(status);
		}

		return deal;
	}

	@Override
	public void remove(Deal deal) {
		deal.setStatus(PostStatus.DELETED);
		saveDeal(deal);
	}

	@Override
	public void activateDeal(Deal deal) {
		deal.setStatus(PostStatus.PRIVATE);
		saveDeal(deal);
	}

	@Override
	public void updateDeal(Deal deal, DealRequest request) {
		getDealFromUpdateRequest(deal, request);
		saveDeal(deal);
	}

	@Override
	public void disableDeal(Deal deal) {
		deal.setStatus(PostStatus.DISABLED);
		saveDeal(deal);
	}

}
