package Runner;


import com.github.tomakehurst.wiremock.WireMockServer;
import com.github.tomakehurst.wiremock.client.WireMock;
import org.junit.Rule;
import com.intuit.karate.junit5.Karate;
import static com.github.tomakehurst.wiremock.client.WireMock.*;
import com.github.tomakehurst.wiremock.junit.*;

import org.junit.After;
import org.junit.Before;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;


public class MockingObjectRunner {

	private static final String HOST = "localhost";
	private static final int port = 8080;
	private static WireMockServer server = new WireMockServer(port);




	@BeforeAll
	public static void setup() {
		server.start();
		WireMock.configureFor(HOST,port);

	}



	@AfterAll
	public static void tear() {
		server.stop();;

	}

	public static void stubbing() {
		stubFor(get(urlEqualTo("/whatssup")).willReturn(aResponse().withStatus(200)
				.withHeader("ContenType", "application/json").withBodyFile("books.json")));
	}

	public static void stubForPostRequest() {

		stubFor(post(urlEqualTo("/userId/id")).withRequestBody(matchingJsonPath("$.username")).withRequestBody(matchingJsonPath("$.password")).willReturn(aResponse().withStatus(201)
				.withHeader("ContenType", "application/json").withBodyFile("PutJson.json")));

	}

	public static void stubForPutRequest() {
		stubFor(put(urlEqualTo("/id=7")).withRequestBody(matchingJsonPath("$.username")).withRequestBody(matchingJsonPath("$.password")).willReturn(aResponse().withStatus(202)
				.withHeader("ContenType", "application/json").withBodyFile("PutJson.json")));
	}

	public static void stubForBadRequest() {
		stubFor(get(urlEqualTo("/apk/jar")).willReturn(aResponse().withStatus(400)
				.withHeader("ContenType", "application/json")));
	}

	@Test
	@Karate.Test
	Karate json() {

		stubbing();

		return Karate.run("classpath:Features/WireMock.feature").relativeTo(getClass());
	}
}

				
	
