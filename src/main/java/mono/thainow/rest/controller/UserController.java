package mono.thainow.rest.controller;

import com.fasterxml.jackson.annotation.JsonView;
import mono.thainow.annotation.AdminAndSAdminAccess;
import mono.thainow.domain.user.User;
import mono.thainow.repository.UserRepository;
import mono.thainow.rest.request.ChangePasswordRequest;
import mono.thainow.service.UserService;
import mono.thainow.view.View;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping("/api/users")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/byEmail")
    @JsonView(View.Basic.class)
    @ResponseStatus(HttpStatus.ACCEPTED)
    public User findUserByEmail(@RequestParam String email) {
        return userService.findUserByEmail(email).get();
    }

    @GetMapping("/byPhone")
    @JsonView(View.Basic.class)
    @ResponseStatus(HttpStatus.ACCEPTED)
    public User findUserByPhone(@RequestParam String phone, @RequestParam String region) {
        return userService.findUserByPhone(phone, region).get();
    }

    @PostMapping("/{userId}/password")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void changePassword(@PathVariable Long userId,
                               @Valid @RequestBody ChangePasswordRequest request) {
        userService.changePassword(userId, request.getPassword());
    }


    @PatchMapping("/{userId}/activate")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @AdminAndSAdminAccess
    public void activateUser(@PathVariable Long userId) {
        userService.activateUserById(userId);
    }

}
