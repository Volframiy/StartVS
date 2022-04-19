@isTest
private class AnimalLocatorTest {
    @isTest
    private static void test(){
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
                
        System.assertEquals('chicken', AnimalLocator.getAnimalNameById(1));
    }

}