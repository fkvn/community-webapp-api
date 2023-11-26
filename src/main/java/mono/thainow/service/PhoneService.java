package mono.thainow.service;

public interface PhoneService {

    Boolean isPhoneExisting(String phone, String region);

    Boolean isPhoneRegionValid(String region);

    Boolean isPhoneValid(String phone, String region);

    void validatePhone(String phone, String region);

    String getValidatedPhoneNumberWithRegionCode(String phone, String region);
}
