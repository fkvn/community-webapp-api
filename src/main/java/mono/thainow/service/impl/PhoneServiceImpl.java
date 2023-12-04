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

import static org.apache.commons.lang3.StringUtils.isBlank;

@Service
public class PhoneServiceImpl implements PhoneService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public Boolean isPhoneExisting(String phone, String region) {
        validatePhone(phone, region);
        User user = userRepository.findByPhoneAndPhoneRegionAndStatusNot(phone, region,
                UserStatus.DELETED).orElse(null);
        return user != null;
    }

    @Override
    public Boolean isPhoneRegionValid(String region) {
        return region.length() == 2;
    }

    @Override
    public Boolean isPhoneValid(String phone, String region) {

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

        if (isBlank(phone)) throw new BadRequest("Phone can't be empty!");
        if (isBlank(region) || region.length() != 2) throw new BadRequest(
                "Region Code is either " + "empty or not having exactly 2 characters");

        Boolean isPhoneValid = isPhoneValid(phone, region);
        if (!isPhoneValid) {
            throw new BadRequest("Invalid Phone and Region Code!");
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


}
