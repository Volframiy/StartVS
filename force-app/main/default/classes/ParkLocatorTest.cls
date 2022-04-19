@isTest
private class ParkLocatorTest {
    @isTest
    private static void test(){
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        
        List<String> ls = ParkLocator.country('Japan');
        
        System.assertEquals('Omaha', ls[0]);
    }

}