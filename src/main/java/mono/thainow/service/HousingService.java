package mono.thainow.service;

import mono.thainow.domain.post.housing.Housing;
import mono.thainow.rest.request.HousingRequest;

public interface HousingService {

	Housing fetchHousingFromRequest(HousingRequest request);

	Housing createHousing(HousingRequest request);
	
	Housing saveHousing(Housing housing);

	Housing fetchHousingFromUpdateRequest(Housing housing, HousingRequest request);

	void removeHousing(Housing housing);

	void updateHousing(Housing housing, HousingRequest request);

	void disableHousing(Housing housing);

	void activateHousing(Housing housing);
}
