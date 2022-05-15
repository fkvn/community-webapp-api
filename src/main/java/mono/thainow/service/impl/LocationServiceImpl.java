package mono.thainow.service.impl;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import com.google.maps.model.AddressComponent;
import com.google.maps.model.GeocodingResult;

import mono.thainow.dao.LocationDao;
import mono.thainow.domain.google.GoogleGeoAPI;
import mono.thainow.domain.location.Location;
import mono.thainow.domain.user.User;
import mono.thainow.rest.request.PostRequest;
import mono.thainow.security.payload.request.SignUpRequest;
import mono.thainow.service.LocationService;

@Service
public class LocationServiceImpl implements LocationService {

	@Autowired
	LocationDao locationDao;

	@Override
	public List<User> findUsersOfLocation(Location location) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Location validateIfLocationExist(Location location) {

//		check if location is in the database
		Location dbLocation = locationDao.getLocationByPlaceid(location.getPlaceid());

//		new location
		if (dbLocation == null) {
//			save location to database to persist
			location = locationDao.saveLocation(location);
		} else {
			location = dbLocation;
		}

		return location;
	}

	@Override
	public Location getLocationFromSignUpRequest(SignUpRequest signUpRequest) {

		String address = Optional.ofNullable(signUpRequest.getAddress()).orElse("").trim();
//		
		Assert.isTrue(!address.isEmpty(), "Invalid Address!");

//		get location
		Location location = getLocationByAddress(address);
		
		return location;
	}

	@Override
	public Location getLocationFromPostRequest(PostRequest postRequest) {

//		get location
		Location location = Optional.ofNullable(postRequest.getLocation()).orElse(new Location());

		Assert.isTrue(location != null, "Location cannot be null");

//		validate location
		location = validateIfLocationExist(location);

		return location;
	}

	@Override
	public Location getLocationByAddress(String address) {

//		check if location is in the database
		Location location = locationDao.getLocationByFormattedAddress(address);
		
		System.out.println(location == null);

//		new location
		if (location == null) {
			
//			initialize google geocoding Api
			GoogleGeoAPI geoCode = new GoogleGeoAPI();
			
//			calling the api to get the gecode result
			GeocodingResult geoResult = geoCode.getLocationResultFromAddress(address);
			
//			extract information
			location = getLocationFromGeocodingResult(geoResult);
			
//			double check one more time if the placeId is existed
			Location ifExistedLocation = locationDao.getLocationByPlaceid(location.getPlaceid());
			
//			if exist, don't add / persist new 
			if (ifExistedLocation != null) {
				location = ifExistedLocation;
			}
//			persist into the database
			else {
				location = locationDao.saveLocation(location);
			}
			
		}

		return location;
	}

	@Override
	public Location getLocationFromGeocodingResult(GeocodingResult geoResult) {

		Location location = new Location();

//		placeid
		location.setPlaceid(geoResult.placeId);

//		formattedAddress
		location.setFormattedAddress(geoResult.formattedAddress);

//		lat
		location.setLat(String.valueOf(geoResult.geometry.location.lat));

//		lng
		location.setLng(String.valueOf(geoResult.geometry.location.lng));

//		location type
		location.setType(geoResult.geometry.locationType.toString());
		
//		location address component
		location = updateLocationFromAddressComponent(location, geoResult.addressComponents);

		return location;
	}

	@Override
	public Location updateLocationFromAddressComponent(Location location, AddressComponent[] addressComponents) {

//		address components
		Arrays.asList(addressComponents).stream().forEach(field -> {
			
			switch (String.valueOf(field.types[0]).toUpperCase()) {

			case "STREET_NUMBER":
				location.setAddress1(field.longName + " ");
				break;
			case "ROUTE":
				location.setAddress1(location.getAddress1() + field.longName);
				break;
			case "SUBPREMISE":
				location.setAddress2(field.longName);
				break;
			case "NEIGHBORHOOD":
				location.setNeighberhood(field.longName);
				break;
			case "LOCALITY":
				location.setLocality(field.longName);
				break;
			case "ADMINISTRATIVE_AREA_LEVEL_2":
				location.setCounty(field.longName);
				break;
			case "ADMINISTRATIVE_AREA_LEVEL_1":
				location.setState(field.shortName);
				break;
			case "COUNTRY":
				location.setCountry(field.shortName);
				break;
			case "POSTAL_CODE":
				location.setZipcode(field.longName);
				break;
			default:
				break;
			}
		});

		return location;
	}

}
