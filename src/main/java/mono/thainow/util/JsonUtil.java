package mono.thainow.util;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class JsonUtil {

	public static void printObject(Object obj) {
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String prettyJsonString = gson.toJson(obj);
		System.out.println(prettyJsonString);
	}
}
