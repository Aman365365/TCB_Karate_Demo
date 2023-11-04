package RecordedStubs;

import com.github.tomakehurst.wiremock.WireMockServer;
import com.github.tomakehurst.wiremock.client.WireMock;
import com.github.tomakehurst.wiremock.recording.SnapshotRecordResult;
import com.github.tomakehurst.wiremock.stubbing.StubMapping;
import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.util.List;

public class RecordingMock {

    private static final String HOST = "localhost";
    private static final int port = 8080;
    private static WireMockServer server = new WireMockServer(port);




    @BeforeAll
    public static void setup() {
        server.start();
        WireMock.configureFor(HOST,port);
       // stubbing();
    }



    @AfterAll
    public static void tear() {
        server.stop();;

    }

    public static void startRecoding(){
        server.startRecording("http://reqres.in");
    }
    public static void stubbing() {

        SnapshotRecordResult snapshotRecordResult =server.stopRecording();
        List<StubMapping> stubMappings = snapshotRecordResult.getStubMappings();


    };



    @Test
    @Karate.Test
    Karate json() {

       // stubbing();

        return Karate.run("classpath:Features/RecordingMock.feature").relativeTo(getClass());
    }
}

