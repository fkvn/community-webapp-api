//package mono.thainow.util;
//
//import com.google.i18n.phonenumbers.NumberParseException;
//import com.google.i18n.phonenumbers.PhoneNumberUtil;
//import com.google.i18n.phonenumbers.Phonenumber.PhoneNumber;
//import mono.thainow.exception.BadRequest;
//import org.springframework.util.Assert;
//
//public class PhoneUtil {
//
//    private static void validatePhoneNumberWithGoogleAPI(String[] phoneNumbers,
//                                                         String region) {
//
////		validate region
//        Assert.isTrue(region.length() == 2,
//                "Region must has exactly 2 characters");
//
//        PhoneNumberUtil numberUtil = PhoneNumberUtil.getInstance();
//
//        for (String number : phoneNumbers) {
//
//            PhoneNumber phoneNumber;
//
//            try {
//                phoneNumber = numberUtil.parse(number, region.toUpperCase());
//                Assert.isTrue(numberUtil.isValidNumber(phoneNumber),
//                        "Phone Number " + phoneNumber + " is invalid!");
//
//            } catch (NumberParseException e) {
//                e.printStackTrace();
//            }
//        }
//
//    }
//
//    private static String getPhoneNumberWithRegionCode(String phone,
//                                                       String region) {
//
//        Assert.isTrue(!phone.isBlank(), "Invalid Phone!");
//
//        Assert.isTrue(region.length() == 2, "Invalid Region Code");
//
//        PhoneNumberUtil numberUtil = PhoneNumberUtil.getInstance();
//
//        PhoneNumber phoneNumber = null;
//
//        try {
//            phoneNumber = numberUtil.parse(phone, region.toUpperCase());
//            Assert.isTrue(numberUtil.isValidNumber(phoneNumber), "Phone Number " + phoneNumber
//            + " is invalid!");
//
//        } catch (NumberParseException e) {
//            //noinspection CallToPrintStackTrace
//            e.printStackTrace();
//            throw new BadRequest("Invalid Phone!");
//        }
//
//        return String.format("+%d%s", phoneNumber.getCountryCode(), phoneNumber
//        .getNationalNumber());
//    }
//
//    private static void validatePhoneNumberWithGoogleAPI(String phone,
//                                                         String region) {
//
////		validate region
//        Assert.isTrue(region.length() == 2, "Invalid Region Code");
//
//        Assert.isTrue(!phone.isBlank(), "Phone can't be empty");
//
//        PhoneNumberUtil numberUtil = PhoneNumberUtil.getInstance();
//
//        PhoneNumber phoneNumber;
//
//        try {
//            phoneNumber = numberUtil.parse(phone, region.toUpperCase());
//            Assert.isTrue(numberUtil.isValidNumber(phoneNumber),
//                    "Phone Number " + phoneNumber + " is invalid!");
//
//        } catch (NumberParseException e) {
//            //noinspection CallToPrintStackTrace
//            e.printStackTrace();
//        }
//
//    }
//}
