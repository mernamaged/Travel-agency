using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Sunny_Hurghada.DTOs;
using Sunny_Hurghada.Managers;
using Sunny_Hurghada.Models;

namespace Sunny_Hurghada.Pages
{
    public class TransferModel : PageModel
    {
        private readonly TransferManager _transferManager;
        private readonly GuestManager _guestManager;

        public TransferModel(TransferManager transferManager, GuestManager guestManager)
        {
            _transferManager = transferManager;
            _guestManager = guestManager;
        }

        [BindProperty]
        public TransferBookingInfo NewTransfer { get; set; }
        [BindProperty]
        public GuestInfo NewGuest  { get; set; }
        [BindProperty(SupportsGet = true)]
        public string CurrentCulture { get; set; } = "en";
        public IActionResult OnPost()
        {
            if (!ModelState.IsValid)
            {
                NewTransfer.Status = "Failed: Invalid input";
                return Page();
            }
            NewTransfer.Status = "Success";
            var guest = new Guest
            {
                FullName = NewGuest.FullName,
                Email = NewGuest.Email,
                Phone = NewGuest.Phone
            };

            _guestManager.Add(guest); 

            var transfer = new TransferBooking
            {
                Destination = NewTransfer.Destination,
                PickUpLocation = NewTransfer.PickUpLocation,
                Adults = NewTransfer.Adults,
                Children = NewTransfer.Children,
                PickUpDateTime = NewTransfer.PickUpDateTime,
                TotalAmount = 100,
                Status = NewTransfer.Status,
                CreatedAt = DateTime.Now,
                GuestId = guest.Id
            };

            _transferManager.Add(transfer);
            return Page();
        }

    }
}

