package Runner

import com.intuit.karate.Runner
import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._

import scala.concurrent.duration._
import scala.language.postfixOps

class CatsSimulation extends Simulation {

  MockUtils.startServer(0)

  val protocol = karateProtocol(


  )

  protocol.nameResolver = (req, ctx) => req.getHeader("karate-name")
  protocol.runner.karateEnv("perf")

  val create = scenario("create").exec(karateFeature("classpath:Features/cats-create.feature@perf")).exec(session => {
    println("*** id in gatling: " + session("id").as[String])
    println("*** session status in gatling: " + session.status)
    session
  })
  val delete = scenario("delete").group("delete cats") {
    exec(karateFeature("classpath:Features/cats-delete.feature@name=delete"))
  }

  val custom = scenario("SearchTest").
    group("SearchTesting") {
      exec(karateFeature("classpath:Features/custom-rpc.feature"))
    }



  setUp(
    create.inject(
      nothingFor(5 seconds), // Pause for a given duration
      atOnceUsers(10), //Inject 10 Users at once
      constantUsersPerSec(10) during (20 seconds), // Induce 10 requests on every second and continues this process for 30 seconds
      rampUsers(10) during (50 seconds) // Linear Ramp up of the user
    ).protocols(protocol),

    delete.inject(
      nothingFor(10 seconds), // Pause for a given duration
      atOnceUsers(20), // Inject 10 Users at once
      constantUsersPerSec(10) during (10 seconds), // Induce 10 requests on every second and continues this process for 40 seconds
    ).protocols(protocol),

    custom.inject(
      nothingFor(15 seconds), // Pause for a given duration
      rampUsers(20) during (50 seconds) // Linear Ramp up of the user
    ).protocols(protocol),



  ).assertions(
    global.responseTime.max.between(100, 5000),
    global.failedRequests.percent.between(0,90),
    global.successfulRequests.percent.gt(80),
  ).maxDuration(2 minutes) // Configuring the maximum duration of your simulation. It is useful when we need to bound the duration the simulation when we can’t predict it.

}