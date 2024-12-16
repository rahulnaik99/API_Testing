package test;
import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class BaseTest {

    @Test
    public Karate Money() {
        return Karate.run("getRequest.feature").relativeTo(getClass());
    }

}
