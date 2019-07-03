package contracts;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit4.Karate;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;
import test.ServerStart;

/**
 *
 * @author pthomas3
 */
@RunWith(Karate.class)
@KarateOptions
public class ContractsRunner {
    
    private static ServerStart server;
    
    private static int startServer() throws Exception {
        if (server == null) { // keep spring boot side alive for all tests including package 'mock'
            server = new ServerStart();
            server.start(new String[]{"--server.port=0", "--spring.profiles.active=test"}, false);
        }
        System.setProperty("main.server.port", server.getPort() + "");
        return server.getPort();
    }

    @BeforeClass
    public static void beforeClass() throws Exception {
        startServer();
    }
    
}
