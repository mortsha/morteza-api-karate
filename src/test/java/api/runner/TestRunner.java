package api.runner;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

	@Karate.Test
	Karate testSystemProperty() {
		// run() method required path to feature files.
		// you can use tags() method to specify the Tags.
		return Karate.run("classpath:features")
				.tags("Regression");
	}

}
