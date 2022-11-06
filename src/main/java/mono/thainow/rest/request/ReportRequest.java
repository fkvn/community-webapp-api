package mono.thainow.rest.request;

import java.util.ArrayList;
import java.util.List;

import lombok.Getter;

@Getter
public class ReportRequest {

	private String sender = "";

	private String type = "";

	private Long typeId = null;

	private String subject = null;

	private String message = "";

	private List<String> reasons = new ArrayList<>();
}
