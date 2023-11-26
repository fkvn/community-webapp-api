package mono.thainow.domain.google;

import com.google.maps.GeoApiContext;
import com.google.maps.GeocodingApi;
import com.google.maps.errors.ApiException;
import com.google.maps.model.AddressComponent;
import com.google.maps.model.GeocodingResult;
import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.Assert;

import java.io.IOException;

@Getter
@Setter
public class GoogleGeoAPI {

    private GeoApiContext context;

    @Value("${mono.thainow.googleapikey}")
    private String apiKey;

    public GoogleGeoAPI() {
        context = new GeoApiContext.Builder().apiKey(this.apiKey).build();
    }

    public GeocodingResult getLocationResultFromAddress(String address) {

        GeocodingResult[] results = {};

        try {
//			api calling
            results = GeocodingApi.geocode(context, address).region("us").await();

        } catch (ApiException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (InterruptedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        context.shutdown();

        Assert.isTrue(results.length == 1, "Invalid Place Results Length!");

        return results[0];
    }

    public AddressComponent[] getAddressComponent(GeocodingResult geoResult) {

        return geoResult.addressComponents;
    }

}
