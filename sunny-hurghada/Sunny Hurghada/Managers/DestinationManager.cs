using Microsoft.EntityFrameworkCore;
using Sunny_Hurghada.Models;

namespace Sunny_Hurghada.Managers
{
    public class DestinationManager
    {
        private SunnyHurghadaContext _context;
        public DestinationManager(SunnyHurghadaContext context)
        {
            _context = context;
        }
        public async Task< List<Destination>> GetAllDestinations()
        {
            return await _context.Destinations.ToListAsync();
        }
        public async Task<List<string>> GetDestinationsNames()
        {
            return await _context.Destinations.Select(t => t.Name).ToListAsync();
        }
    }
}
