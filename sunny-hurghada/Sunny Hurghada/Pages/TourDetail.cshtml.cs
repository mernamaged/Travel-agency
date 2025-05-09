using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Sunny_Hurghada.DTOs;
using Sunny_Hurghada.Managers;
using Sunny_Hurghada.Models;

namespace Sunny_Hurghada.Pages
{
    public class TourDetailModel : PageModel
    {
        private readonly TourManager tourManager;
        private readonly GuestManager _guestManager;

        public TourDetailModel(TourManager tourManager, GuestManager guest)
        {
            this.tourManager = tourManager;
            _guestManager=guest;
        }

        [BindProperty(SupportsGet = true)]
        public int Id { get; set; }

        [BindProperty]
        public Tour TourDetails { get; set; }

        [BindProperty]
        public TourBookingInfo NewTourBooking { get; set; }
        [BindProperty]
        public GuestInfo NewGuest { get; set; }
        [BindProperty(SupportsGet = true)]
        public string CurrentCulture { get; set; } = "en";
        public async Task OnGet()
        {
            TourDetails = await tourManager.GetTourDetails(Id);
        }

        public async Task<IActionResult> OnPost()
        {
            if (!ModelState.IsValid)
            {
                NewTourBooking.Status = "Failed: Invalid input";
                return Page();
            }
            NewTourBooking.Status = "Success";
            var guest = new Guest
            {
                FullName = NewGuest.FullName,
                Email = NewGuest.Email,
                Phone = NewGuest.Phone
            };
            _guestManager.Add(guest);

            var tourBooking = new TourBooking
            {
                TourId = Id,
                Adults = NewTourBooking.Adults,
                Children = NewTourBooking.Children,
                TripDate = NewTourBooking.TripDate,
                TotalAmount = GetTotalAmount(),
                Status = NewTourBooking.Status,
                CreatedAt = DateTime.Now,
                GuestId = guest.Id
            };

            TourDetails = await tourManager.GetTourDetails(Id);

            tourManager.Add(tourBooking);

            return RedirectToPage();
        }
        private decimal GetTotalAmount()
        {
            decimal AdultsPrice = TourDetails.AdultPrice * NewTourBooking.Adults;
            decimal ChildrenPrice = TourDetails.ChildPrice * NewTourBooking.Children;
            return AdultsPrice + ChildrenPrice;
        }
    }
}
