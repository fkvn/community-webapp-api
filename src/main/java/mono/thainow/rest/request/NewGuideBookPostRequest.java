package mono.thainow.rest.request;

import lombok.Getter;
import mono.thainow.domain.post.guideBook.GuideBook;

@Getter
public class NewGuideBookPostRequest extends PostRequest {

    private GuideBook guideBook;


}
