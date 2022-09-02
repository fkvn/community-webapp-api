package mono.thainow.search;

import java.util.Map;

import org.hibernate.search.engine.backend.document.DocumentElement;
import org.hibernate.search.engine.backend.document.IndexObjectFieldReference;
import org.hibernate.search.engine.backend.document.model.dsl.IndexSchemaElement;
import org.hibernate.search.engine.backend.document.model.dsl.IndexSchemaObjectField;
import org.hibernate.search.mapper.pojo.bridge.PropertyBridge;
import org.hibernate.search.mapper.pojo.bridge.binding.PropertyBindingContext;
import org.hibernate.search.mapper.pojo.bridge.mapping.programmatic.PropertyBinder;
import org.hibernate.search.mapper.pojo.bridge.runtime.PropertyBridgeWriteContext;

public class HousingInteriorSummary implements PropertyBinder {

	@Override
	public void bind(PropertyBindingContext context) {

		context.dependencies().useRootOnly();

		IndexSchemaElement schemaElement = context.indexSchemaElement();

		IndexSchemaObjectField summaryField = schemaElement.objectField("interiorObj");

		summaryField.fieldTemplate("interiorObjTemplate", fieldTypeFactory -> fieldTypeFactory.asInteger());

		context.bridge(Map.class, new Bridge(summaryField.toReference()));

	}

	@SuppressWarnings("rawtypes")
	private static class Bridge implements PropertyBridge<Map> {

		private final IndexObjectFieldReference summaryField;

		public Bridge(IndexObjectFieldReference summaryField) {

			this.summaryField = summaryField;

		}

		@Override
		public void write(DocumentElement target, Map bridgedElement, PropertyBridgeWriteContext context) {
			@SuppressWarnings("unchecked")
			Map<String, Integer> interiorSet = (Map<String, Integer>) bridgedElement;

			DocumentElement summary = target.addObject(this.summaryField);

			summary.addValue("guest", interiorSet.get("guest"));
			summary.addValue("bed", interiorSet.get("bed"));
			summary.addValue("bath", interiorSet.get("bath"));
			summary.addValue("parking", interiorSet.get("parking"));
		}
	}

}
