package Runner

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._

import scala.concurrent.duration._
import scala.language.postfixOps
import scala.util.Random

class CatsChainedSimulation extends Simulation {

  MockUtils.startServer(0)

  val protocol = karateProtocol(
    "/cats/{id}" -> Nil
  )

  val feeder = Iterator.continually(Map("name" -> (Random.alphanumeric.take(20).mkString + "-name")))

  val feederToKarate = scenario("feederToKarate")
    .exec(karateSet("name", session => session("name").as[String]))

  val create = scenario("create").exec(karateFeature("classpath:Features/cats-chained.feature@name=create"))

  val read = scenario("read").exec(karateFeature("classpath:Features/cats-chained.feature")).exec(session => {
    println("*** id in gatling: " + session("id").as[String])
    println("*** session status in gatling: " + session.status)
    session
  })

  val createAndRead = scenario("createAndRead").group("createAndRead") {
    feed(feeder)
      .exec(feederToKarate)
      .exec(create)
      // for demo: injecting a new variable name expected by the 'read' feature
      .exec(karateSet("expectedName", session => session("name").as[String]))
      .exec(read)
  }

  setUp(
    createAndRead.inject(nothingFor(5),atOnceUsers(10),rampUsers(50).during(30 seconds)).protocols(protocol)
  ).maxDuration(1 minute).assertions(details("createAndRead").failedRequests.percent.is(0))

}

