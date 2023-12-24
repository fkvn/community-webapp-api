package mono.thainow.search;

import org.hibernate.search.mapper.pojo.bridge.ValueBridge;
import org.hibernate.search.mapper.pojo.bridge.runtime.ValueBridgeToIndexedValueContext;

public class EnumAsString implements ValueBridge<Enum, String> {

    @Override
    public String toIndexedValue(Enum value, ValueBridgeToIndexedValueContext context) {
        return value == null ? null : value.toString();
    }

}
