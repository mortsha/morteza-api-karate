package api.data;

public class DataGenerator {

	public static String getEmail() {
		String email = "Mori";
		String provider = "@gmail.com";
		int number = (int) (Math.random() * 1000);
		String randomEmail = email + number + provider;
		return randomEmail;

	}

}
