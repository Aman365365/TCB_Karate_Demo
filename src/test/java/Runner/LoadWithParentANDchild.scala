package Runner

import com.intuit.karate.Runner
import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._

import scala.concurrent.duration._
import scala.language.postfixOps



class LoadWithParentANDchild extends Simulation{

  val protocol = karateProtocol(

  )

  val injectionProfile1 = rampUsers(50).during(50)
  val injectionProfile2 = rampUsers(100).during(50)



   val parent = scenario("parent").exec(karateFeature("classpath:Features/cats-create.feature@perf"))


   val child1 = scenario("child1").group("delete cats") {
     exec(karateFeature("classpath:Features/cats-delete.feature@name=delete"))
   }
     val child2 = scenario("child2").
       group("SearchTesting") {
         exec(karateFeature("classpath:Features/custom-rpc.feature"))
       }




  setUp(
           // parent load won't be sharded
           parent.inject(
             nothingFor(4), // 1
             atOnceUsers(10), // 2
             rampUsers(10).during(5)).noShard
             .andThen(
               // child load will be sharded
               child1.inject(injectionProfile1)
             ).andThen(
             // child2 will start when last grandChild and child2 users will terminate
             child2.inject(injectionProfile2)
           )
         )
       }
