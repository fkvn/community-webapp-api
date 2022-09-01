package mono.thainow.search;

import java.util.Map;
import java.util.Optional;

import org.hibernate.search.engine.backend.document.DocumentElement;
import org.hibernate.search.engine.backend.document.IndexFieldReference;
import org.hibernate.search.engine.backend.document.IndexObjectFieldReference;
import org.hibernate.search.engine.backend.document.model.dsl.IndexSchemaElement;
import org.hibernate.search.engine.backend.document.model.dsl.IndexSchemaObjectField;
import org.hibernate.search.engine.backend.types.IndexFieldType;
import org.hibernate.search.engine.backend.types.ObjectStructure;
import org.hibernate.search.mapper.pojo.bridge.PropertyBridge;
import org.hibernate.search.mapper.pojo.bridge.binding.PropertyBindingContext;
import org.hibernate.search.mapper.pojo.bridge.mapping.programmatic.PropertyBinder;
import org.hibernate.search.mapper.pojo.bridge.runtime.PropertyBridgeWriteContext;

public class HousingInteriorSummary implements PropertyBinder {

	@Override
	public void bind(PropertyBindingContext context) {

		context.dependencies().use("interior");

		IndexSchemaObjectField summaryField = context.indexSchemaElement().objectField("interiorSummary");

		IndexFieldType<Integer> amountFieldType = context.typeFactory().asInteger().toIndexFieldType();

		context.bridge(
				new Bridge(summaryField.toReference(), summaryField.field("guest", amountFieldType).toReference(),
						summaryField.field("bed", amountFieldType).toReference(),
						summaryField.field("bath", amountFieldType).toReference(),
						summaryField.field("parking", amountFieldType).toReference()));

	}

	private static class Bridge implements PropertyBridge<Object> {

		private final IndexObjectFieldReference summaryField;
		private final IndexFieldReference<Integer> guest;
		private final IndexFieldReference<Integer> bed;
		private final IndexFieldReference<Integer> bath;
		private final IndexFieldReference<Integer> parking;

		public Bridge(IndexObjectFieldReference summaryField, IndexFieldReference<Integer> guest,
				IndexFieldReference<Integer> bed, IndexFieldReference<Integer> bath,
				IndexFieldReference<Integer> parking) {
			this.summaryField = summaryField;
			this.guest = guest;
			this.bed = bed;
			this.bath = bath;
			this.parking = parking;
		}

		@Override
		public void write(DocumentElement target, Object bridgedElement, PropertyBridgeWriteContext context) {
			@SuppressWarnings("unchecked")
			Map<String, Integer> interior = (Map<String, Integer>) bridgedElement;

			Integer guest = Optional.ofNullable(interior.get("guest")).orElse(0);
			Integer bed = Optional.ofNullable(interior.get("bed")).orElse(0);
			Integer bath = Optional.ofNullable(interior.get("bath")).orElse(0);
			Integer parking = Optional.ofNullable(interior.get("parking")).orElse(0);

			DocumentElement summary = target.addObject(this.summaryField);
			summary.addValue(this.guest, guest);
			summary.addValue(this.bed, bed);
			summary.addValue(this.bath, bath);
			summary.addValue(this.parking, parking);
		}
	}

}
