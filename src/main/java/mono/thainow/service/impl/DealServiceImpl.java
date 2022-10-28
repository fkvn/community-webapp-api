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
	public Deal fetchDealFromRequest(DealRequest request) {

		Deal deal = new Deal();

//		title
		String title = Optional.ofNullable(request.getTitle()).orElse("").trim();
		Assert.isTrue(!title.isBlank(), "Invalid title!");
		deal.setTitle(title);

//		location
		String placeid = Optional.ofNullable(request.getPlaceid()).orElse("").trim();
		String address = Optional.ofNullable(request.getAddress()).orElse("").trim();
		Assert.isTrue(!address.isBlank(), "Invalid address");
		deal.setLocation(locationService.findLocationByPlaceidOrAddress(placeid, address));

//		cover pictures
		List<StorageRequest> pictureRequests = Optional.ofNullable(request.getPictures()).orElse(new ArrayList<>());
		List<Storage> pictures = storageService.fetchStoragesFromRequests(pictureRequests);
		Assert.isTrue(pictures.size() > 0, "Require at least 1 picture!");
		deal.setPictures(pictures);

//		contact information
		Map<String, String> contactInfo = Optional.ofNullable(request.getContactInfo())
				.orElse(new TreeMap<>(String.CASE_INSENSITIVE_ORDER));
		Assert.isTrue(contactInfo.size() > 0, "Require at least 1 contact information!");
		deal.setContactInfo(contactInfo);

//		description
		String description = Optional.ofNullable(request.getDescription()).orElse(null);
		if (description != null) {
			deal.setDescription(description.trim());
		}

//		category
		String category = Optional.ofNullable(request.getCategory()).orElse(null);
		if (category != null) {
			deal.setCategory(category.trim());
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
		return saveDeal(fetchDealFromRequest(request));
	}

	@Override
	public Deal saveDeal(Deal deal) {
		return dealDao.saveDeal(deal);
	}

	@Override
	public Deal fetchDealFromUpdateRequest(Deal deal, DealRequest request) {

//		title
		String title = Optional.ofNullable(request.getTitle()).orElse(null);
		if (title != null) {
			Assert.isTrue(!deal.getTitle().isBlank(), "Invalid Title");
			deal.setTitle(title.trim());
		}
		
		

//		location
		String placeid = Optional.ofNullable(request.getPlaceid()).orElse(null);
		String address = Optional.ofNullable(request.getAddress()).orElse(null);
		if (address != null) {
			Assert.isTrue(!address.isBlank(), "Invalid Location!");
			deal.setLocation(locationService.findLocationByPlaceidOrAddress(placeid, address));
		}

//		new cover pictures
		List<StorageRequest> pictureRequests = Optional.ofNullable(request.getPictures()).orElse(null);
		List<Storage> pictures = storageService.fetchStoragesFromRequests(pictureRequests);
		if (pictures != null) {
			Assert.isTrue(pictures.size() > 0, "Require at least 1 picture!");
			deal.setPictures(pictures);
		}
		
//		contact information
		Map<String, String> contactInfo = Optional.ofNullable(request.getContactInfo()).orElse(null);
		if (contactInfo != null) {
			Assert.isTrue(contactInfo.size() > 0, "Require at least 1 contact information!");
			deal.setContactInfo(contactInfo);
		}

//		description
		String description = Optional.ofNullable(request.getDescription()).orElse(null);
		deal.setDescription(description !=null ?  description.trim() : null);

//		category
		String category = Optional.ofNullable(request.getCategory()).orElse(null);
		deal.setCategory(category != null ? category.trim() : null);

//		expiration Date
		Date expiredOn = Optional.ofNullable(request.getExpiredOn()).orElse(null);
		deal.setExpiredOn(expiredOn);

//		deal status
		PostStatus status = Optional.ofNullable(request.getStatus()).orElse(null);
		if (status != null) {
			Assert.isTrue(status == PostStatus.AVAILABLE || status == PostStatus.PRIVATE, "Invalid Status");
			deal.setStatus(status);
		}

		return deal;
	}

	@Override
	public void removeDeal(Deal deal) {
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
		fetchDealFromUpdateRequest(deal, request);
		saveDeal(deal);
	}

	@Override
	public void disableDeal(Deal deal) {
		deal.setStatus(PostStatus.DISABLED);
		saveDeal(deal);
	}

}
