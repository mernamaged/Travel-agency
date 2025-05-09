using System.ComponentModel.DataAnnotations;
namespace Sunny_Hurghada.DTOs;

    public class TransferBookingInfo
    {
        [Required(ErrorMessage = "Destination is required.")]
        public string Destination { get; set; }

        [Required(ErrorMessage = "Pick-up location is required.")]
        public string PickUpLocation { get; set; }

        [Range(1, int.MaxValue, ErrorMessage = "There must be at least 1 adult.")]
        public int Adults { get; set; }

        [Range(0, 20, ErrorMessage = "Children must be between 0 and 20.")]
        public int Children { get; set; }

        [Required(ErrorMessage = "Pick-up date and time is required.")]
        [CustomDateValidation(ErrorMessage = "Pick-up date and time cannot be in the past.")]
        public DateTime PickUpDateTime { get; set; }
        public string? Status { get; set; }

        public string? SpecialRequest { get; set; }
}

