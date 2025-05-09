namespace Sunny_Hurghada.Models;

    public partial class TourPhoto
    
    {
        public string PhotoFullUrl
        {
            get
            {
                return $"/img/tours/{Photo}";
            }
        }
    }

