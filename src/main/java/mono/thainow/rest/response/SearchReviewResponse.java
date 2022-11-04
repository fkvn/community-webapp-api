package mono.thainow.rest.response;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonView;

import lombok.Getter;
import lombok.Setter;
import mono.thainow.view.View;

@Getter
@Setter
@JsonView(View.Basic.class)
public class SearchReviewResponse<T> extends SearchResponse<T> {

	private Map<Integer, Long> category;

	public Double getAvgRating() {
		try {

			BigDecimal avgRating = new BigDecimal(
					this.getCategory().keySet().stream().reduce(0, (total, e) -> total + e * this.getCategory().get(e).intValue(), Integer::sum)
							/ (double) this.getTotalCount()).setScale(1, RoundingMode.HALF_UP);

			return avgRating.doubleValue();
		} catch (Exception e) {
			return 0.0;
		}
	}

}
