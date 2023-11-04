package Runner


import com.google.common.math.IntMath.mean
import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._

import scala.concurrent.duration._
import scala.concurrent.duration._
import scala.language.postfixOps
import scala.concurrent.duration._

import io.gatling.core.Predef._
import io.gatling.http.Predef._



class RampupConcurrentusers extends Simulation {

  val protocol = karateProtocol(


  )


  var getuser = scenario("getUsers").exec(karateFeature("classpath:Features/Demo1.feature"))

  setUp(
    getuser.inject(
      nothingFor(5), // 1
      atOnceUsers(10), // 2
      rampUsers(50).during(30 seconds) // 3
    ).protocols(protocol)
  ).maxDuration(1 minute)
      // 1
       // 2









}
