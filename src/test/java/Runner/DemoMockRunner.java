package Runner;

 import com.intuit.karate.Runner;
 import com.intuit.karate.Results;
 import com.intuit.karate.core.MockServer;
 import org.junit.jupiter.api.AfterAll;
 import org.junit.jupiter.api.BeforeAll;
 import org.junit.jupiter.api.Test;
 import static org.junit.jupiter.api.Assertions.*;


        public class DemoMockRunner {

        	 static MockServer server;

        	    @BeforeAll
        	   public static void beforeAll() {
        	        server = MockServer.feature("classpath:Features/KarateNettyMock.feature").http(8080).build();
        	    }

        	   @AfterAll
        	  public static void afterAll() {
        	     server.stop();
        	   }

        	    @Test
        	    void testParallel() {
        	        Results results = Runner.path("classpath:Features/KarateNetty.feature")
        	                .systemProperty("demo.server.port", server.getPort() + "")
        	                .systemProperty("demo.server.http", "true")
        	                .parallel(1);
        	        assertTrue(results.getFailCount() == 0, results.getErrorMessages());
        	    }

        	}
