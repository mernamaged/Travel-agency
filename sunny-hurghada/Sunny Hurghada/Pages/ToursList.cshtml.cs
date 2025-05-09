using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Sunny_Hurghada.Managers;
using Sunny_Hurghada.Models;

namespace Sunny_Hurghada.Pages
{
    public class ToursListModel : PageModel
    {
        private readonly TourManager _tourManager;
        public ToursListModel(TourManager tourManager)
        {
            _tourManager = tourManager;
        }

        [FromRoute]
        public string Name { get; set; } = string.Empty;
        [BindProperty]
        public int TotalToursSelected { get; private set; }

        public List<Tour> SelectedTourList { get; private set; }
        [BindProperty(SupportsGet = true)]
        public string CurrentCulture { get; set; } = "en";
        public async Task OnGet()
        {
            SelectedTourList = await _tourManager.GetTours(Name);
            TotalToursSelected = SelectedTourList.Count;
        }
    }
}
