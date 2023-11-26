package mono.thainow.service.impl;

import com.google.i18n.phonenumbers.NumberParseException;
import com.google.i18n.phonenumbers.PhoneNumberUtil;
import com.google.i18n.phonenumbers.Phonenumber;
import mono.thainow.domain.user.User;
import mono.thainow.domain.user.UserStatus;
import mono.thainow.exception.BadRequest;
import mono.thainow.repository.UserRepository;
import mono.thainow.service.PhoneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

@Service
public class PhoneServiceImpl implements PhoneService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public Boolean isPhoneRegionValid(String region) {
        return region.length() == 2;
    }

    @Override
    public Boolean isPhoneValid(String phone, String region) {

        Assert.isTrue(!phone.isBlank(), "Invalid Phone!");

        Assert.isTrue(region.length() == 2, "Invalid Region Code");

        PhoneNumberUtil numberUtil = PhoneNumberUtil.getInstance();

        Phonenumber.PhoneNumber phoneNumber;

        try {
            phoneNumber = numberUtil.parse(phone, region.toUpperCase());
            return numberUtil.isValidNumber(phoneNumber);

        } catch (NumberParseException e) {
            //noinspection CallToPrintStackTrace
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public void validatePhone(String phone, String region) {
        Boolean isPhoneValid = isPhoneValid(phone, region);
        if (!isPhoneValid) {
            throw new BadRequest("Invalid Phone");
        }
    }

    @Override
    public String getValidatedPhoneNumberWithRegionCode(String phone, String region) {

        Boolean isPhoneValid = isPhoneValid(phone, region);
        if (!isPhoneValid) {
            throw new BadRequest("Invalid Phone");
        }

        PhoneNumberUtil numberUtil = PhoneNumberUtil.getInstance();

        return String.format("+%d%s", numberUtil.getCountryCodeForRegion(region), phone);
    }

    @Override
    public Boolean isPhoneExisting(String phone, String region) {
        validatePhone(phone, region);
        User user = userRepository.findByPhoneAndPhoneRegionAndStatusNot(phone, region, UserStatus.DELETED).orElse(null);
        return user != null;
    }


}
