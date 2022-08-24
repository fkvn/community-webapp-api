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

import mono.thainow.dao.HousingDao;
import mono.thainow.domain.post.PostStatus;
import mono.thainow.domain.post.housing.Housing;
import mono.thainow.domain.storage.Storage;
import mono.thainow.rest.request.HousingRequest;
import mono.thainow.rest.request.StorageRequest;
import mono.thainow.service.HousingService;
import mono.thainow.service.LocationService;
import mono.thainow.service.StorageService;

@Service
public class HousingServiceImpl implements HousingService {

	@Autowired
	private LocationService locationService;

	@Autowired
	private HousingDao housingDao;

	@Autowired
	private StorageService storageService;

	@Override
	public Housing getHousingFromRequest(HousingRequest request) {

		Housing housing = new Housing();

//		title
		String title = Optional.ofNullable(request.getTitle()).orElse("");
		Assert.isTrue(!title.isEmpty(), "Housing title is required!");
		housing.setTitle(title);

//		location
		String placeid = Optional.ofNullable(request.getPlaceid()).orElse("");
		String address = Optional.ofNullable(request.getAddress()).orElse("");
		Assert.isTrue(!placeid.isEmpty() && !address.isEmpty(), "Housing location is required!");
		housing.setLocation(locationService.getLocationFromPlaceidAndAddress(placeid, address));

//		cover pictures
		List<StorageRequest> pictureRequests = Optional.ofNullable(request.getPictures()).orElse(new ArrayList<>());
		Assert.isTrue(pictureRequests.size() > 0, "Housing picture is required!");
		List<Storage> pictures = storageService.getStoragesFromStorageRequests(pictureRequests);
		Assert.isTrue(pictures.size() > 0, "Housing picture is required!");
		housing.setPictures(pictures);
		
//		contact information
		Map<String, String> contactInfo = Optional.ofNullable(request.getContactInfo()).orElse(new HashMap<>());
		Assert.isTrue(contactInfo.size() > 0, "Housing contact information is required!");
		housing.setContactInfo(contactInfo);
		
//		interior information
		Map<String, String> interior = Optional.ofNullable(request.getInterior()).orElse(null);
		if (interior !=null && interior.size() > 0) {
			housing.setContactInfo(contactInfo);
		}
		
//		amenities
		List<String> amenities = Optional.ofNullable(request.getAmenities()).orElse(null);
		if (amenities != null && amenities.size() > 0) {
			housing.setAmenities(amenities);
		}
		
//		type
		String type = Optional.ofNullable(request.getType()).orElse(null);
		if (type != null) {
			housing.setType(type);
		}
		
//		cost
		String cost = Optional.ofNullable(request.getCost()).orElse(null);
		if (cost != null) {
			housing.setCost(cost);
		}
		
//		description
		String description = Optional.ofNullable(request.getDescription()).orElse(null);
		if (description != null) {
			housing.setDescription(description);
		}

//		category
		String category = Optional.ofNullable(request.getCategory()).orElse(null);
		if (category != null) {
			housing.setCategory(category);
		}

//		expiration Date
		Date expiredOn = Optional.ofNullable(request.getExpiredOn()).orElse(null);
		if (expiredOn != null) {
			housing.setExpiredOn(expiredOn);
		}

//		housing status
		housing.setStatus(PostStatus.AVAILABLE);

		return housing;
	}

	@Override
	public Housing createHousing(HousingRequest request) {
		return saveHousing(getHousingFromRequest(request));
	}

	@Override
	public Housing saveHousing(Housing housing) {
		return housingDao.saveHousing(housing);
	}

	@Override
	public Housing getHousingFromUpdateRequest(Housing housing, HousingRequest request) {

//		title
		String title = Optional.ofNullable(request.getTitle()).orElse(null);
		if (title != null) {
			housing.setTitle(title);
		}
		Assert.isTrue(!housing.getTitle().isEmpty(), "Housing title is required!");

//		location
		String placeid = Optional.ofNullable(request.getPlaceid()).orElse(null);
		String address = Optional.ofNullable(request.getAddress()).orElse(null);
		Assert.isTrue(address != null ? placeid != null ? true : false : placeid == null ? true : false,
				"Invalid Location");
		if (placeid != null && address != null) {
			Assert.isTrue(!placeid.isEmpty() && !address.isEmpty(), "Housing location is required!");
			housing.setLocation(locationService.getLocationFromPlaceidAndAddress(placeid, address));
		}

//		new cover pictures
		List<StorageRequest> pictureRequests = Optional.ofNullable(request.getPictures()).orElse(null);
		List<Storage> pictures = storageService.getStoragesFromStorageRequests(pictureRequests);
		if (pictures != null) {
			housing.setPictures(pictures);
		}
		Assert.isTrue(housing.getPictures().size() > 0, "Housing picture is required!");
		
//		contact information
		Map<String, String> contactInfo = Optional.ofNullable(request.getContactInfo()).orElse(null);
		if (contactInfo != null && contactInfo.size() > 0) {
			housing.setContactInfo(contactInfo);
		}

//		amenities
		List<String> amenities = Optional.ofNullable(request.getAmenities()).orElse(null);
		if (amenities != null && amenities.size() > 0) {
			housing.setAmenities(amenities);
		}

//		type
		String type = Optional.ofNullable(request.getType()).orElse(null);
		if (type != null) {
			housing.setType(type);
		}

//		cost
		String cost = Optional.ofNullable(request.getCost()).orElse(null);
		if (cost != null) {
			housing.setCost(cost);
		}

//		description
		String description = Optional.ofNullable(request.getDescription()).orElse(null);
		if (description != null) {
			housing.setDescription(description);
		}

//		category
		String category = Optional.ofNullable(request.getCategory()).orElse(null);
		if (category != null) {
			housing.setCategory(category);
		}

//		expiration Date
		Date expiredOn = Optional.ofNullable(request.getExpiredOn()).orElse(null);
		if (expiredOn != null) {
			housing.setExpiredOn(expiredOn);
		}

//		housing status
		PostStatus status = Optional.ofNullable(request.getStatus()).orElse(null);
		if (status != null) {
			Assert.isTrue(status == PostStatus.AVAILABLE || status == PostStatus.PRIVATE, "Invalid Post Status");
			housing.setStatus(status);
		}

		return housing;
	}

	@Override
	public void remove(Housing housing) {
		housing.setStatus(PostStatus.DELETED);
		saveHousing(housing);
	}

}
