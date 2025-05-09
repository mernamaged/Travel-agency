using System.ComponentModel.DataAnnotations;

namespace Sunny_Hurghada.DTOs;
    public partial class TourBookingInfo
    {
        [Required(ErrorMessage = "Trip date is required.")]
        [CustomDateValidation(ErrorMessage = "Trip date cannot be in the past.")]
        public DateOnly TripDate { get; set; }

        [Range(1, int.MaxValue, ErrorMessage = "There must be at least 1 adult.")]
        public int Adults { get; set; }

        [Range(0, 20, ErrorMessage = "Children must be between 0 and 20.")]
        public int Children { get; set; }

        [Required(ErrorMessage = "Nationality is required.")]
        public string Nationality { get; set; }
        public string? Status { get; set; }

        public string? SpecialRequest { get; set; }
}

