package Runner;

import com.intuit.karate.junit5.Karate;
public class UIAutomation_RunAction {
    @Karate.Test
    Karate UIAutomation(){
        return Karate.run("classpath:Features").tags("UI_Automation").relativeTo((getClass()));
    }
}
