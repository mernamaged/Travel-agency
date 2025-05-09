using Sunny_Hurghada.DTOs;
using Sunny_Hurghada.Models;

namespace Sunny_Hurghada.Managers
{
    public class TransferManager
    {
        private SunnyHurghadaContext context;

        public TransferManager(SunnyHurghadaContext context)
        {
            this.context= context;
        }
        public void Add(TransferBooking transfer)
        {
            context.TransferBookings.Add(transfer);
            context.SaveChanges();
        }
    }
}
