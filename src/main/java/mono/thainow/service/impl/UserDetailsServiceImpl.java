package mono.thainow.service.impl;

import mono.thainow.domain.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private UserServiceImpl userSDI;

    //	this function is called when Sign-in and Validate token
//	this is called automatically because UserDetailsService interface that has only one method
    @Override
    public UserDetails loadUserByUsername(String query) throws UsernameNotFoundException {

        String[] splitQuery = query.split(",");
        User user = null;

//		sign-in case
        if (splitQuery.length == 2) {
            String loginVia = splitQuery[0].trim();

            switch (loginVia) {
                case "email-login": {
                    String email = splitQuery[1].trim();
                    user = userSDI.findActiveUserByEmail(email).get();
                }
                break;
                case "phone-login": {
                    String phone = splitQuery[1].trim();
                    String region = splitQuery[2].trim();
                    user = userSDI.findActiveUserByPhone(phone, region).get();
                }
                break;

                default:
            }
        }
//		validate token - this case the query is the sub value
        else if (splitQuery.length == 1) {
            String sub = splitQuery[0];
            user = userSDI.findActiveUserBySub(sub).get();
        }

        return UserDetailsImpl.build(user);
    }

}
