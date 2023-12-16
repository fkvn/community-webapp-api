package mono.thainow.domain.post.guideBook;

import com.fasterxml.jackson.annotation.JsonView;
import lombok.Getter;
import mono.thainow.view.View;

@Getter
@JsonView(View.Basic.class)
public enum GuideBookCategory {

    BASIC_LIVING, MOVING_TO_US, LIVING_PERMANENTLY, TRAVEL, LEARNING, TRANSFER, HEALTH, KIDS,
    BUSINESS_AND_INVESTMENT, THAI_PRIDE

}
