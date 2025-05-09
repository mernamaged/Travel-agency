using System.ComponentModel.DataAnnotations;

namespace Sunny_Hurghada.DTOs
{
    public class CustomDateValidation : ValidationAttribute
    {
        public CustomDateValidation()
        {
            ErrorMessage = "Date cannot be in the past.";
        }

        public override bool IsValid(object? value)
        {
            if (value == null)
                return true; 

            if (value is DateOnly date)
            {
                return date >= DateOnly.FromDateTime(DateTime.Today);
            }

            if (value is DateTime dateTime)
            {
                return dateTime.Date >= DateTime.Today;
            }

            return false;
        }
    }
}
