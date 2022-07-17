package mono.thainow.domain.storage;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

import lombok.Getter;

@Component
@Getter
public class StorageDefault {

	private Map<String, Long> industryLogoUrl = new HashMap<>();

	private String[] industryDefault = { "Aquarium & Pet", "Attorney", "Auto Service", "Bank", "Bar", "Bodyshop",
			"Book Store", "Bookkeeping", "Boxing", "Car Dealer", "Car Towing", "Chiropractic", "Clothing",
			"Community Service", "Construction", "Consulate", "Consultant", "Cosmetic", "Customer Service",
			"Credit Card Services", "Dance", "Dentist", "Doctor Clinic", "Drink and Dessert", "DVD, CD, Games",
			"Education", "Elderly Care", "Embassy", "Factory", "Flower", "Fusion Restaurant", "Gift Shop", "Hair Salon",
			"Handyman", "Insurance", "Information Technology", "Japanese Restaurant", "Jewelry and Watch", "Market",
			"Mobile", "Money Transfer", "Nail", "Newspaper", "Notary Public", "Optical", "Painter", "Personal Trainer",
			"Printing", "Real Estate", "School", "Shipping", "Tailor", "Tax", "Taxi", "Television", "Thai Church",
			"Thai Massage", "Thai Restaurant", "Thai Temple", "Trader", "Travel Agency", "Vegan Restaurant" };

//	must map and corresponding positon with the list of industry default
	private int[] profileDefault = { 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133,
			134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154,
			155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175,
			176, 177, 178, 179 };
	
	private Long otherIndustryProfileDefault = (long) 180;
	
	private Long userProfileDefault = (long) 181;

	public StorageDefault() {
		for (int i = 0; i < industryDefault.length; i++) {
			this.industryLogoUrl.put(industryDefault[i].toUpperCase().trim(), (long) profileDefault[i]);
		}
	}

}
