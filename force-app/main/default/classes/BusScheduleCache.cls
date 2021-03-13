public class BusScheduleCache {

    private Cache.OrgPartition part;
    
    public BusScheduleCache()
    {
        part = Cache.Org.getPartition('local.BusSchedule');
    }
    
    public void putSchedule(String busLine, Time[] schedule)
    {
        part.put(busLine, schedule);
    }
    
    public Time[] getSchedule(String busLine)
    {
        Time[] schedule ;
        
        if(part.get(busLine) == null)
        {
            schedule = new List<Time>();
            schedule.add(Time.newInstance(8, 0, 0, 0));
            schedule.add(Time.newInstance(17, 0, 0, 0));
        }
        else
            schedule = (Time[]) part.get(busLine);
            
        
       	return schedule;
    }
}