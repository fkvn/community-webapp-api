package mono.thainow.service.impl;

import mono.thainow.dao.MarketplaceDao;
import mono.thainow.domain.post.PostStatus;
import mono.thainow.domain.post.marketplace.Marketplace;
import mono.thainow.domain.storage.Storage;
import mono.thainow.rest.request.MarketplaceRequest;
import mono.thainow.rest.request.StorageRequest;
import mono.thainow.service.LocationService;
import mono.thainow.service.MarketplaceService;
import mono.thainow.service.StorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import java.time.LocalDateTime;
import java.util.*;

@Service
public class MartketplaceServiceImpl implements MarketplaceService {

    @Autowired
    private LocationService locationService;

    @Autowired
    private MarketplaceDao marketplaceDao;

    @Autowired
    private StorageService storageService;

    @Override
    public Marketplace fetchMarketplaceFromRequest(Marketplace marketplace, MarketplaceRequest request) {

        if (marketplace == null) {
            marketplace = new Marketplace();
            marketplace.setStatus(PostStatus.AVAILABLE);
        }

//		title
        String title = Optional.ofNullable(request.getTitle()).orElse("").trim();
        Assert.isTrue(!title.isBlank(), "Invalid title!");
        marketplace.setTitle(title);

//		location
        String placeid = Optional.ofNullable(request.getPlaceid()).orElse("").trim();
        String address = Optional.ofNullable(request.getAddress()).orElse("").trim();
        Assert.isTrue(!address.isBlank(), "Invalid address");
        marketplace.setLocation(locationService.findLocationByPlaceidOrAddress(placeid, address));

//		cover pictures
        List<StorageRequest> pictureRequests = Optional.ofNullable(request.getPictures()).orElse(new ArrayList<>());
        List<Storage> pictures = storageService.fetchStoragesFromRequests(pictureRequests);
        Assert.isTrue(pictures.size() > 0, "Require at least 1 picture!");
        marketplace.setPictures(pictures);

//		contact information
        Map<String, String> contactInfo = Optional.ofNullable(request.getContactInfo())
                .orElse(new TreeMap<>(String.CASE_INSENSITIVE_ORDER));
        Assert.isTrue(contactInfo.size() > 0, "Require at least 1 contact information!");
        marketplace.setContactInfo(contactInfo);

//		description
        String description = Optional.ofNullable(request.getDescription()).orElse("").trim();
        marketplace.setDescription(description.trim());

//		cost
        Double cost = Optional.ofNullable(request.getCost()).orElse(null);
        marketplace.setCost(cost);

//		condition
        String condition = Optional.ofNullable(request.getCondition()).orElse("").trim();
        marketplace.setCondition(condition);

//		category
        String category = Optional.ofNullable(request.getCategory()).orElse("").trim();
        marketplace.setCategory(category);

//		expiration Date
        LocalDateTime expiredOn = Optional.ofNullable(request.getExpiredOn()).orElse(null);
        marketplace.setExpiredOn(expiredOn);

//		status
        PostStatus status = Optional.ofNullable(request.getStatus()).orElse(marketplace.getStatus());
        Assert.isTrue(status == PostStatus.AVAILABLE || status == PostStatus.PRIVATE, "Invalid Status");
        marketplace.setStatus(status);

        return marketplace;
    }


    @Override
    public Marketplace createMarketplace(MarketplaceRequest request) {
        return saveMarketplace(fetchMarketplaceFromRequest(null, request));
    }

    @Override
    public Marketplace saveMarketplace(Marketplace marketplace) {
        return marketplaceDao.saveMarketplace(marketplace);
    }

//	@Override
//	public Marketplace fetchMarketplaceFromUpdateRequest(Marketplace marketplace, MarketplaceRequest request) {
//
////		title
//		String title = Optional.ofNullable(request.getTitle()).orElse(null);
//		if (title != null) {
//			Assert.isTrue(!title.isBlank(), "Invalid Title");
//			marketplace.setTitle(title.trim());
//		}
//
////		location
//		String placeid = Optional.ofNullable(request.getPlaceid()).orElse(null);
//		String address = Optional.ofNullable(request.getAddress()).orElse(null);
//		if (address != null) {
//			Assert.isTrue(!address.isBlank(), "Invalid Location!");
//			marketplace.setLocation(locationService.findLocationByPlaceidOrAddress(placeid, address));
//		}
//
////		new cover pictures
//		List<StorageRequest> pictureRequests = Optional.ofNullable(request.getPictures()).orElse(null);
//		List<Storage> pictures = storageService.fetchStoragesFromRequests(pictureRequests);
//		if (pictures != null) {
//			Assert.isTrue(pictures.size() > 0, "Require at least 1 picture!");
//			marketplace.setPictures(pictures);
//		}
//
////		contact information
//		Map<String, String> contactInfo = Optional.ofNullable(request.getContactInfo()).orElse(null);
//		if (contactInfo != null) {
//			Assert.isTrue(contactInfo.size() > 0, "Require at least 1 contact information!");
//			marketplace.setContactInfo(contactInfo);
//		}
//
////		description
//		String description = Optional.ofNullable(request.getDescription()).orElse(null);
//		if (description != null) {
//			marketplace.setDescription(description.trim());
//		}
//
////		cost
//		Double cost = Optional.ofNullable(request.getCost()).orElse(null);
//		if (cost != null) {
//			marketplace.setCost(cost);
//		}
//
////		condition
//		String condition = Optional.ofNullable(request.getCondition()).orElse(null);
//		if (condition != null) {
//			marketplace.setCondition(condition.trim());
//		}
//
////		category
//		String category = Optional.ofNullable(request.getCategory()).orElse(null);
//		if (category != null) {
//			marketplace.setCategory(category.trim());
//		}
//
////		expiration Date
//		Date expiredOn = Optional.ofNullable(request.getExpiredOn()).orElse(null);
//		if (expiredOn != null) {
//			marketplace.setExpiredOn(expiredOn);
//		}
//
////		marketplace status
//		PostStatus status = Optional.ofNullable(request.getStatus()).orElse(null);
//		if (status != null) {
//			Assert.isTrue(status == PostStatus.AVAILABLE || status == PostStatus.PRIVATE, "Invalid Status");
//			marketplace.setStatus(status);
//		}
//
//		return marketplace;
//	}

    @Override
    public void removeMarketplace(Marketplace marketplace) {
        marketplace.setStatus(PostStatus.REMOVED);
        saveMarketplace(marketplace);
    }

    @Override
    public void updateMarketplace(Marketplace marketplace, MarketplaceRequest request) {
        saveMarketplace(fetchMarketplaceFromRequest(marketplace, request));
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
