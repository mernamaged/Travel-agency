using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Sunny_Hurghada.Managers;
using Sunny_Hurghada.Models;

namespace Sunny_Hurghada.Pages
{
    public class IndexModel : PageModel
    {
        private readonly DestinationManager _destinationManager;
        private readonly TourManager _tourManager;

        public IndexModel(
            DestinationManager destinationManager,
            TourManager tourManager)
        {
            _destinationManager = destinationManager;
            _tourManager = tourManager;
        }

        public List<Destination> Destinations { get; set; }
        public List<TourTypeLocalized> TourTypesLocalized { get; set; }

        [BindProperty]
        public List<Tour> TourResults { get; set; } = new();

        [BindProperty(SupportsGet = true)]
        public int SelectedDestination { get; set; }

        [BindProperty(SupportsGet = true)]
        public int SelectedType { get; set; }
        [BindProperty(SupportsGet = true)]
        public string CurrentCulture { get; set; } = "en";
        public async Task OnGet()
        {
            TourTypesLocalized = await _tourManager.GetTourTypeLocalized();
            TourResults = await _tourManager.GetTours(SelectedDestination, SelectedType);
            Destinations = await _destinationManager.GetAllDestinations();
        }
    }
}

