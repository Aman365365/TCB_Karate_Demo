package Runner;
import com.intuit.karate.junit5.Karate;
public class TestRunnerShoppingCart
{
    @Karate.Test
    Karate AddToCart() {
        return Karate.run("classpath:Features/AddToCart.feature").relativeTo(getClass());
    }
    @Karate.Test
    Karate SwaggerCall() {
        return Karate.run("classpath:Features/SwaggerCall.feature").relativeTo(getClass());
    }

    @Karate.Test
    Karate SwaggerPostCall() {
        return Karate.run("classpath:Features/SwaggerPostCall.feature").relativeTo(getClass());
    }

}
