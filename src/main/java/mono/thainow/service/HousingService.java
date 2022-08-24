package mono.thainow.service;

import mono.thainow.domain.post.housing.Housing;
import mono.thainow.rest.request.HousingRequest;

public interface HousingService {

	Housing getHousingFromRequest(HousingRequest request);

	Housing createHousing(HousingRequest request);
	
	Housing saveHousing(Housing housing);

	Housing getHousingFromUpdateRequest(Housing housing, HousingRequest request);

	void remove(Housing housing);
}
