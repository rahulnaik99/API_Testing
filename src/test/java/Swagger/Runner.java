package Swagger;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class Runner {

    @Test
    public Karate run() {

        return  Karate.run("Feature/getRequest").relativeTo(getClass());

    }
    @Test
    public Karate runTestUsingClassPath(){
        return Karate.run("classpath:Swagger/Feature/getRequest.feature");
    }

}
