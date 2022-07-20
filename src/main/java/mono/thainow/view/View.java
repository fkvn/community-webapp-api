package mono.thainow.view;

public class View {
	
	public static class UserView {
		public static class Public {}
		public static class Private extends Public {}
	}
	
	public static class Company {
		public static class Basic {}
		public static class Detail extends Basic {}
	}
}
