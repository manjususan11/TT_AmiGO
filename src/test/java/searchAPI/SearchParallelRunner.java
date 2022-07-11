package searchAPI;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit4.Karate;

public class SearchParallelRunner {
	 @Test
	    public void testParallel() {
		    //For execution based on tags
	        //
		    Results results = Runner.path("classpath:searchAPI").parallel(5);
	        assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
	    }
}
