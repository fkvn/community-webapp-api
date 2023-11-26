package mono.thainow.util;

import mono.thainow.domain.location.Location;

public class LocationUtil {


    public static String getFormattedAddress(Location location) {

        String formattedAddress = "";

//		address 1 not empty
        if (!location.getAddress1().equals("")) {
            formattedAddress += location.getAddress1() + " ";
        }

//		address 2 not empty
        if (!location.getAddress2().equals("")) {
            formattedAddress += location.getAddress2() + ", ";
        }

//		neighborhood not empty
        if (!location.getNeighbourhood().equals("")) {
            formattedAddress += location.getNeighbourhood() + ", ";
        }
//		No neighborhood, just city
        else {
            formattedAddress += location.getLocality() + ", ";
        }

//		add state and zipcode
        formattedAddress += location.getState() + " " + location.getZipcode();

        return formattedAddress;
    }


    public static String getFullAddress(Location location) {

        String formattedAddress = "";

//		address 1 not empty
        if (!location.getAddress1().equals("")) {
            formattedAddress += location.getAddress1() + " ";
        }

//		address 2 not empty
        if (!location.getAddress2().equals("")) {
            formattedAddress += location.getAddress2() + ", ";
        }

//		neighborhood not empty
        if (!location.getNeighbourhood().equals("")) {
            formattedAddress += location.getNeighbourhood() + ", ";
        }
//		No neighborhood, just city
        else {
            formattedAddress += location.getLocality() + ", ";
        }

//		county not empty
        if (!location.getCounty().equals("")) {
            formattedAddress += location.getCounty() + ", ";
        }

//		add state and zipcode
        formattedAddress += location.getState() + " " + location.getZipcode() + ", " + location.getCountry();

        return formattedAddress;
    }
}
