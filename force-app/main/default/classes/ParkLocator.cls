public class ParkLocator {
    public static List<String> country(String str){
        ParkService.ParksImplPort park = new ParkService.ParksImplPort(); 
        return park.byCountry(str);
    }
}