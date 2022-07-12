package trafficAPI

import io.gatling.core.Predef._
import com.intuit.karate.gatling.PreDef._

import scala.concurrent.duration._
import scala.language.postfixOps

class UserSimulation extends Simulation{

  val getUser = scenario(scenarioName = "getCall").exec(karateFeature("classpath:trafficAPI/traffic.feature"))
  setUp(

    getUser.inject(rampUsers(5) during(5 seconds)
  )

}
