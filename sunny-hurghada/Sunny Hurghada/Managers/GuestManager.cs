using Sunny_Hurghada.Models;

namespace Sunny_Hurghada.Managers
{
    public class GuestManager
    {
        private SunnyHurghadaContext context;

        public GuestManager(SunnyHurghadaContext context)
        {
            this.context= context;
        }
        public void Add(Guest guest)
        {
            context.Guests.Add(guest);
            context.SaveChanges();
        }
    }
}
