package Runner

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._

import scala.concurrent.duration._
import scala.language.postfixOps


class ScalaClass extends Simulation{
    // Define the protocol for your test
  val protocol = karateProtocol(


  )

  // Load your Karate feature file
  var getuser = scenario("getUsers").exec(karateFeature("classpath:Features/cats-create.feature"))

  val delete = scenario("delete").group("delete cats") {
    exec(karateFeature("classpath:Features/cats-delete.feature@name=delete"))
  }
  val custom = scenario("custom").exec(karateFeature("classpath:Features/custom-rpc.feature"))
  // Define user counts and ramp-up duration
  val users = 50
  val rampUpDuration = 10 seconds

  // Define simulation duration
  val testDuration = 2 minutes


  val createAndRead = scenario("createAndRead").group("createAndRead")(exec(getuser)
    .pause(2)
    .exec(delete)
    .pause(2)
    .exec(custom))



  // Run the Gatling simulation using the Karate feature
  setUp(
    createAndRead.inject(
      nothingFor(5),
      atOnceUsers(10),
      rampUsers(users).during(rampUpDuration))
  ).protocols(protocol)
    .maxDuration(1 minute)
    .assertions(details("createAndRead")
      .failedRequests.percent.is(0))
}


