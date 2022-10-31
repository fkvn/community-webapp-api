package mono.thainow.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.TreeMap;
import java.util.TreeSet;

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
	public Housing fetchHousingFromRequest(Housing housing, HousingRequest request) {

		if (housing == null) {
			housing = new Housing();
			housing.setStatus(PostStatus.AVAILABLE);
		}

//		title
		String title = Optional.ofNullable(request.getTitle()).orElse("").trim();
		Assert.isTrue(!title.isBlank(), "Invalid title!");
		housing.setTitle(title);

//		location
		String placeid = Optional.ofNullable(request.getPlaceid()).orElse("").trim();
		String address = Optional.ofNullable(request.getAddress()).orElse("").trim();
		Assert.isTrue(!address.isBlank(), "Invalid address");
		housing.setLocation(locationService.findLocationByPlaceidOrAddress(placeid, address));

//		cover pictures
		List<StorageRequest> pictureRequests = Optional.ofNullable(request.getPictures()).orElse(new ArrayList<>());
		List<Storage> pictures = storageService.fetchStoragesFromRequests(pictureRequests);
		Assert.isTrue(pictures.size() > 0, "Require at least 1 picture!");
		housing.setPictures(pictures);

//		contact information
		Map<String, String> contactInfo = Optional.ofNullable(request.getContactInfo())
				.orElse(new TreeMap<>(String.CASE_INSENSITIVE_ORDER));
		Assert.isTrue(contactInfo.size() > 0, "Require at least 1 contact information!");
		housing.setContactInfo(contactInfo);

//		interior information
		TreeMap<String, Integer> interior = Optional.ofNullable(request.getInterior())
				.orElse(new TreeMap<>(String.CASE_INSENSITIVE_ORDER));
		housing.setInterior(interior);

//		amenities
		TreeSet<String> amenities = Optional.ofNullable(request.getAmenities())
				.orElse(new TreeSet<>(String.CASE_INSENSITIVE_ORDER));
		housing.setAmenities(amenities);

//		type
		String type = Optional.ofNullable(request.getType()).orElse("").trim();
		housing.setType(type);

//		daily cost
		Double dailyCost = Optional.ofNullable(request.getDailyCost()).orElse(null);
		housing.setDailyCost(dailyCost);

//		monthly cost
		Double monthlyCost = Optional.ofNullable(request.getMonthlyCost()).orElse(null);
		housing.setMonthlyCost(monthlyCost);

//		annual cost
		Double annualCost = Optional.ofNullable(request.getAnnualCost()).orElse(null);
		housing.setAnnualCost(annualCost);

//		deposit cost
		Double depositCost = Optional.ofNullable(request.getDepositCost()).orElse(null);
		housing.setDepositCost(depositCost);

//		description
		String description = Optional.ofNullable(request.getDescription()).orElse("").trim();
		housing.setDescription(description.trim());

//		category
		String category = Optional.ofNullable(request.getCategory()).orElse("").trim();
		housing.setCategory(category);

//		expiration Date
		Date expiredOn = Optional.ofNullable(request.getExpiredOn()).orElse(null);
		housing.setExpiredOn(expiredOn);

//		status
		PostStatus status = Optional.ofNullable(request.getStatus()).orElse(housing.getStatus());
		Assert.isTrue(status == PostStatus.AVAILABLE || status == PostStatus.PRIVATE, "Invalid Status");
		housing.setStatus(status);

		return housing;
	}

	@Override
	public Housing createHousing(HousingRequest request) {
		return saveHousing(fetchHousingFromRequest(null, request));
	}

	@Override
	public Housing saveHousing(Housing housing) {
		return housingDao.saveHousing(housing);
	}

//	@Override
//	public Housing fetchHousingFromUpdateRequest(Housing housing, HousingRequest request) {
//
////		title
//		String title = Optional.ofNullable(request.getTitle()).orElse(null);
//		if (title != null) {
//			Assert.isTrue(!title.isBlank(), "Invalid Title");
//			housing.setTitle(title.trim());
//		}
//
////		location
//		String placeid = Optional.ofNullable(request.getPlaceid()).orElse(null);
//		String address = Optional.ofNullable(request.getAddress()).orElse(null);
//		if (address != null) {
//			Assert.isTrue(!address.isBlank(), "Invalid Location!");
//			housing.setLocation(locationService.findLocationByPlaceidOrAddress(placeid, address));
//		}
//
////		new cover pictures
//		List<StorageRequest> pictureRequests = Optional.ofNullable(request.getPictures()).orElse(null);
//		List<Storage> pictures = storageService.fetchStoragesFromRequests(pictureRequests);
//		if (pictures != null) {
//			Assert.isTrue(pictures.size() > 0, "Require at least 1 picture!");
//			housing.setPictures(pictures);
//		}
//
////		contact information
//		TreeMap<String, String> contactInfo = Optional.ofNullable(request.getContactInfo()).orElse(null);
//		if (contactInfo != null) {
//			Assert.isTrue(contactInfo.size() > 0, "Require at least 1 contact information!");
//			housing.setContactInfo(contactInfo);
//		}
//
////		interior information
//		TreeMap<String, Integer> interior = Optional.ofNullable(request.getInterior()).orElse(null);
//		housing.setInterior(interior != null ? interior : new TreeMap<>(String.CASE_INSENSITIVE_ORDER));
//
////		amenities
//		TreeSet<String> amenities = Optional.ofNullable(request.getAmenities()).orElse(null);
//		housing.setAmenities(amenities != null ? amenities : new TreeSet<>(String.CASE_INSENSITIVE_ORDER));
//
////		type
//		String type = Optional.ofNullable(request.getType()).orElse(null);
//		if (type != null) {
//			housing.setType(type.trim());
//		}
//
////		daily cost
//		Double dailyCost = Optional.ofNullable(request.getDailyCost()).orElse(null);
//		if (dailyCost != null) {
//			if (dailyCost < 0) {
//				housing.setDailyCost(null);
//			} else {
//				housing.setDailyCost(dailyCost);
//			}
//		}
//
////		monthly cost
//		Double monthlyCost = Optional.ofNullable(request.getMonthlyCost()).orElse(null);
//		if (monthlyCost != null) {
//			if (monthlyCost < 0) {
//				housing.setMonthlyCost(null);
//			} else {
//				housing.setMonthlyCost(monthlyCost);
//			}
//		}
//
////		annual cost
//		Double annualCost = Optional.ofNullable(request.getAnnualCost()).orElse(null);
//		if (annualCost != null) {
//			if (annualCost < 0) {
//				housing.setAnnualCost(null);
//			} else {
//				housing.setAnnualCost(annualCost);
//			}
//		}
//
////		deposit cost
//		Double depositCost = Optional.ofNullable(request.getDepositCost()).orElse(null);
//		if (depositCost != null) {
//			if (depositCost < 0) {
//				housing.setDepositCost(null);
//			} else {
//				housing.setDepositCost(depositCost);
//			}
//		}
//
////		description
//		String description = Optional.ofNullable(request.getDescription()).orElse(null);
//		if (description != null) {
//			housing.setDescription(description.trim());
//		}
//
////		category
//		String category = Optional.ofNullable(request.getCategory()).orElse(null);
//		if (category != null) {
//			housing.setCategory(category.trim());
//		}
//
////		expiration Date
//		Date expiredOn = Optional.ofNullable(request.getExpiredOn()).orElse(null);
//		housing.setExpiredOn(expiredOn);
//
////		housing status
//		PostStatus status = Optional.ofNullable(request.getStatus()).orElse(null);
//		if (status != null) {
//			Assert.isTrue(status == PostStatus.AVAILABLE || status == PostStatus.PRIVATE, "Invalid Status");
//			housing.setStatus(status);
//		}
//
//		return housing;
//	}

	@Override
	public void removeHousing(Housing housing) {
		housing.setStatus(PostStatus.REMOVED);
		saveHousing(housing);
	}

	@Override
	public void updateHousing(Housing housing, HousingRequest request) {
		saveHousing(fetchHousingFromRequest(housing, request));
	}

	@Override
	public void disableHousing(Housing housing) {
		housing.setStatus(PostStatus.DISABLED);
		saveHousing(housing);
	}

	@Override
	public void activateHousing(Housing housing) {
		housing.setStatus(PostStatus.PRIVATE);
		saveHousing(housing);
	}

}
