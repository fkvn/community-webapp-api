package mono.thainow.rest.response;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonView;

import lombok.Getter;
import lombok.Setter;
import mono.thainow.view.View;

@Getter
@Setter
@JsonView(View.Basic.class)
public class SearchResponse<T> {

	private long totalPage;

	private long totalCount;

	private List<T> fetchResult;
}
