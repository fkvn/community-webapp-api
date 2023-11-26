package mono.thainow.rest.controller;

import mono.thainow.service.PhoneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/phones")
public class PhoneController {

    @Autowired
    private PhoneService phoneService;

    @GetMapping("/exist")
    @ResponseStatus(HttpStatus.ACCEPTED)
    public Boolean isPhoneExisting(@RequestParam String phone, @RequestParam String region) {
        Boolean isPhoneExisting = phoneService.isPhoneExisting(phone, region);
        return isPhoneExisting;
    }

}
