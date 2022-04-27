package mono.thainow.domain.post.deal;

import java.util.Arrays;
import java.util.stream.Collectors;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.PrePersist;
import javax.validation.constraints.NotEmpty;

import org.springframework.data.annotation.Transient;
import org.springframework.util.Assert;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import mono.thainow.domain.post.Post;
import mono.thainow.util.Util;

@Getter
@Setter
@ToString
@RequiredArgsConstructor
@Entity
@DiscriminatorValue("DEAL")
public class DealPost extends Post {

	/**
	* 
	*/
	private static final long serialVersionUID = 1L;

	@Getter
	private static final String[] DEAL_CATEGORY = { "Restaurant", "Massage / Spa", "Beauty", "Insurance",
			"Auto Services", "Travel", "Retail", "Market", "Factory", "Financial" };

	private boolean isOnlineDeal = false;

	@NotEmpty
	private String category = "";

	@Enumerated(EnumType.STRING)
	@Column(name = "DEAL_DISCOUNT_TYPE")
	private DealDiscountType discountType;

	private String discountValue = "";

	@PrePersist
	private void validateDeal() {

//		validate category
		this.category = validateCategory();
		
//		validate discount type
		validateDiscountType();

	}

	public String validateCategory() {

		Assert.isTrue(!this.category.isEmpty(), "Category can't be empty");
		
		String category = this.category;

		int categoryIdx = Arrays.stream(DealPost.DEAL_CATEGORY).map(ctg -> ctg.toUpperCase())
				.collect(Collectors.toList()).indexOf(category.toUpperCase());

		if (categoryIdx >= 0) {
			category = DealPost.DEAL_CATEGORY[categoryIdx];
		}
		
		return category;
		
	}

	@Transient
	public void validateDiscountType() {
		Assert.isTrue(this.discountType != null, "Invalid Discount Type");

		switch (this.discountType) {
		case PERCENT_OFF: {
//			get percent off
			Integer percent = Util.getIntegerNumeric(discountValue);

//			assert that is invalid number
			Assert.isTrue(percent != null, "Invalid Percentage!");

//			0-100 range
			Assert.isTrue(percent >= 0 && percent <= 100, "Out of range for percentage!");

		}
			break;

		default:
			Assert.isTrue(!discountValue.isEmpty(), "Invalid Discount Value");
			break;
		}
	}

}
