@IsTest
public class ParkLocatorTest {

	@IsTest static void parksByCountry_test()
    {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        ParkLocator.country('India');
        
    }
}