public class ParkLocator {

    public static List<String> country(String name)
    {
        ParkService.ParksImplPort parks = new ParkService.ParksImplPort();
        return parks.byCountry(name);
    }
}