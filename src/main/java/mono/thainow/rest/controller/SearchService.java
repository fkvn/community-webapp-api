package mono.thainow.rest.controller;

import java.util.List;

import mono.thainow.domain.company.Company;
import mono.thainow.domain.location.Location;

public interface SearchService {

	List<Company> searchCompany(String keywords, int limit, int page, Location center);

}
