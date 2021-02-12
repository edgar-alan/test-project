@IsTest
public class AnimalLocatorTest {
	
    @IsTest public static void getAnimalNameById_test()
    {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String name = AnimalLocator.getAnimalNameById(1);
    }
}