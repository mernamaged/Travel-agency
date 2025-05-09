using Microsoft.EntityFrameworkCore;
using Sunny_Hurghada.Models;
using System.Globalization;

namespace Sunny_Hurghada.Managers
{
    public class TourManager
    {
        private readonly SunnyHurghadaContext _context;
        private static int LanguageId => CultureInfo.DefaultThreadCurrentCulture.LCID;
        public TourManager(SunnyHurghadaContext context)
        {
            _context = context;
        }

        public async Task<Tour> GetTourDetails(int id)
        {
            return await GetAllLocalizedTours().Include(s => s.TourPhotos).FirstAsync(x => x.Id == id);
        }
        public async Task<List<Tour>> GetTours(string typeOrDestinationName)
        { 
            var tours = await GetAllLocalizedTours()
                .Where(t => t.TourType.TourTypeLocalizeds.Any(tt => tt.Name == typeOrDestinationName) ||t.Destination.Name == typeOrDestinationName)
                .ToListAsync();

            return tours;
        }

        public async Task<List<Tour>> GetTours(int? destinationId, int? tourTypeId )
        {
            var query = GetAllLocalizedTours();

            if (destinationId != 0)
            {
                query = query.Where(t => t.Destination.Id == destinationId);
            }

            if (tourTypeId!= 0)
            {
                query = query.Where(t => t.TourTypeId == tourTypeId);
            }
            return await query.ToListAsync(); 
        }

        public void Add(TourBooking tourBooking)
        {
            _context.TourBookings.Add(tourBooking);
            _context.SaveChanges();
        }
        public async Task<List<TourTypeLocalized>> GetTourTypeLocalized()
        {
            return await _context.TourTypeLocalizeds
              .Where(t => t.LanguageId == LanguageId)
             .ToListAsync();
        }
        private IQueryable<Tour> GetAllLocalizedTours()
        {
            return _context.Tours
                .Include(s => s.Destination)
                .Include(s => s.TourType)
                .Include(s => s.TourLocalizeds.Where(s => s.LanguageId == LanguageId))
                .Include(s => s.TourType.TourTypeLocalizeds.Where(s => s.LanguageId == LanguageId));
        }
    }
}
