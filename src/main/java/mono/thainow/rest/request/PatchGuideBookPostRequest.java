package mono.thainow.rest.request;

import lombok.Getter;
import mono.thainow.domain.post.guideBook.GuideBook;

@Getter
public class PatchGuideBookPostRequest extends PostRequest {

    private GuideBook guideBook;
    
}
